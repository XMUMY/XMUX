part of swagger.api;

class XmuxVotingV1AddEventResp {
  
  bool addStatus = null;
  
  XmuxVotingV1AddEventResp();

  @override
  String toString() {
    return 'XmuxVotingV1AddEventResp[addStatus=$addStatus, ]';
  }

  XmuxVotingV1AddEventResp.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    addStatus =
        json['addStatus']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'addStatus': addStatus
     };
  }

  static List<XmuxVotingV1AddEventResp> listFromJson(List<dynamic> json) {
    return json == null ? new List<XmuxVotingV1AddEventResp>() : json.map((value) => new XmuxVotingV1AddEventResp.fromJson(value)).toList();
  }

  static Map<String, XmuxVotingV1AddEventResp> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, XmuxVotingV1AddEventResp>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new XmuxVotingV1AddEventResp.fromJson(value));
    }
    return map;
  }
}

