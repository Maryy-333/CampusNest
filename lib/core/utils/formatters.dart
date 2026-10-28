/// "Al-Noor Hostel" -> "AN", "Bilal Khan" -> "BK"
String initialsOf(String name) {
  final parts = name
      .trim()
      .split(RegExp(r'[\s\-]+'))
      .where((p) => p.isNotEmpty)
      .toList();
  if (parts.isEmpty) return '?';
  final second = parts.length > 1 ? parts[1][0] : '';
  return (parts.first[0] + second).toUpperCase();
}

/// 18000 -> "Rs 18,000"
String formatRs(int amount) {
  final withCommas = amount.toString().replaceAllMapped(
    RegExp(r'\B(?=(\d{3})+(?!\d))'),
    (_) => ',',
  );
  return 'Rs $withCommas';
}

/// DateTime(2026, 11, 20) -> "Nov 20"
String formatShortDate(DateTime d) {
  const months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  return '${months[d.month - 1]} ${d.day}';
}

/// "now", "2m", "1h", "3d", or "Nov 20" for older dates.
String timeAgoShort(DateTime time, {DateTime? now}) {
  final diff = (now ?? DateTime.now()).difference(time);
  if (diff.inMinutes < 1) return 'now';
  if (diff.inMinutes < 60) return '${diff.inMinutes}m';
  if (diff.inHours < 24) return '${diff.inHours}h';
  if (diff.inDays < 7) return '${diff.inDays}d';
  return formatShortDate(time);
}
