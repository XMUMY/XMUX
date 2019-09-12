part of swagger.api;

class XmuxVotingV1GetVotesReq {
  
  String activity = null;
  

  int beg = null;
  

  int amount = null;
  
  XmuxVotingV1GetVotesReq();

  @override
  String toString() {
    return 'XmuxVotingV1GetVotesReq[activity=$activity, beg=$beg, amount=$amount, ]';
  }

  XmuxVotingV1GetVotesReq.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    activity =
        json['activity']
    ;
    beg =
        json['beg']
    ;
    amount =
        json['amount']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'activity': activity,
      'beg': beg,
      'amount': amount
     };
  }

  static List<XmuxVotingV1GetVotesReq> listFromJson(List<dynamic> json) {
    return json == null ? new List<XmuxVotingV1GetVotesReq>() : json.map((value) => new XmuxVotingV1GetVotesReq.fromJson(value)).toList();
  }

  static Map<String, XmuxVotingV1GetVotesReq> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, XmuxVotingV1GetVotesReq>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new XmuxVotingV1GetVotesReq.fromJson(value));
    }
    return map;
  }
}

