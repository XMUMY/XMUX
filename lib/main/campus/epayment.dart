import 'package:barracuda_campus/barracuda_campus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../component/empty_error.dart';
import '../../global.dart';
import '../../redux/action/action.dart';
import '../../util/screen.dart';

enum _EPaymentPageStage {
  initializing,
  initialized,
  tos,
  ok,
}

class EPaymentPage extends StatefulWidget {
  const EPaymentPage({Key? key}) : super(key: key);

  @override
  _EPaymentPageState createState() => _EPaymentPageState();
}

class _EPaymentPageState extends State<EPaymentPage> {
  final _api = BCStudent()
    ..setCredential(
      store.state.user.campusId,
      store.state.user.ePaymentPassword.isNotEmpty
          ? store.state.user.ePaymentPassword
          : store.state.user.profile.id,
    );

  var _state = _EPaymentPageStage.initializing;

  List<PaymentRecord>? _records;

  void _inputPassword() async {
    final controller = TextEditingController();
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(LocaleKeys.Campus_EPaymentLoginFailed.tr()),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(LocaleKeys.Campus_EPaymentLoginFailedHint.tr()),
            TextField(
              controller: controller,
              obscureText: true,
              decoration: InputDecoration(
                labelText: LocaleKeys.Campus_EPaymentPasswordLabel.tr(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            child: Text(MaterialLocalizations.of(context).okButtonLabel),
            onPressed: () async {
              _api.setCredential(store.state.user.campusId, controller.text);
              // Go back to initialization stage.
              _init();
              Navigator.of(context).maybePop();
              if (mounted) {
                setState(() => _state = _EPaymentPageStage.initializing);
              }
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
      _records = await _api.payments;
      _records = _records!.reversed.toList();
      if (mounted) setState(() => _state = _EPaymentPageStage.ok);
    } catch (e) {
      if (mounted) setState(() => _state = _EPaymentPageStage.initialized);
      if (e == 'Login Failed') _inputPassword();
      if (e == 'TOS' && mounted) {
        setState(() => _state = _EPaymentPageStage.tos);
      }
    }
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget body;

    switch (_state) {
      case _EPaymentPageStage.initializing:
        body = const Center(
          child: CircularProgressIndicator(),
        );
        break;
      case _EPaymentPageStage.initialized:
        body = RefreshIndicator(
          onRefresh: _init,
          child: const EmptyErrorList(),
        );
        break;
      case _EPaymentPageStage.tos:
        body = Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.warning_amber_outlined,
              size: 50,
            ),
            const Divider(color: Colors.transparent),
            Text(
              LocaleKeys.Campus_EPaymentTOS.tr(),
              textAlign: TextAlign.center,
            ),
          ],
        );
        break;
      case _EPaymentPageStage.ok:
        body = RefreshIndicator(
          onRefresh: _init,
          child: ListView.separated(
            itemCount: _records!.length,
            padding: EdgeInsets.symmetric(
              vertical: 4,
              horizontal: context.padBody,
            ),
            itemBuilder: (context, index) =>
                _PaymentRecordCard(record: _records![index]),
            separatorBuilder: (context, index) => const Divider(),
          ),
        );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.Campus_EPayment.tr()),
      ),
      body: body,
    );
  }
}

class _PaymentRecordCard extends StatelessWidget {
  final PaymentRecord record;

  const _PaymentRecordCard({Key? key, required this.record}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                record.item,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const Divider(height: 5, color: Colors.transparent),
              Text(
                DateFormat.yMMMMd().format(record.date),
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            '${record.paid.toStringAsFixed(2)}\n / ${record.amount.toStringAsFixed(2)}',
            textAlign: TextAlign.end,
          ),
        )
      ],
    );
  }
}
