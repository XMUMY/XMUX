part of 'xia.dart';

class Dialogflow {
  /// Instance for googleapis.dialogflow.v2.
  final DialogflowApi _dialogflowApi;

  final String _sessionId;

  Dialogflow(Client client)
      : this._dialogflowApi = DialogflowApi(client),
        this._sessionId = _randomStr;

  /// Generate random string for session ID.
  static String get _randomStr {
    var rand = Random();
    var codeUnits = List.generate(8, (_) => rand.nextInt(26) + 65);
    return String.fromCharCodes(codeUnits);
  }

  /// Get fulfillment message.
  Future<String> queryFromText(String query) async {
    var req = GoogleCloudDialogflowV2DetectIntentRequest();
    req.queryInput = GoogleCloudDialogflowV2QueryInput();
    req.queryInput.text = GoogleCloudDialogflowV2TextInput();

    req.queryInput.text.languageCode = Platform.localeName.replaceAll('_', '-');
    req.queryInput.text.text = query;

    var res = await _dialogflowApi.projects.agent_1.sessions
        .detectIntent(req, 'projects/xmux-bot/agent/sessions/$_sessionId');

    return res.queryResult.fulfillmentText;
  }
}
