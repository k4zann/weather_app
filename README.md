# WeatherApp

WeatherApp is a Flutter application that provides detailed weather information for various cities. The app leverages a modern and user-friendly interface to display current weather conditions and forecasts, making it easy for users to stay updated with the latest weather updates.

## Features

- **Current Weather Information**: Get real-time weather data including temperature, humidity, wind speed, and more for your chosen city.
- **7-Day Weather Forecast**: View a detailed 7-day weather forecast to plan your week accordingly.
- **Beautiful UI with Gradient Backgrounds**: The app uses gradient backgrounds to reflect the weather conditions, providing an engaging user experience.
- **Animated Loading Screen**: Custom animated loading screen to enhance user experience while data is being fetched.
- **Navigation with GoRouter**: Smooth navigation between different screens using the GoRouter package.
- **State Management with Bloc**: Efficient state management using the Bloc pattern to handle the complex state of the weather data.

## Technologies Used

- **Flutter**: The UI toolkit used to build the natively compiled application for mobile.
- **Dart**: The programming language used to write the Flutter application.
- **Bloc**: For state management to handle the business logic and maintain app state.
- **GoRouter**: For managing in-app navigation.
- **intl**: For date and time formatting.
- **awesome_extensions**: For additional useful extensions in Flutter.
- **Weather API**: For fetching real-time weather data.

## Getting Started

To get started with the project, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/weather_app.git
   cd weather_app
   code .
   flutter pub get
2. **Run the code**


## Usage

### WeatherDetailsPage
The `CityListPage` is the main screen where users can view main information about the weather of cities. 
The `WeatherDetailsPage` is the second screen where users can view detailed information about the of specific city.
They utilize the following features:
- **BlocProvider** to provide the `WeatherBloc` to the widget tree.
- **BlocBuilder** to build the UI based on the `WeatherState`.
- **Stack** and **Positioned** widgets to create a layered layout with a back button and gradient background.
- **SafeArea** to ensure the UI is rendered within the safe areas of the screen.
- **WeatherInfo** and **WeatherTab** widgets to display current weather details and the 7-day forecast.

### WeatherBloc
The `WeatherBloc` handles the fetching and state management of the weather data. It interacts with the `WeatherRepositoryImpl` to fetch data from the `WeatherApiService`.

### WeatherApiService
This service is responsible for making network requests to the weather API and returning the parsed weather data.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.
