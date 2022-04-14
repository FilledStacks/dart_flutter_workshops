Future<void> main() async {
  final weather = await getWeather('Cape Town').catchError((error) {
    print('Error fetching weather. Message: $error');
    return -99999.0;
  });

  print('weather: $weather');

  getWind('Durban').then(
    (value) => print('wind: $value'),
    onError: (error) => print('Error fetching wind. Message: $error'),
  );
}

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
  throw Exception('No weather found at $location');
}
