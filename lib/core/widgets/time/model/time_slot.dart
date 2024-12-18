class TimeSlot {
  final String time;
  final bool isAvailable;

  const TimeSlot({
    required this.time,
    this.isAvailable = true,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimeSlot &&
          runtimeType == other.runtimeType &&
          time == other.time &&
          isAvailable == other.isAvailable;

  @override
  int get hashCode => time.hashCode ^ isAvailable.hashCode;
}
