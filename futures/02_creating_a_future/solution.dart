Future<int> calculateSum(int a, int b) async {
  final sum = a + b;
  print('sum calculated');
  return sum;
}

Future<String> combineName(String firstName, String lastName) {
  return Future.value('$firstName $lastName');
}
