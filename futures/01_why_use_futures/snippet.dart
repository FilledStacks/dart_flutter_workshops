void main() {
  // Put your code below
}

int calculateSum(int a, int b) {
  final sum = a + b;
  print('sum calculated');
  return sum;
}

Future<double> getWeather(String location) async {
  print('Fetching weather ...');
  await Future.delayed(Duration(seconds: 2));
  print('weather retrieved');
  return 30;
}
