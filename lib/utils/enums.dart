// Enum representing the state of weather data fetching process
enum WeatherState {
  initial, // The initial state before any data fetching starts
  loading, // Indicates that data is currently being fetched
  loaded, // Indicates that data fetching is completed successfully
  error // Indicates that an error occurred during data fetching
}

// Enum representing different types of charts available in the app
enum Chart {
  // Weekly rainfall chart
  weeklyRainfall(
    title: "Weekly Rainfall", // The title of the chart
    description:
        "This chart illustrates the total rainfall recorded for each day over the past week.", // A description of what this chart represents
    imagePath:
        "assets/pngs/water-splash.png", // Path to the image icon for this chart
  ),

  // Weekly average temperature chart
  weeklyAvarageTemperature(
    title: "Weekly Average Temperature", // The title of the chart
    description:
        "This chart shows the average high and low temperatures recorded for each day over the past week.", // A description of the chart's purpose
    imagePath:
        "assets/pngs/thermometer.png", // Path to the image icon for this chart
  ),

  // Detailed weekly average temperature chart
  weeklyDetailedAvarageTemperature(
    title: "Weekly Detailed Average Temperature", // The title of the chart
    description:
        "This detailed chart provides both daily average temperatures and a breakdown of hourly data for better analysis.", // Detailed explanation of the chart
    imagePath:
        "assets/pngs/calendar.png", // Path to the image icon for this chart
  ),

  // Weekly wind analysis chart
  wind(
    title: "Weekly Wind Analysis", // The title of the chart
    description:
        "This chart tracks the wind speed and direction patterns observed throughout the week.", // Explanation of what this chart represents
    imagePath: "assets/pngs/wind.png", // Path to the image icon for this chart
  );

  // Properties for each chart type
  final String title; // The title of the chart
  final String description; // A brief description of the chart
  final String imagePath; // The path to the image representing this chart

  // Constructor for the Chart enum
  const Chart({
    required this.title, // Required title for the chart
    required this.description, // Required description for the chart
    required this.imagePath, // Required image path for the chart
  });
}
