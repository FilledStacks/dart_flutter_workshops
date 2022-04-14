Future<void> main() async {
  // Put your code below
  final weather = await getWeather('Cape Town');
  print('weather: $weather');
}

Future<double> getWeather(String location) async {
  print('Fetching weather ...');
  await Future.delayed(Duration(seconds: 2));
  print('weather retrieved');
  return 30;
}
