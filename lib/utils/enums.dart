enum WeatherState { initial, loading, loaded, error }

enum Chart {
  weeklyRainfall(
    title: "Weekly Rainfall",
    description:
        "This chart illustrates the total rainfall recorded for each day over the past week.",
    imagePath: "assets/pngs/water-splash.png",
  ),
  weeklyAvarageTemperature(
    title: "Weekly Average Temperature",
    description:
        "This chart shows the average high and low temperatures recorded for each day over the past week.",
    imagePath: "assets/pngs/thermometer.png",
  ),
  weeklyDetailedAvarageTemperature(
    title: "Weekly Detailed Average Temperature",
    description:
        "This detailed chart provides both daily average temperatures and a breakdown of hourly data for better analysis.",
    imagePath: "assets/pngs/calendar.png",
  ),
  wind(
    title: "Weekly Wind Analysis",
    description:
        "This chart tracks the wind speed and direction patterns observed throughout the week.",
    imagePath: "assets/pngs/wind.png",
  );

  final String title;
  final String description;
  final String imagePath;

  const Chart({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}
