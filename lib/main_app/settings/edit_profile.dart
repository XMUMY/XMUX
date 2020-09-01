import 'package:easy_localization/easy_localization.dart';
import 'package:extended_image/extended_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:xmux/components/user_profile.dart';
import 'package:xmux/generated/l10n_keys.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/redux/state/state.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _displayNameController = TextEditingController(
      text: FirebaseAuth.instance.currentUser?.displayName ?? 'User');

  final _formKey = GlobalKey<FormState>();

  void _handleSubmit() async {
    if (!_formKey.currentState.validate()) return;
    FirebaseAuth.instance.currentUser
        .updateProfile(displayName: _displayNameController.text);
    await FirebaseAuth.instance.currentUser.reload();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.Settings_EditProfile.tr()),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.done),
            onPressed: _handleSubmit,
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 15,
                  ),
                  child: StoreConnector<MainAppState, String>(
                    converter: (s) =>
                        FirebaseAuth.instance.currentUser.photoURL,
                    builder: (context, s) => GestureDetector(
                      onTap: () => Navigator.of(context).pushNamed(
                        '/Components/ImageEditor',
                        arguments: ExtendedNetworkImageProvider(s),
                      ),
                      child: UserAvatar(
                        url: s,
                        radius: 30,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    StoreConnector<MainAppState, String>(
                      converter: (s) => s.state.user.profile?.name ?? '...',
                      builder: (context, s) => Text(s),
                    ),
                    Text(FirebaseAuth.instance.currentUser.email),
                  ],
                )
              ],
            ),
            Text(
              i18n('Settings/ChangeProfile/Caption', context),
              style: Theme.of(context).textTheme.caption,
            ),
            TextFormField(
              controller: _displayNameController,
              decoration: InputDecoration(
                  labelText:
                      i18n('Settings/ChangeProfile/DisplayName', context)),
              maxLength: 25,
              validator: (name) => name.isNotEmpty ? null : 'Format error',
            ),
          ],
        ),
      ),
    );
  }
}
