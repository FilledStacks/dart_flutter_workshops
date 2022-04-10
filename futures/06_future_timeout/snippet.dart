Future<void> main() async {
  // Place your code here
}

Future<String> downloadFile(int fileId) async {
  await Future.delayed(Duration(milliseconds: fileId * 100000));
  final url = 'http://downloaded.fileid=$fileId';
  print('download complete for: $url at ${DateTime.now()}');
  return url;
}
