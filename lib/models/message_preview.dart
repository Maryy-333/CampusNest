class MessagePreview {
  const MessagePreview({
    required this.id,
    required this.senderName,
    required this.preview,
    required this.sentAt,
    required this.isUnread,
  });

  final String id;
  final String senderName;
  final String preview;
  final DateTime sentAt;
  final bool isUnread;
}
