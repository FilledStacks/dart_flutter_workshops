Future<double> getWeather(String location) async {
  print('Fetching weather ...');
  await Future.delayed(Duration(seconds: 2));
  print('weather retrieved');
  return 30;
}

Future<double> getWind(String location) async {
  print('Fetching wind ...');
  await Future.delayed(Duration(seconds: 2));
  print('weather wind');
  return 5.4;
}
