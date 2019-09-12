part of swagger.api;

class XmuxVotingV1GetActReq {
    XmuxVotingV1GetActReq();

  @override
  String toString() {
    return 'XmuxVotingV1GetActReq[]';
  }

  XmuxVotingV1GetActReq.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<XmuxVotingV1GetActReq> listFromJson(List<dynamic> json) {
    return json == null ? new List<XmuxVotingV1GetActReq>() : json.map((value) => new XmuxVotingV1GetActReq.fromJson(value)).toList();
  }

  static Map<String, XmuxVotingV1GetActReq> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, XmuxVotingV1GetActReq>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new XmuxVotingV1GetActReq.fromJson(value));
    }
    return map;
  }
}

