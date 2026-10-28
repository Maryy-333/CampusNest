enum ListingStatus {
  live('Live'),
  draft('Draft');

  const ListingStatus(this.label);
  final String label;
}

class ListingSummary {
  const ListingSummary({
    required this.id,
    required this.title,
    required this.monthlyRent,
    required this.vacantCount,
    required this.status,
  });

  final String id;
  final String title;
  final int monthlyRent;
  final int vacantCount;
  final ListingStatus status;
}
