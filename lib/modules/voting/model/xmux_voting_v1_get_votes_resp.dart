part of swagger.api;

class XmuxVotingV1GetVotesResp {
  
  List<XmuxVotingV1Event> events = [];
  
  XmuxVotingV1GetVotesResp();

  @override
  String toString() {
    return 'XmuxVotingV1GetVotesResp[events=$events, ]';
  }

  XmuxVotingV1GetVotesResp.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    events =
      XmuxVotingV1Event.listFromJson(json['events'])
;
  }

  Map<String, dynamic> toJson() {
    return {
      'events': events
     };
  }

  static List<XmuxVotingV1GetVotesResp> listFromJson(List<dynamic> json) {
    return json == null ? new List<XmuxVotingV1GetVotesResp>() : json.map((value) => new XmuxVotingV1GetVotesResp.fromJson(value)).toList();
  }

  static Map<String, XmuxVotingV1GetVotesResp> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, XmuxVotingV1GetVotesResp>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new XmuxVotingV1GetVotesResp.fromJson(value));
    }
    return map;
  }
}

