import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<String?> getApiKeyOpenweathermap() async {
  //defaults to file name load(fileName: ".env")
  //dotenv.get('MISSING', fallback: 'Default fallback value')
  await dotenv.load();
  return dotenv.env['ApiKeyOpenweathermap'];
}
  
const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);
