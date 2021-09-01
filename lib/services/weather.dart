import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:geolocator/geolocator.dart';

const apiKey = "352b2cbf6b73be7322c36edff4d99432";
const Weatherurl = "http://api.openweathermap.org/data/2.5/weather";

class WeatherModel {
  Future<dynamic> cityWeather(String cityName) async {
    NetworkHelper networkHelper = await NetworkHelper(
        "$Weatherurl?q=$cityName&appid=$apiKey&units=metric");

    var weatherData = networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> weatherData() async {
    Position location = await getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        "$Weatherurl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric");

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
