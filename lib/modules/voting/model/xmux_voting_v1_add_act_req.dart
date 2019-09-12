part of swagger.api;

class XmuxVotingV1AddActReq {
  
  String actName = null;
  

  int actMode = null;
  

  String startTime = null;
  

  String endTime = null;
  
  XmuxVotingV1AddActReq();

  @override
  String toString() {
    return 'XmuxVotingV1AddActReq[actName=$actName, actMode=$actMode, startTime=$startTime, endTime=$endTime, ]';
  }

  XmuxVotingV1AddActReq.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    actName =
        json['actName']
    ;
    actMode =
        json['actMode']
    ;
    startTime =
        json['startTime']
    ;
    endTime =
        json['endTime']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'actName': actName,
      'actMode': actMode,
      'startTime': startTime,
      'endTime': endTime
     };
  }

  static List<XmuxVotingV1AddActReq> listFromJson(List<dynamic> json) {
    return json == null ? new List<XmuxVotingV1AddActReq>() : json.map((value) => new XmuxVotingV1AddActReq.fromJson(value)).toList();
  }

  static Map<String, XmuxVotingV1AddActReq> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, XmuxVotingV1AddActReq>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new XmuxVotingV1AddActReq.fromJson(value));
    }
    return map;
  }
}

