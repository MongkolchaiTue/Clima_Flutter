import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/weather.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();

    showLocationScreen();
  }

  void showLocationScreen() async {
    WeatherModel weather = WeatherModel();
    dynamic weatherData = await weather.getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        localWeatherData: weatherData,
      );
    }));

    // var longitude = data['coord']['lon'];
    // var weatherDescription = data['weather'][0]['description'];
    // double temperature = weatherData['main']['temp'];
    // int condition = weatherData['weather'][0]['id'];
    // String cityName = weatherData['name'];
    //
    //
    // print('temperature $temperature , condition $condition, cityName $cityName');
    //
    // temperature 285.514 , condition 800, cityName Tawarano
    //เทศบาลเมืองพระประแดง https://www.google.co.th/maps/place/
    // @13.6599936,100.5323128,14z/
    // Performing hot restart...141ms
    // Restarted application in 142ms.
    // 13.5771512
    // 100.5020792
    // temperature 305.78 , condition 804, cityName Thung Khru
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Center(
                child: SpinKitRotatingCircle(
      color: Colors.white,
      size: 50.0,
    ))));
  }
}
