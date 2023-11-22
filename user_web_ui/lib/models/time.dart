//2023-03-28 12:00:00.000Z
class Time {
  final DateTime dateTime;

  Time.fromJson(Map<String, dynamic> json)
      : dateTime = DateTime.parse(json['datetime']);
}
