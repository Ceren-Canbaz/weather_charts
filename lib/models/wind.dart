class Wind {
  final double speed;
  final double direction;

  Wind({
    required this.speed,
    required this.direction,
  });
  factory Wind.fromMap(Map<String, dynamic> map) {
    return Wind(
      speed: (map['speed'] as num).toDouble(),
      direction: (map['direction'] as num).toDouble(),
    );
  }
}
