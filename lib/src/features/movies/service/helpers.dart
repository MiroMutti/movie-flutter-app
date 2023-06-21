String getDuration(String movieDuration) {
  RegExp pattern = RegExp(r'PT(\d+)M');
  String duration = '';

  Iterable<Match> matches = pattern.allMatches(movieDuration);

  if (matches.isNotEmpty) {
    Match match = matches.first;
    duration = match.group(1).toString();
//    return duration;
  } else {
    //   print('No digits found.');
  }
  return duration;
}
