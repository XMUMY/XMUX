part of swagger.api;

class XmuxVotingV1Event {
  
  int ID = null;
  

  int dispID = null;
  

  String name = null;
  

  String presenter = null;
  

  int vote = null;
  
  XmuxVotingV1Event();

  @override
  String toString() {
    return 'XmuxVotingV1Event[ID=$ID, dispID=$dispID, name=$name, presenter=$presenter, vote=$vote, ]';
  }

  XmuxVotingV1Event.fromJson(Map<String, dynamic> json) {
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
  }

  Map<String, dynamic> toJson() {
    return {
      'ID': ID,
      'dispID': dispID,
      'name': name,
      'presenter': presenter,
      'vote': vote
     };
  }

  static List<XmuxVotingV1Event> listFromJson(List<dynamic> json) {
    return json == null ? new List<XmuxVotingV1Event>() : json.map((value) => new XmuxVotingV1Event.fromJson(value)).toList();
  }

  static Map<String, XmuxVotingV1Event> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, XmuxVotingV1Event>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new XmuxVotingV1Event.fromJson(value));
    }
    return map;
  }
}

