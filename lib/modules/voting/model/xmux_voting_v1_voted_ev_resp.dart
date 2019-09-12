part of swagger.api;

class XmuxVotingV1VotedEvResp {
  
  List<int> eventID = [];
  
  XmuxVotingV1VotedEvResp();

  @override
  String toString() {
    return 'XmuxVotingV1VotedEvResp[eventID=$eventID, ]';
  }

  XmuxVotingV1VotedEvResp.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    eventID =
        (json['eventID'] as List).map((item) => item as int).toList()
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'eventID': eventID
     };
  }

  static List<XmuxVotingV1VotedEvResp> listFromJson(List<dynamic> json) {
    return json == null ? new List<XmuxVotingV1VotedEvResp>() : json.map((value) => new XmuxVotingV1VotedEvResp.fromJson(value)).toList();
  }

  static Map<String, XmuxVotingV1VotedEvResp> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, XmuxVotingV1VotedEvResp>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new XmuxVotingV1VotedEvResp.fromJson(value));
    }
    return map;
  }
}

