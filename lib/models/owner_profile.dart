class OwnerProfile {
  const OwnerProfile({
    required this.hostelName,
    required this.email,
    required this.rating,
    required this.unreadMessages,
  });

  final String hostelName;
  final String email;
  final double rating;
  final int unreadMessages;
}
