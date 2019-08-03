import 'package:flutter/material.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/maintenance/my_question.dart' as myQuestion;

class SubmitFormPage extends StatefulWidget {
  String _campusID, _passwd;
  SubmitFormPage(this._campusID, this._passwd);

  @override
  _SubmitFormPageState createState() =>
      _SubmitFormPageState(this._campusID, this._passwd);
}

class _SubmitFormPageState extends State<SubmitFormPage> {
  myQuestion.Form formData;
  String _campusID, _passwd;
  var _maintenance;
  final _formKey = GlobalKey<FormState>();
  final _blockKey = GlobalKey<FormFieldState>();
  final _wingKey = GlobalKey<FormFieldState>();
  _SubmitFormPageState(this._campusID, this._passwd) {
    _maintenance = myQuestion.Maintenance(_campusID, _passwd);
    _getForm();
  }

  _getForm() {
    _maintenance.getForm().then((form) {
      if (mounted) {
        setState(() => formData = form);
      }
    }).catchError((error) {
      if (mounted) {
        final snackBar = SnackBar(
          content: Text(error.toString()),
          action: SnackBarAction(
            label: i18n('Campus/Tools/Maintenance/Retry', context),
            onPressed: () => _getForm(),
          ),
          duration: Duration(days: 1),
        );
        Scaffold.of(context).showSnackBar(snackBar);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (formData == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    List<DropdownMenuItem<String>> roomUsageItem = [];
    List<DropdownMenuItem<String>> categoryItem = [];
    List<DropdownMenuItem<String>> blockItem = [];
    List<DropdownMenuItem<String>> wingItem = [];

    formData.roomUsage.forEach((item) =>
        roomUsageItem.add(DropdownMenuItem(child: Text(item), value: item)));
    formData.category.forEach((item) =>
        categoryItem.add(DropdownMenuItem(child: Text(item), value: item)));
    formData.blockID.forEach((item) =>
        blockItem.add(DropdownMenuItem(child: Text(item), value: item)));
    formData.wingID.forEach((item) =>
        wingItem.add(DropdownMenuItem(child: Text(item), value: item)));

    return Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: <Widget>[
            FormField<String>(
                builder: (formFieldState) => Column(children: [
                      DropdownButton(
                        value: formFieldState.value,
                        items: roomUsageItem,
                        hint: Text(
                          i18n('Campus/Tools/Maintenance/RoomUsage', context),
                        ),
                        onChanged: (selectedVal) {
                          formFieldState.didChange(selectedVal);
                          setState(() => formFieldState.validate());
                        },
                      ),
                      formFieldState.hasError
                          ? Text(
                              formFieldState.errorText,
                              style: TextStyle(
                                  color: Colors.red[700], fontSize: 12),
                            )
                          : Container()
                    ]),
                validator: (selectedValue) {
                  if (selectedValue == null)
                    return i18n('Campus/Tools/Maintenance/ChooseEmptyError', context);
                  else
                    return null;
                },
                onSaved: (selectedValue) =>
                    formData.croomUsage = selectedValue),
            FormField(
              builder: (formFieldState) => Column(children: [
                DropdownButton(
                  value: formFieldState.value,
                  items: categoryItem,
                  hint: Text(
                    i18n('Campus/Tools/Maintenance/ProblemCategory', context),
                  ),
                  onChanged: (selectedVal) {
                    formFieldState.didChange(selectedVal);
                    setState(() => formFieldState.validate());
                  },
                ),
                formFieldState.hasError
                    ? Text(
                        formFieldState.errorText,
                        style: TextStyle(color: Colors.red[700], fontSize: 12),
                      )
                    : Container()
              ]),
              validator: (selectedValue) {
                if (selectedValue == null) {
                  return i18n('Campus/Tools/Maintenance/ChooseEmptyError', context);
                } else
                  return null;
              },
              onSaved: (selectedValue) => formData.ccategory = selectedValue,
            ),
            Padding(
              padding: EdgeInsets.only(left: 4.0, right: 4.0),
              child: Row(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              FormField(
                                key: _blockKey,
                                builder: (formFieldState) => DropdownButton(
                                  value: formFieldState.value,
                                  items: blockItem,
                                  hint: Text(
                                    i18n('Campus/Tools/Maintenance/Block', context),
                                  ),
                                  onChanged: (selectedVal) {
                                    formFieldState.didChange(selectedVal);
                                    setState(() => formFieldState.validate());
                                  },
                                ),
                                validator: (selectedValue) {
                                  if (selectedValue == null)
                                    return i18n('Campus/Tools/Maintenance/ChooseEmptyError', context);
                                  else
                                    return null;
                                },
                                onSaved: (selectedValue) =>
                                    formData.cblockID = selectedValue,
                              ),
                              FormField(
                                key: _wingKey,
                                builder: (formFieldState) => DropdownButton(
                                  value: formFieldState.value,
                                  items: wingItem,
                                  hint: Text(
                                    i18n('Campus/Tools/Maintenance/Wing', context),
                                  ),
                                  onChanged: (selectedVal) {
                                    formFieldState.didChange(selectedVal);
                                    setState(() => formFieldState.validate());
                                  },
                                ),
                                validator: (selectedValue) {
                                  if (selectedValue == null)
                                    return i18n('Campus/Tools/Maintenance/ChooseEmptyError', context);
                                  else
                                    return null;
                                },
                                onSaved: (selectedValue) =>
                                    formData.cwingID = selectedValue,
                              )
                            ],
                          ),
                          _blockKey.currentState == null
                              ? Container()
                              : _blockKey.currentState.hasError
                                  ? Text(
                                      _blockKey.currentState.errorText,
                                      style: TextStyle(
                                          color: Colors.red[700], fontSize: 12),
                                    )
                                  : _wingKey.currentState.hasError
                                      ? Text(
                                          _wingKey.currentState.errorText,
                                          style: TextStyle(
                                              color: Colors.red[700],
                                              fontSize: 12),
                                        )
                                      : Container()
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 70.0,
                  ),
                  Flexible(
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: i18n('Campus/Tools/Maintenance/RoomNo', context)),
                      validator: (currentValue) {
                        if (currentValue.isEmpty)
                          return i18n('Campus/Tools/Maintenance/FormEmptyError', context) + i18n('Campus/Tools/Maintenance/RoomNo', context);
                        else
                          return null;
                      },
                      onSaved: (currentValue) => formData.roomNo = currentValue,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    border: UnderlineInputBorder(), labelText: i18n('Campus/Tools/Maintenance/PhoneNo', context)),
                keyboardType: TextInputType.number,
                validator: (currentValue) {
                  if (currentValue.isEmpty)
                    return i18n('Campus/Tools/Maintenance/FormEmptyError', context) + i18n('Campus/Tools/Maintenance/PhoneNo', context);
                  else
                    return null;
                },
                onSaved: (currentValue) => formData.phoneNo = currentValue,
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText:
                        i18n('Campus/Tools/Maintenance/DescriptionHint', context),
                    labelText: i18n('Campus/Tools/Maintenance/Description', context)),
                validator: (currentValue) {
                  if (currentValue.isEmpty)
                    return i18n('Campus/Tools/Maintenance/FormEmptyError', context) + i18n('Campus/Tools/Maintenance/Description', context);
                  else if (currentValue.length > 100)
                    return 'Description should be less than 100 characters';
                  else
                    return null;
                },
                onSaved: (currentValue) => formData.description = currentValue,
              ),
            ),
            CheckboxListTile(
              title: Text(i18n('Campus/Tools/Maintenance/Recurring', context)),
              value: formData.isrecurringProblem,
              onChanged: (checked) =>
                  setState(() => formData.isrecurringProblem = checked),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    _maintenance.formSender(formData).then((r) {
                      if (mounted) {
                        final snackBar = SnackBar(
                          content: Text(i18n('Campus/Tools/Maintenance/SubmissionSuccess', context)),
                        );
                        Scaffold.of(context).showSnackBar(snackBar);
                      }
                    }).catchError((error) {
                      if (mounted) {
                        final snackBar = SnackBar(
                          content: Text(error.toString()),
                        );
                        Scaffold.of(context).showSnackBar(snackBar);
                      }
                    });
                  }
                },
                child: Text(i18n('Campus/Tools/Maintenance/SubmitBtn', context)),
              ),
            )
          ],
        ));
  }
}
