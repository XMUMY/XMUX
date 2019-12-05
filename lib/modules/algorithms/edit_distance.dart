import 'dart:math';

/// Compute edit distance between two strings.
int editDistance(String str1, String str2) {
  var dp =
      List.generate(str1.length + 1, (_) => List.filled(str2.length + 1, 0));

  for (var i = 0; i <= str1.length; i++) dp[i][0] = i;
  for (var i = 0; i <= str2.length; i++) dp[0][i] = i;
  for (var i = 1; i <= str1.length; i++)
    for (var j = 1; j <= str2.length; j++) {
      if (str1.codeUnitAt(i - 1) == str2.codeUnitAt(j - 1))
        dp[i][j] = dp[i - 1][j - 1];
      else
        dp[i][j] = min(dp[i - 1][j - 1], min(dp[i - 1][j], dp[i][j - 1])) + 1;
    }

  return dp[str1.length][str2.length];
}
