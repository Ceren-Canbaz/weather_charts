# **Weather Charts**

A Flutter-based application to visualize weather data through dynamic charts and intuitive UI components.
![](https://github.com/Ceren-Canbaz/weather_charts/blob/main/assets/project_captures/weather_charts_usage.gif)

---


## **Key Features**

- Dynamic weather visualizations with custom charts.
- Modular and maintainable architecture.
- Comprehensive state management using `ValueNotifier`.
- Theme and reusable widgets for scalability.

---

## **Screens**



<p align="center">
  
  <img src="https://github.com/Ceren-Canbaz/weather_charts/blob/main/assets/project_captures/home.png" alt="Temperature Chart" width="200"/>
  <img src="https://github.com/Ceren-Canbaz/weather_charts/blob/main/assets/project_captures/home_2.png" alt="Temperature Chart" width="200"/>
  <img src="https://github.com/Ceren-Canbaz/weather_charts/blob/main/assets/project_captures/rainfall_chart.png" alt="Temperature Chart" width="200"/>
  <img src="https://github.com/Ceren-Canbaz/weather_charts/blob/main/assets/project_captures/temperature_chart.png" alt="Temperature Chart" width="200"/>
  <img src="https://github.com/Ceren-Canbaz/weather_charts/blob/main/assets/project_captures/wind_chart.png" alt="Temperature Chart" width="200"/>
  

</p>

---
## **Project Structure**

The project is organized into the following directories:
### **Diagram Representation**

```
lib/
│
├── entities/                 # Data models (e.g., Weather, Wind, DailyWeather)
│   ├── daily_weather.dart
│   ├── weather.dart
│   └── wind.dart
│
├── services/                 # Business logic and data fetching
│   └── weather_service.dart
│
├── theme/                    # Application-wide themes
│   └── theme.dart
│
├── utils/                    # Constants and enums
│   ├── app_constants.dart
│   └── enums.dart
│
├── viewmodels/               # State management
│   └── weather_viewmodel.dart
│
├── views/                    # Screens and main pages
│   ├── weather_view.dart
│   └── chart_detail_view.dart
│
└── widgets/                  # Reusable components and charts
    ├── charts/
    │   ├── rainfall_chart.dart
    │   ├── temperature_chart.dart
    │   ├── temperature_dynamic_chart.dart
    │   └── wind_direction_chart.dart
    │
    └── weather_widgets/
        ├── chart_button_grid.dart
        ├── chart_card_button.dart
        ├── current_weather.dart
        ├── today_weather.dart
        ├── weather_day_card.dart
        ├── weather_hour_card.dart
        ├── weather_icon.dart
        ├── week_weather.dart
        ├── error_widget.dart
        ├── home_widget.dart
        ├── initial_widget.dart
        └── loading_widget.dart
```

---


### **`lib/`**

The root directory of the application, containing all source code.

#### **1. `entities/`**
Contains data models representing the core weather-related entities.

- **`daily_weather.dart`**: Represents daily weather data, including hourly breakdown and temperature extremes.
- **`weather.dart`**: Represents hourly weather details, including temperature, wind, and rainfall.
- **`wind.dart`**: Represents wind data, including speed and direction.

---

#### **2. `services/`**
Handles business logic and data fetching from assets or APIs.

- **`weather_service.dart`**: Fetches and processes weather data from the `assets/weather.json` file.

---

#### **3. `theme/`**
Defines application-wide themes and styles.

- **`theme.dart`**: Contains color palettes, typography, and other theme configurations.

---

#### **4. `utils/`**
Utility classes, constants, and enums used across the project.

- **`app_constants.dart`**: Includes global constants such as stroke widths, day names, etc.
- **`enums.dart`**: Defines enums for state management and chart types.

---

#### **5. `viewmodels/`**
Manages state and business logic for views.

- **`weather_viewmodel.dart`**: Handles weather state management using `ValueNotifier` and provides data to UI components.

---

#### **6. `views/`**
Holds the main screens and pages of the application.

- **`weather_view.dart`**: The main screen displaying weather data, handling state, and rendering dynamic widgets.
- **`chart_detail_view.dart`**: Displays detailed charts for specific weather metrics, such as temperature or wind.

---

#### **7. `widgets/`**
Reusable UI components and charts.

##### **a. `charts/`**
Custom chart widgets for visualizing weather data.

- **`rainfall_chart.dart`**: Displays weekly rainfall data as a chart.
- **`temperature_chart.dart`**: Visualizes weekly high and low temperatures.
- **`temperature_dynamic_chart.dart`**: A more detailed temperature chart with dynamic data.
- **`wind_direction_chart.dart`**: A custom wind direction chart with a radial design.

##### **b. `weather_widgets/`**
Reusable widgets specific to weather data display.

- **`chart_button_grid.dart`**: A grid of buttons for selecting different charts.
- **`chart_card_button.dart`**: Represents a single chart selection button.
- **`current_weather.dart`**: Displays the current weather details.
- **`today_weather.dart`**: Shows hourly weather data for the current day.
- **`weather_day_card.dart`**: Displays daily weather details in a card format.
- **`weather_hour_card.dart`**: Represents hourly weather information in a card.
- **`weather_icon.dart`**: Dynamically renders weather icons based on temperature.
- **`week_weather.dart`**: Displays the weekly weather forecast.
- **`error_widget.dart`**: Displays an error message with a retry button.
- **`home_widget.dart`**: A central widget displaying today's weather, weekly forecast, and chart options.
- **`initial_widget.dart`**: Displays an initial state message before data fetching.
- **`loading_widget.dart`**: A loading indicator widget.

---

## **Assets**

- **`assets/`**: Contains static resources such as JSON data and images.
  - **`weather.json`**: Weather data in JSON format.
  - **`pngs/`**: Contains weather-related icons (e.g., `sun.png`, `cloudy.png`, etc.).



