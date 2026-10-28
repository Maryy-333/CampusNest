class SubscriptionInfo {
  const SubscriptionInfo({
    required this.planName,
    required this.daysLeft,
    required this.totalDays,
    required this.renewsOn,
    required this.amount,
    required this.isPaid,
  });

  final String planName;
  final int daysLeft;
  final int totalDays;
  final DateTime renewsOn;
  final int amount;
  final bool isPaid;

  bool get isActive => daysLeft > 0;

  /// 0.0 to 1.0, how much of the billing period has passed.
  double get progress => totalDays <= 0
      ? 1.0
      : ((totalDays - daysLeft) / totalDays).clamp(0.0, 1.0);

  /// "Active · 24 days left" / "Plan expired"
  String get statusLabel => isActive
      ? 'Active · $daysLeft ${daysLeft == 1 ? 'day' : 'days'} left'
      : 'Plan expired';
}
