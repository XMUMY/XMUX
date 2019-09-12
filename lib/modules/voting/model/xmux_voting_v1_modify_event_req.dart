part of swagger.api;

class XmuxVotingV1ModifyEventReq {
  
  int ID = null;
  

  int dispID = null;
  

  String name = null;
  

  String presenter = null;
  

  int vote = null;
  

  String activity = null;
  
  XmuxVotingV1ModifyEventReq();

  @override
  String toString() {
    return 'XmuxVotingV1ModifyEventReq[ID=$ID, dispID=$dispID, name=$name, presenter=$presenter, vote=$vote, activity=$activity, ]';
  }

  XmuxVotingV1ModifyEventReq.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    ID =
        json['ID']
    ;
    dispID =
        json['dispID']
    ;
    name =
        json['name']
    ;
    presenter =
        json['presenter']
    ;
    vote =
        json['vote']
    ;
    activity =
        json['activity']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'ID': ID,
      'dispID': dispID,
      'name': name,
      'presenter': presenter,
      'vote': vote,
      'activity': activity
     };
  }

  static List<XmuxVotingV1ModifyEventReq> listFromJson(List<dynamic> json) {
    return json == null ? new List<XmuxVotingV1ModifyEventReq>() : json.map((value) => new XmuxVotingV1ModifyEventReq.fromJson(value)).toList();
  }

  static Map<String, XmuxVotingV1ModifyEventReq> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, XmuxVotingV1ModifyEventReq>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new XmuxVotingV1ModifyEventReq.fromJson(value));
    }
    return map;
  }
}

