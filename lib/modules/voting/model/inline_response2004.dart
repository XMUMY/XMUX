part of swagger.api;

class InlineResponse2004 {
  
  int code = null;
  

  String message = null;
  

  XmuxVotingV1RemoveEventResp data = null;
  
  InlineResponse2004();

  @override
  String toString() {
    return 'InlineResponse2004[code=$code, message=$message, data=$data, ]';
  }

  InlineResponse2004.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    code =
        json['code']
    ;
    message =
        json['message']
    ;
    data =
      
      
      new XmuxVotingV1RemoveEventResp.fromJson(json['data'])
;
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
      'data': data
     };
  }

  static List<InlineResponse2004> listFromJson(List<dynamic> json) {
    return json == null ? new List<InlineResponse2004>() : json.map((value) => new InlineResponse2004.fromJson(value)).toList();
  }

  static Map<String, InlineResponse2004> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, InlineResponse2004>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new InlineResponse2004.fromJson(value));
    }
    return map;
  }
}

