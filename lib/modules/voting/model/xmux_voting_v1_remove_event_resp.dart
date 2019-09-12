part of swagger.api;

class XmuxVotingV1RemoveEventResp {
  
  bool removeStatus = null;
  
  XmuxVotingV1RemoveEventResp();

  @override
  String toString() {
    return 'XmuxVotingV1RemoveEventResp[removeStatus=$removeStatus, ]';
  }

  XmuxVotingV1RemoveEventResp.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    removeStatus =
        json['removeStatus']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'removeStatus': removeStatus
     };
  }

  static List<XmuxVotingV1RemoveEventResp> listFromJson(List<dynamic> json) {
    return json == null ? new List<XmuxVotingV1RemoveEventResp>() : json.map((value) => new XmuxVotingV1RemoveEventResp.fromJson(value)).toList();
  }

  static Map<String, XmuxVotingV1RemoveEventResp> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, XmuxVotingV1RemoveEventResp>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new XmuxVotingV1RemoveEventResp.fromJson(value));
    }
    return map;
  }
}

