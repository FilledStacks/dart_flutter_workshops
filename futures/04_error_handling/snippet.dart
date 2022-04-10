Future<void> main() async {
  // Put your code below
  String location = 'Cape Town';

  final weather = await getWeather(location);
  print('weather: $weather');
}

Future<double> getWeather(String location) async {
  print('Fetching weather ...');
  await Future.delayed(Duration(seconds: 2));
  print('weather retrieved');
  return 30;
}
