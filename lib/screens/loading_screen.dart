
import 'package:flutter/material.dart';
import '../services/location.dart';
import '../services/networking.dart';
import '../utilities/constants.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    String? apiKey = await getApiKeyOpenweathermap();
    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey');
    var weatherData = await networkHelper.getData();

      // var longitude = data['coord']['lon'];
      // var weatherDescription = data['weather'][0]['description'];
      double temperature = weatherData['main']['temp'];
      int condition = weatherData['weather'][0]['id'];
      String cityName = weatherData['name'];


      print('temperature $temperature , condition $condition, cityName $cityName');

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
      body: Center(
        child: TextButton(
          onPressed: () {
            //Get the current location
            getLocationData();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
