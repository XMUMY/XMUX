///
//  Generated code. Do not modify.
//  source: aaos.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const Info$json = const {
  '1': 'Info',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {
      '1': 'gender',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.xmux.core.aaos.v4.Info.Gender',
      '10': 'gender'
    },
    const {'1': 'id', '3': 3, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'programme', '3': 4, '4': 1, '5': 9, '10': 'programme'},
    const {
      '1': 'intake',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'intake'
    },
    const {'1': 'nationality', '3': 6, '4': 1, '5': 9, '10': 'nationality'},
  ],
  '4': const [Info_Gender$json],
};

const Info_Gender$json = const {
  '1': 'Gender',
  '2': const [
    const {'1': 'male', '2': 0},
    const {'1': 'female', '2': 1},
  ],
};

const Timetable$json = const {
  '1': 'Timetable',
  '2': const [
    const {
      '1': 'classes',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.xmux.core.aaos.v4.Timetable.Class',
      '10': 'classes'
    },
  ],
  '3': const [Timetable_Class$json],
};

const Timetable_Class$json = const {
  '1': 'Class',
  '2': const [
    const {'1': 'cid', '3': 1, '4': 1, '5': 9, '10': 'cid'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'lecturer', '3': 3, '4': 1, '5': 9, '10': 'lecturer'},
    const {'1': 'room', '3': 4, '4': 1, '5': 9, '10': 'room'},
    const {
      '1': 'begin',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'begin'
    },
    const {
      '1': 'end',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'end'
    },
    const {'1': 'day', '3': 7, '4': 1, '5': 13, '10': 'day'},
  ],
};

const Courses$json = const {
  '1': 'Courses',
  '2': const [
    const {
      '1': 'courses',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.xmux.core.aaos.v4.Courses.Course',
      '10': 'courses'
    },
  ],
  '3': const [Courses_Course$json],
};

const Courses_Course$json = const {
  '1': 'Course',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'credit', '3': 2, '4': 1, '5': 13, '10': 'credit'},
    const {'1': 'lecturer', '3': 3, '4': 1, '5': 9, '10': 'lecturer'},
  ],
};

const Exams$json = const {
  '1': 'Exams',
  '2': const [
    const {
      '1': 'exams',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.xmux.core.aaos.v4.Exams.Exam',
      '10': 'exams'
    },
  ],
  '3': const [Exams_Exam$json],
};

const Exams_Exam$json = const {
  '1': 'Exam',
  '2': const [
    const {'1': 'exam', '3': 1, '4': 1, '5': 9, '10': 'exam'},
    const {
      '1': 'begin',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'begin'
    },
    const {
      '1': 'end',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'end'
    },
    const {'1': 'venue', '3': 4, '4': 1, '5': 9, '10': 'venue'},
    const {'1': 'courseName', '3': 5, '4': 1, '5': 9, '10': 'courseName'},
    const {'1': 'type', '3': 6, '4': 1, '5': 9, '10': 'type'},
    const {'1': 'status', '3': 7, '4': 1, '5': 9, '10': 'status'},
  ],
};

const Transcript$json = const {
  '1': 'Transcript',
  '2': const [
    const {
      '1': 'sessions',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.xmux.core.aaos.v4.Transcript.Session',
      '10': 'sessions'
    },
  ],
  '3': const [Transcript_Session$json],
};

const Transcript_Session$json = const {
  '1': 'Session',
  '2': const [
    const {'1': 'session', '3': 1, '4': 1, '5': 9, '10': 'session'},
    const {
      '1': 'courses',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.xmux.core.aaos.v4.Transcript.Session.Course',
      '10': 'courses'
    },
    const {'1': 'gpa', '3': 3, '4': 1, '5': 2, '10': 'gpa'},
    const {'1': 'cGpa', '3': 4, '4': 1, '5': 2, '10': 'cGpa'},
  ],
  '3': const [Transcript_Session_Course$json],
};

const Transcript_Session_Course$json = const {
  '1': 'Course',
  '2': const [
    const {'1': 'code', '3': 1, '4': 1, '5': 9, '10': 'code'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'credit', '3': 3, '4': 1, '5': 13, '10': 'credit'},
    const {'1': 'grade', '3': 4, '4': 1, '5': 9, '10': 'grade'},
    const {'1': 'point', '3': 5, '4': 1, '5': 2, '10': 'point'},
  ],
};
