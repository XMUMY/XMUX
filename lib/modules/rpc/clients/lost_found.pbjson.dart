///
//  Generated code. Do not modify.
//  source: lost_found.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const LostAndFoundType$json = const {
  '1': 'LostAndFoundType',
  '2': const [
    const {'1': 'Lost', '2': 0},
    const {'1': 'Found', '2': 1},
  ],
};

const GetBriefsReq$json = const {
  '1': 'GetBriefsReq',
  '2': const [
    const {
      '1': 'before',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'before'
    },
  ],
};

const GetBriefsResp$json = const {
  '1': 'GetBriefsResp',
  '2': const [
    const {
      '1': 'briefs',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.xmux.lost_found.v4.LostAndFoundBrief',
      '10': 'briefs'
    },
  ],
};

const LostAndFoundBrief$json = const {
  '1': 'LostAndFoundBrief',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'uid', '3': 2, '4': 1, '5': 9, '10': 'uid'},
    const {
      '1': 'type',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.xmux.lost_found.v4.LostAndFoundType',
      '10': 'type'
    },
    const {'1': 'name', '3': 4, '4': 1, '5': 9, '10': 'name'},
    const {
      '1': 'time',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'time'
    },
    const {'1': 'location', '3': 6, '4': 1, '5': 9, '10': 'location'},
  ],
};

const GetDetailReq$json = const {
  '1': 'GetDetailReq',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'id'},
  ],
};

const LostAndFoundDetail$json = const {
  '1': 'LostAndFoundDetail',
  '2': const [
    const {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
    const {
      '1': 'type',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.xmux.lost_found.v4.LostAndFoundType',
      '10': 'type'
    },
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {
      '1': 'time',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'time'
    },
    const {'1': 'location', '3': 5, '4': 1, '5': 9, '10': 'location'},
    const {'1': 'description', '3': 6, '4': 1, '5': 9, '10': 'description'},
    const {
      '1': 'contacts',
      '3': 7,
      '4': 3,
      '5': 11,
      '6': '.xmux.lost_found.v4.LostAndFoundDetail.ContactsEntry',
      '10': 'contacts'
    },
    const {'1': 'pictures', '3': 8, '4': 3, '5': 9, '10': 'pictures'},
  ],
  '3': const [LostAndFoundDetail_ContactsEntry$json],
};

const LostAndFoundDetail_ContactsEntry$json = const {
  '1': 'ContactsEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': const {'7': true},
};

const AddItemReq$json = const {
  '1': 'AddItemReq',
  '2': const [
    const {
      '1': 'type',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.xmux.lost_found.v4.LostAndFoundType',
      '10': 'type'
    },
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '8': const {}, '10': 'name'},
    const {
      '1': 'time',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '8': const {},
      '10': 'time'
    },
    const {
      '1': 'location',
      '3': 4,
      '4': 1,
      '5': 9,
      '8': const {},
      '10': 'location'
    },
    const {
      '1': 'description',
      '3': 5,
      '4': 1,
      '5': 9,
      '8': const {},
      '10': 'description'
    },
    const {
      '1': 'contacts',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.xmux.lost_found.v4.AddItemReq.ContactsEntry',
      '8': const {},
      '10': 'contacts'
    },
  ],
  '3': const [AddItemReq_ContactsEntry$json],
};

const AddItemReq_ContactsEntry$json = const {
  '1': 'ContactsEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': const {'7': true},
};

const DeleteItemReq$json = const {
  '1': 'DeleteItemReq',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};
