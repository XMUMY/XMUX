part of swagger.api;

class XmuxVotingV1Activity {
  
  int mode = null;
  

  String beginTime = null;
  

  String endTime = null;
  

  int numEvents = null;
  
  XmuxVotingV1Activity();

  @override
  String toString() {
    return 'XmuxVotingV1Activity[mode=$mode, beginTime=$beginTime, endTime=$endTime, numEvents=$numEvents, ]';
  }

  XmuxVotingV1Activity.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    mode =
        json['mode']
    ;
    beginTime =
        json['beginTime']
    ;
    endTime =
        json['endTime']
    ;
    numEvents =
        json['numEvents']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'mode': mode,
      'beginTime': beginTime,
      'endTime': endTime,
      'numEvents': numEvents
     };
  }

  static List<XmuxVotingV1Activity> listFromJson(List<dynamic> json) {
    return json == null ? new List<XmuxVotingV1Activity>() : json.map((value) => new XmuxVotingV1Activity.fromJson(value)).toList();
  }

  static Map<String, XmuxVotingV1Activity> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, XmuxVotingV1Activity>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new XmuxVotingV1Activity.fromJson(value));
    }
    return map;
  }
}

