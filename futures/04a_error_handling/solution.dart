Future<double> getWeather(String location) async {
  print('Fetching weather ...');
  await Future.delayed(Duration(seconds: 3));
  print('weather retrieved');

  // Return a Future.error to indicate something went wrong
  return Future.error('No weather found at $location');
}

Future<double> getWind(String location) async {
  print('Fetching wind ...');
  await Future.delayed(Duration(seconds: 2));
  print('weather wind');

  // Return a Future.error to indicate something went wrong
  throw Exception('No weather found at $location');
}
