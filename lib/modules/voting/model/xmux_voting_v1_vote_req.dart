part of swagger.api;

class XmuxVotingV1VoteReq {
  String eventID = null;

  String activity = null;

  XmuxVotingV1VoteReq();

  @override
  String toString() {
    return 'XmuxVotingV1VoteReq[eventID=$eventID, activity=$activity, ]';
  }

  XmuxVotingV1VoteReq.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    eventID = json['EventID'];
    activity = json['Activity'];
  }

  Map<String, dynamic> toJson() {
    return {'EventID': eventID, 'Activity': activity};
  }

  static List<XmuxVotingV1VoteReq> listFromJson(List<dynamic> json) {
    return json == null
        ? new List<XmuxVotingV1VoteReq>()
        : json.map((value) => new XmuxVotingV1VoteReq.fromJson(value)).toList();
  }

  static Map<String, XmuxVotingV1VoteReq> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, XmuxVotingV1VoteReq>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new XmuxVotingV1VoteReq.fromJson(value));
    }
    return map;
  }
}
