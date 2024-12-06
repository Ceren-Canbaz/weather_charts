/// Represents wind data including speed and direction.
///
/// The [Wind] class includes:
/// - [speed] : The speed of the wind.
/// - [direction] : The direction of the wind in degrees.
///
/// Provides:
/// - A factory constructor (`fromMap`) to parse wind data from a map.
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
