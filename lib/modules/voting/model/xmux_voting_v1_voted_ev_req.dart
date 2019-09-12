part of swagger.api;

class XmuxVotingV1VotedEvReq {
  
  String activity = null;
  
  XmuxVotingV1VotedEvReq();

  @override
  String toString() {
    return 'XmuxVotingV1VotedEvReq[activity=$activity, ]';
  }

  XmuxVotingV1VotedEvReq.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    activity =
        json['activity']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'activity': activity
     };
  }

  static List<XmuxVotingV1VotedEvReq> listFromJson(List<dynamic> json) {
    return json == null ? new List<XmuxVotingV1VotedEvReq>() : json.map((value) => new XmuxVotingV1VotedEvReq.fromJson(value)).toList();
  }

  static Map<String, XmuxVotingV1VotedEvReq> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, XmuxVotingV1VotedEvReq>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new XmuxVotingV1VotedEvReq.fromJson(value));
    }
    return map;
  }
}

