part of swagger.api;

class InlineResponse2007 {
  
  int code = null;
  

  String message = null;
  

  XmuxVotingV1GetVotesResp data = null;
  
  InlineResponse2007();

  @override
  String toString() {
    return 'InlineResponse2007[code=$code, message=$message, data=$data, ]';
  }

  InlineResponse2007.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    code =
        json['code']
    ;
    message =
        json['message']
    ;
    data =
      
      
      new XmuxVotingV1GetVotesResp.fromJson(json['data'])
;
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
      'data': data
     };
  }

  static List<InlineResponse2007> listFromJson(List<dynamic> json) {
    return json == null ? new List<InlineResponse2007>() : json.map((value) => new InlineResponse2007.fromJson(value)).toList();
  }

  static Map<String, InlineResponse2007> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, InlineResponse2007>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new InlineResponse2007.fromJson(value));
    }
    return map;
  }
}

