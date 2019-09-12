part of swagger.api;

class XmuxVotingV1GetActResp {
  
  List<XmuxVotingV1Activity> activities = [];
  
  XmuxVotingV1GetActResp();

  @override
  String toString() {
    return 'XmuxVotingV1GetActResp[activities=$activities, ]';
  }

  XmuxVotingV1GetActResp.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    activities =
      XmuxVotingV1Activity.listFromJson(json['activities'])
;
  }

  Map<String, dynamic> toJson() {
    return {
      'activities': activities
     };
  }

  static List<XmuxVotingV1GetActResp> listFromJson(List<dynamic> json) {
    return json == null ? new List<XmuxVotingV1GetActResp>() : json.map((value) => new XmuxVotingV1GetActResp.fromJson(value)).toList();
  }

  static Map<String, XmuxVotingV1GetActResp> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, XmuxVotingV1GetActResp>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new XmuxVotingV1GetActResp.fromJson(value));
    }
    return map;
  }
}

