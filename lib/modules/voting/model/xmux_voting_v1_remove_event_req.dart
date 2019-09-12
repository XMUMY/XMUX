part of swagger.api;

class XmuxVotingV1RemoveEventReq {
  
  int ID = null;
  

  String activity = null;
  
  XmuxVotingV1RemoveEventReq();

  @override
  String toString() {
    return 'XmuxVotingV1RemoveEventReq[ID=$ID, activity=$activity, ]';
  }

  XmuxVotingV1RemoveEventReq.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    ID =
        json['ID']
    ;
    activity =
        json['activity']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'ID': ID,
      'activity': activity
     };
  }

  static List<XmuxVotingV1RemoveEventReq> listFromJson(List<dynamic> json) {
    return json == null ? new List<XmuxVotingV1RemoveEventReq>() : json.map((value) => new XmuxVotingV1RemoveEventReq.fromJson(value)).toList();
  }

  static Map<String, XmuxVotingV1RemoveEventReq> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, XmuxVotingV1RemoveEventReq>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new XmuxVotingV1RemoveEventReq.fromJson(value));
    }
    return map;
  }
}

