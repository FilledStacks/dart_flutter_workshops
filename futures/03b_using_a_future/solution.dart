Future<void> main() async {
  // Put your code below
  getWeather('Cape Town').then((weather) => print('weather: $weather'));
  print('I am the last line!');
}

Future<double> getWeather(String location) async {
  print('Fetching weather ...');
  await Future.delayed(Duration(seconds: 2));
  print('weather retrieved');
  return 30;
}
