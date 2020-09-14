///
//  Generated code. Do not modify.
//  source: news.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const Slider$json = const {
  '1': 'Slider',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'id'},
    const {'1': 'level', '3': 2, '4': 1, '5': 5, '8': const {}, '10': 'level'},
    const {
      '1': 'releaseDate',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '8': const {},
      '10': 'releaseDate'
    },
    const {
      '1': 'translations',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.xmux.core.news.v4.Slider.TranslationsEntry',
      '8': const {},
      '10': 'translations'
    },
  ],
  '3': const [Slider_Translation$json, Slider_TranslationsEntry$json],
};

const Slider_Translation$json = const {
  '1': 'Translation',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'title'},
    const {
      '1': 'imageUrl',
      '3': 2,
      '4': 1,
      '5': 9,
      '8': const {},
      '10': 'imageUrl'
    },
    const {'1': 'launchUrl', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'launchUrl'},
    const {
      '1': 'webviewUrl',
      '3': 4,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'webviewUrl'
    },
  ],
  '8': const [
    const {'1': 'action'},
  ],
};

const Slider_TranslationsEntry$json = const {
  '1': 'TranslationsEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.xmux.core.news.v4.Slider.Translation',
      '10': 'value'
    },
  ],
  '7': const {'7': true},
};

const DeleteSliderReq$json = const {
  '1': 'DeleteSliderReq',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'id'},
  ],
};

const SlidersResp$json = const {
  '1': 'SlidersResp',
  '2': const [
    const {
      '1': 'sliders',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.xmux.core.news.v4.Slider',
      '10': 'sliders'
    },
  ],
};

const Announcement$json = const {
  '1': 'Announcement',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'id'},
    const {'1': 'level', '3': 2, '4': 1, '5': 5, '8': const {}, '10': 'level'},
    const {
      '1': 'releaseDate',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '8': const {},
      '10': 'releaseDate'
    },
    const {
      '1': 'translations',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.xmux.core.news.v4.Announcement.TranslationsEntry',
      '8': const {},
      '10': 'translations'
    },
  ],
  '3': const [
    Announcement_Translation$json,
    Announcement_TranslationsEntry$json
  ],
};

const Announcement_Translation$json = const {
  '1': 'Translation',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'title'},
    const {'1': 'from', '3': 2, '4': 1, '5': 9, '8': const {}, '10': 'from'},
    const {'1': 'text', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'text'},
  ],
  '8': const [
    const {'1': 'content'},
  ],
};

const Announcement_TranslationsEntry$json = const {
  '1': 'TranslationsEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.xmux.core.news.v4.Announcement.Translation',
      '10': 'value'
    },
  ],
  '7': const {'7': true},
};

const DeleteAnnouncementReq$json = const {
  '1': 'DeleteAnnouncementReq',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'id'},
  ],
};

const AnnouncementsResp$json = const {
  '1': 'AnnouncementsResp',
  '2': const [
    const {
      '1': 'announcements',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.xmux.core.news.v4.Announcement',
      '10': 'announcements'
    },
  ],
};
