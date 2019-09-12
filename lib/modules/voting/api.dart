library swagger.api;

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/api_key_auth.dart';
part 'auth/oauth.dart';
part 'auth/http_basic_auth.dart';

part 'api/xmux_voting_v1_voting_api.dart';

part 'model/inline_response200.dart';
part 'model/inline_response2001.dart';
part 'model/inline_response2002.dart';
part 'model/inline_response2003.dart';
part 'model/inline_response2004.dart';
part 'model/inline_response2005.dart';
part 'model/inline_response2006.dart';
part 'model/inline_response2007.dart';
part 'model/xmux_voting_v1_activity.dart';
part 'model/xmux_voting_v1_add_act_req.dart';
part 'model/xmux_voting_v1_add_act_resp.dart';
part 'model/xmux_voting_v1_add_event_req.dart';
part 'model/xmux_voting_v1_add_event_resp.dart';
part 'model/xmux_voting_v1_event.dart';
part 'model/xmux_voting_v1_get_act_req.dart';
part 'model/xmux_voting_v1_get_act_resp.dart';
part 'model/xmux_voting_v1_get_votes_req.dart';
part 'model/xmux_voting_v1_get_votes_resp.dart';
part 'model/xmux_voting_v1_modify_event_req.dart';
part 'model/xmux_voting_v1_modify_event_resp.dart';
part 'model/xmux_voting_v1_remove_event_req.dart';
part 'model/xmux_voting_v1_remove_event_resp.dart';
part 'model/xmux_voting_v1_vote_req.dart';
part 'model/xmux_voting_v1_vote_resp.dart';
part 'model/xmux_voting_v1_voted_ev_req.dart';
part 'model/xmux_voting_v1_voted_ev_resp.dart';


ApiClient defaultApiClient = new ApiClient();
