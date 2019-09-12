part of swagger.api;

class XmuxVotingV1AddActResp {
  
  bool addStatus = null;
  
  XmuxVotingV1AddActResp();

  @override
  String toString() {
    return 'XmuxVotingV1AddActResp[addStatus=$addStatus, ]';
  }

  XmuxVotingV1AddActResp.fromJson(Map<String, dynamic> json) {
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

  static List<XmuxVotingV1AddActResp> listFromJson(List<dynamic> json) {
    return json == null ? new List<XmuxVotingV1AddActResp>() : json.map((value) => new XmuxVotingV1AddActResp.fromJson(value)).toList();
  }

  static Map<String, XmuxVotingV1AddActResp> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, XmuxVotingV1AddActResp>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new XmuxVotingV1AddActResp.fromJson(value));
    }
    return map;
  }
}

