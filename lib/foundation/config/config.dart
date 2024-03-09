// Fallback version

const fallbackBuildName = String.fromEnvironment(
  'FLUTTER_BUILD_NAME',
  defaultValue: 'SNAPSHOT',
);
const fallbackBuildNumber = int.fromEnvironment(
  'FLUTTER_BUILD_NUMBER',
  defaultValue: 1,
);

// 3rd-party app key

const wolframAppId = String.fromEnvironment('WOLFRAM_APP_ID');
const sentryDsn = String.fromEnvironment('SENTRY_DSN');

// Backend connection

const moodleAddress = 'https://l.xmu.edu.my';
const apiAddress = String.fromEnvironment('API_ADDRESS');
const attendanceAddress = String.fromEnvironment('ATTENDANCE_ADDRESS');

// Sites

const websiteAddress = 'https://xmux.xdea.io';
const docsAddress = 'https://docs.xmux.xdea.io';
