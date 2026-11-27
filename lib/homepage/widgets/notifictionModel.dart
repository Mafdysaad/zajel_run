class AppNotification {
  final int id;
  final String title;
  final String body;
  final String date;
  bool isRead;

  AppNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.date,
    this.isRead = false,
  });
}
