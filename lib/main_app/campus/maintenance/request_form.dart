part of 'maintenance.dart';

class RequestFormPage extends StatefulWidget {
  final Maintenance maintenance;

  const RequestFormPage(this.maintenance);

  @override
  _RequestFormPageState createState() => _RequestFormPageState();
}

class _RequestFormPageState extends State<RequestFormPage> {
  RequestForm form;
  final formKey = GlobalKey<FormState>();

  bool _isSubmitting = false;

  bool get hasKeyBoard => MediaQuery.of(context).viewInsets.bottom > 100;

  @override
  void initState() {
    widget.maintenance.form
        .then((f) => mounted ? setState(() => form = f) : null);
    super.initState();
  }

  List<Widget> _buildForm() {
    return <Widget>[
      TextFormField(
        maxLines: 4,
        maxLength: 200,
        maxLengthEnforced: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: i18n('Campus/Tools/Maintenance/New/Description', context),
        ),
        onChanged: (v) => form.description = v,
        validator: (v) => v.isNotEmpty
            ? null
            : i18n('Campus/Tools/Maintenance/New/FormatError', context),
      ),
      Row(
        children: <Widget>[
          Expanded(
            child: Observer(
              builder: (_) => DropdownButtonFormField(
                hint: Text(i18n('Campus/Tools/Maintenance/New/Block', context)),
                items: form.blocks
                    .map((u) => DropdownMenuItem(child: Text(u), value: u))
                    .toList(),
                value: form.block,
                onChanged: (v) => form.block = v,
                validator: (v) => v != null && form.blocks.contains(v)
                    ? null
                    : i18n('Campus/Tools/Maintenance/New/FormatError', context),
              ),
            ),
          ),
          VerticalDivider(),
          Expanded(
            child: Observer(
              builder: (_) => DropdownButtonFormField(
                hint: Text(i18n('Campus/Tools/Maintenance/New/Wing', context)),
                items: form.wings
                    .map((u) => DropdownMenuItem(child: Text(u), value: u))
                    .toList(),
                value: form.wing,
                onChanged: (v) => form.wing = v,
                validator: (v) => v != null && form.wings.contains(v)
                    ? null
                    : i18n('Campus/Tools/Maintenance/New/FormatError', context),
              ),
            ),
          ),
          VerticalDivider(),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: i18n('Campus/Tools/Maintenance/New/Room', context)),
              onChanged: (v) => form.room = v,
              validator: (v) => v != null && v.isNotEmpty
                  ? null
                  : i18n('Campus/Tools/Maintenance/New/FormatError', context),
            ),
          )
        ],
      ),
      AnimatedPadding(
        padding: EdgeInsets.only(
            right: hasKeyBoard ? 0 : MediaQuery.of(context).size.width / 3),
        duration: const Duration(milliseconds: 100),
        child: Observer(
          builder: (_) => DropdownButtonFormField(
            decoration: InputDecoration(
                labelText: i18n('Campus/Tools/Maintenance/New/Usage', context)),
            items: form.usages
                .map((u) => DropdownMenuItem(child: Text(u), value: u))
                .toList(),
            value: form.usage,
            onChanged: (v) => form.usage = v,
            validator: (v) => v != null && form.usages.contains(v)
                ? null
                : i18n('Campus/Tools/Maintenance/New/FormatError', context),
          ),
        ),
      ),
      AnimatedPadding(
        padding: EdgeInsets.only(
            right: hasKeyBoard ? 0 : MediaQuery.of(context).size.width / 3),
        duration: const Duration(milliseconds: 100),
        child: Observer(
          builder: (_) => DropdownButtonFormField(
            decoration: InputDecoration(
                labelText:
                    i18n('Campus/Tools/Maintenance/New/Category', context)),
            items: form.categories
                .map((u) => DropdownMenuItem(child: Text(u), value: u))
                .toList(),
            value: form.category,
            onChanged: (v) => form.category = v,
            validator: (v) => v != null && form.categories.contains(v)
                ? null
                : i18n('Campus/Tools/Maintenance/New/FormatError', context),
          ),
        ),
      ),
      AnimatedPadding(
        padding: EdgeInsets.only(right: hasKeyBoard ? 0 : 140),
        duration: const Duration(milliseconds: 100),
        child: TextFormField(
          initialValue: form.phoneNumber,
          decoration: InputDecoration(
              labelText: i18n('Campus/Tools/Maintenance/New/Contact', context)),
          keyboardType: TextInputType.phone,
          onChanged: (v) => form.phoneNumber = v,
          validator: (v) => v != null && v.isNotEmpty
              ? null
              : i18n('Campus/Tools/Maintenance/New/FormatError', context),
        ),
      ),
      AnimatedPadding(
        padding: EdgeInsets.only(
            right: hasKeyBoard ? 0 : MediaQuery.of(context).size.width / 3),
        duration: const Duration(milliseconds: 100),
        child: Observer(
          builder: (context) => CheckboxListTile(
            title:
                Text(i18n('Campus/Tools/Maintenance/New/Recurring', context)),
            value: form.recurringProblem,
            onChanged: (v) => form.recurringProblem = v,
          ),
        ),
      ),
      Divider(height: 10, color: Colors.transparent),
      AnimatedPadding(
        padding: EdgeInsets.only(
            right: hasKeyBoard ? 0 : MediaQuery.of(context).size.width / 3),
        duration: const Duration(milliseconds: 100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Observer(
              builder: (context) => FloatingActionButton(
                heroTag: 'camera',
                backgroundColor: Theme.of(context).canvasColor,
                tooltip: i18n(
                    'Campus/Tools/Maintenance/New/${form.file == null ? 'Add' : 'Delete'}Photo',
                    context),
                child: Icon(
                  form.file == null ? Icons.camera : Icons.delete_outline,
                  color: Theme.of(context).accentColor,
                ),
                onPressed: () async {
                  if (form.file != null) {
                    form.file = null;
                    return;
                  }
                  var imageFile =
                      await ImagePicker().getImage(source: ImageSource.camera);
                  form.file = File(imageFile.path);
                },
              ),
            ),
            FloatingActionButton(
              disabledElevation: 0,
              child: Icon(Icons.check),
              onPressed: () async {
                if (!formKey.currentState.validate() || _isSubmitting) return;
                _isSubmitting = true;
                await widget.maintenance.sendForm(form);
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
          color: Theme.of(context).textTheme.headline5.color,
        ),
        title: Text(
          i18n('Campus/Tools/Maintenance/New/Title', context),
          style: Theme.of(context).textTheme.headline6,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          if (!hasKeyBoard)
            Positioned(
              right: 5,
              bottom: 10,
              child: SvgPicture.asset(
                'res/campus/maintenance.svg',
                width: MediaQuery.of(context).size.width / 3.3,
              ),
            ),
          if (form == null) Center(child: CircularProgressIndicator()),
          if (form != null)
            Form(
              key: formKey,
              child: ListView(
                padding: EdgeInsets.all(15),
                children: _buildForm(),
              ),
            ),
        ],
      ),
    );
  }
}
