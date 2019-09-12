part of swagger.api;

class XmuxVotingV1ModifyEventResp {
  
  bool modifyStatus = null;
  
  XmuxVotingV1ModifyEventResp();

  @override
  String toString() {
    return 'XmuxVotingV1ModifyEventResp[modifyStatus=$modifyStatus, ]';
  }

  XmuxVotingV1ModifyEventResp.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    modifyStatus =
        json['modifyStatus']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'modifyStatus': modifyStatus
     };
  }

  static List<XmuxVotingV1ModifyEventResp> listFromJson(List<dynamic> json) {
    return json == null ? new List<XmuxVotingV1ModifyEventResp>() : json.map((value) => new XmuxVotingV1ModifyEventResp.fromJson(value)).toList();
  }

  static Map<String, XmuxVotingV1ModifyEventResp> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, XmuxVotingV1ModifyEventResp>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new XmuxVotingV1ModifyEventResp.fromJson(value));
    }
    return map;
  }
}

