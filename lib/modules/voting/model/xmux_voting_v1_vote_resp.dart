part of swagger.api;

class XmuxVotingV1VoteResp {
  
  bool voteStatus = null;
  
  XmuxVotingV1VoteResp();

  @override
  String toString() {
    return 'XmuxVotingV1VoteResp[voteStatus=$voteStatus, ]';
  }

  XmuxVotingV1VoteResp.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    voteStatus =
        json['voteStatus']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'voteStatus': voteStatus
     };
  }

  static List<XmuxVotingV1VoteResp> listFromJson(List<dynamic> json) {
    return json == null ? new List<XmuxVotingV1VoteResp>() : json.map((value) => new XmuxVotingV1VoteResp.fromJson(value)).toList();
  }

  static Map<String, XmuxVotingV1VoteResp> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, XmuxVotingV1VoteResp>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new XmuxVotingV1VoteResp.fromJson(value));
    }
    return map;
  }
}

