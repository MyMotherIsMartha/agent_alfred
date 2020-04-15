String restTime(int endTime, {int startTime}) {
  if (startTime == null) {
    startTime = (DateTime.now().millisecondsSinceEpoch).round();
  }
  int restTime = ((endTime - startTime) / 1000).round();
  if (restTime != null) {
    int day = (restTime / 3600 / 24).floor();
    int hour = (restTime /3600 % 24).floor();
    int min = restTime % 3600 ~/ 60;
    // int sec = restTime % 60;
    return '$day天$hour时$min分';
  }
  return '未知';
}
