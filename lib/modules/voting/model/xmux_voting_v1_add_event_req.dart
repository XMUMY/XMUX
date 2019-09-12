part of swagger.api;

class XmuxVotingV1AddEventReq {
  
  String name = null;
  

  String presenter = null;
  

  String activity = null;
  
  XmuxVotingV1AddEventReq();

  @override
  String toString() {
    return 'XmuxVotingV1AddEventReq[name=$name, presenter=$presenter, activity=$activity, ]';
  }

  XmuxVotingV1AddEventReq.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    name =
        json['name']
    ;
    presenter =
        json['presenter']
    ;
    activity =
        json['activity']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'presenter': presenter,
      'activity': activity
     };
  }

  static List<XmuxVotingV1AddEventReq> listFromJson(List<dynamic> json) {
    return json == null ? new List<XmuxVotingV1AddEventReq>() : json.map((value) => new XmuxVotingV1AddEventReq.fromJson(value)).toList();
  }

  static Map<String, XmuxVotingV1AddEventReq> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, XmuxVotingV1AddEventReq>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new XmuxVotingV1AddEventReq.fromJson(value));
    }
    return map;
  }
}

