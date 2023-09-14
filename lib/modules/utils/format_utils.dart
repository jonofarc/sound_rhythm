import 'dart:ffi';

class FormatUtils {
  static String formatDuration(Duration? duration) {
    var timeString = "";
    if (duration != null) {
      timeString =
          '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
    }
    return timeString;
  }

  static String formatNum(num? number) {
    var timeString = "";
    if (number != null) {
      timeString = formatDuration(Duration(seconds: number.toInt()));
    }
    return timeString;
  }

  static String formatSeconds(int durationInSeconds) {
    return formatDuration(Duration(seconds: durationInSeconds));
  }
}
