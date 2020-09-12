import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xmux/components/empty_error.dart';
import 'package:xmux/components/refreshable.dart';
import 'package:xmux/components/width_limited.dart';
import 'package:xmux/generated/l10n_keys.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/epayment/epayment.dart';
import 'package:xmux/redux/actions/actions.dart';

enum _EPaymentPageStage {
  initializing,
  initialized,
  tos,
  normal,
}

class EPaymentPage extends StatefulWidget {
  @override
  _EPaymentPageState createState() => _EPaymentPageState();
}

class _EPaymentPageState extends State<EPaymentPage> {
  final _api = EPaymentApi()
    ..withCredential(
      store.state.user.campusId,
      store.state.user.ePaymentPassword ?? store.state.user.profile?.id ?? '',
    );

  /// The stage of page.
  var _status = _EPaymentPageStage.initializing;

  List<PaymentRecord> _records;

  void _inputPassword() async {
    var controller = TextEditingController();
    await showDialog(
      context: context,
      barrierDismissible: false,
      child: AlertDialog(
        title: Text(LocaleKeys.Campus_ToolsEPaymentLoginFailed.tr()),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(LocaleKeys.Campus_ToolsEPaymentLoginFailedHint.tr()),
            TextField(
              controller: controller,
              obscureText: true,
              decoration: InputDecoration(
                labelText: LocaleKeys.Campus_ToolsEPaymentPasswordLabel.tr(),
              ),
            ),
          ],
        ),
        actions: [
          FlatButton(
            child: Text(MaterialLocalizations.of(context).okButtonLabel),
            onPressed: () async {
              _api.withCredential(store.state.user.campusId, controller.text);
              // Go back to initialization stage.
              _init();
              Navigator.of(context).pop();
              if (mounted)
                setState(() => _status = _EPaymentPageStage.initializing);
              // Update E-Payment password.
              store.dispatch(UpdateEPaymentPasswordAction(controller.text));
            },
          ),
        ],
      ),
    );
  }

  Future<void> _init() async {
    try {
      await _api.login();
      _records = await _api.payment;
      if (mounted) setState(() => _status = _EPaymentPageStage.normal);
    } catch (e) {
      if (mounted) setState(() => _status = _EPaymentPageStage.initialized);
      if (e == 'Login Failed') _inputPassword();
      if (e == 'TOS' && mounted)
        setState(() => _status = _EPaymentPageStage.tos);
    }
  }

  @override
  void didChangeDependencies() {
    if (P.isWeb) {
      launch('https://www.barracudacampus.com/s/xmu');
      Navigator.of(context).pop();
    } else
      _init();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Widget body;

    switch (_status) {
      case _EPaymentPageStage.initializing:
        body = Center(
          child: CircularProgressIndicator(),
        );
        break;
      case _EPaymentPageStage.initialized:
        body = RefreshIndicator(
          onRefresh: _init,
          child: EmptyErrorList(),
        );
        break;
      case _EPaymentPageStage.tos:
        body = Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              Icons.warning_amber_outlined,
              size: 40,
            ),
            Divider(color: Colors.transparent),
            Text(
              LocaleKeys.Campus_ToolsEPaymentTOS.tr(),
              textAlign: TextAlign.center,
            ),
          ],
        );
        break;
      case _EPaymentPageStage.normal:
        body = Refreshable<List<PaymentRecord>>(
          data: _records,
          onRefresh: () => _api.payment,
          builder: (context, records) {
            return ListView.separated(
              itemCount: _records.length,
              itemBuilder: (context, index) => WidthLimited(
                child: _PaymentRecordCard(records[index]),
              ),
              separatorBuilder: (context, index) => WidthLimited(
                width: min(MediaQuery.of(context).size.width - 10, 590),
                child: Divider(height: 10),
              ),
            );
          },
        );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.Campus_ToolsEPayment.tr()),
      ),
      body: body,
    );
  }
}

class _PaymentRecordCard extends StatelessWidget {
  final PaymentRecord _record;

  const _PaymentRecordCard(this._record);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _record.item,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Divider(height: 5, color: Colors.transparent),
                Text(
                  DateFormat.yMMMMd(
                          Localizations.localeOf(context).languageCode)
                      .format(_record.date),
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
                '${_record.paid.toStringAsFixed(2)}\n / ${_record.amount.toStringAsFixed(2)}'),
          )
        ],
      ),
    );
  }
}
