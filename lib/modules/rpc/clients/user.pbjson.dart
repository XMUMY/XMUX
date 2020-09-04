///
//  Generated code. Do not modify.
//  source: user.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const RegisterReq$json = const {
  '1': 'RegisterReq',
  '2': const [
    const {'1': 'displayName', '3': 1, '4': 1, '5': 9, '10': 'displayName'},
    const {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
  ],
};

const LoginResp$json = const {
  '1': 'LoginResp',
  '2': const [
    const {'1': 'customToken', '3': 1, '4': 1, '5': 9, '10': 'customToken'},
  ],
};

const GetProfileReq$json = const {
  '1': 'GetProfileReq',
  '2': const [
    const {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
  ],
};

const Profile$json = const {
  '1': 'Profile',
  '2': const [
    const {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
    const {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'displayName', '3': 3, '4': 1, '5': 9, '10': 'displayName'},
    const {'1': 'avatar', '3': 4, '4': 1, '5': 9, '10': 'avatar'},
    const {'1': 'name', '3': 5, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'nationality', '3': 6, '4': 1, '5': 9, '10': 'nationality'},
    const {'1': 'id', '3': 7, '4': 1, '5': 9, '10': 'id'},
  ],
};

const RefreshDeviceReq$json = const {
  '1': 'RefreshDeviceReq',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'deviceModel', '3': 2, '4': 1, '5': 9, '10': 'deviceModel'},
    const {'1': 'deviceName', '3': 3, '4': 1, '5': 9, '10': 'deviceName'},
    const {
      '1': 'pushChannel',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.xmux.core.user.v4.RefreshDeviceReq.PushChannelType',
      '10': 'pushChannel'
    },
    const {'1': 'pushKey', '3': 5, '4': 1, '5': 9, '10': 'pushKey'},
  ],
  '4': const [RefreshDeviceReq_PushChannelType$json],
};

const RefreshDeviceReq_PushChannelType$json = const {
  '1': 'PushChannelType',
  '2': const [
    const {'1': 'fcm', '2': 0},
  ],
};

const GetDevicesResp$json = const {
  '1': 'GetDevicesResp',
  '2': const [
    const {
      '1': 'devices',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.xmux.core.user.v4.GetDevicesResp.Device',
      '10': 'devices'
    },
  ],
  '3': const [GetDevicesResp_Device$json],
};

const GetDevicesResp_Device$json = const {
  '1': 'Device',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'deviceModel', '3': 2, '4': 1, '5': 9, '10': 'deviceModel'},
    const {'1': 'deviceName', '3': 3, '4': 1, '5': 9, '10': 'deviceName'},
    const {
      '1': 'lastSeen',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'lastSeen'
    },
  ],
};
