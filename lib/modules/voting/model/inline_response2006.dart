part of swagger.api;

class InlineResponse2006 {
  
  int code = null;
  

  String message = null;
  

  XmuxVotingV1VotedEvResp data = null;
  
  InlineResponse2006();

  @override
  String toString() {
    return 'InlineResponse2006[code=$code, message=$message, data=$data, ]';
  }

  InlineResponse2006.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    code =
        json['code']
    ;
    message =
        json['message']
    ;
    data =
      
      
      new XmuxVotingV1VotedEvResp.fromJson(json['data'])
;
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
      'data': data
     };
  }

  static List<InlineResponse2006> listFromJson(List<dynamic> json) {
    return json == null ? new List<InlineResponse2006>() : json.map((value) => new InlineResponse2006.fromJson(value)).toList();
  }

  static Map<String, InlineResponse2006> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, InlineResponse2006>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new InlineResponse2006.fromJson(value));
    }
    return map;
  }
}

