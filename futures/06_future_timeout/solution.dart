Future<void> main() async {
  // Place your code here
  final downloadUrl = await downloadFile(2).timeout(
    Duration(seconds: 1),
    onTimeout: () {
      print('Future timed out!');
      return 'TIME_OUT';
    },
  );

  print('Download URL: $downloadUrl');
}

Future<String> downloadFile(int fileId) async {
  await Future.delayed(Duration(milliseconds: fileId * 100000));
  final url = 'http://downloaded.fileid=$fileId';
  print('download complete for: $url at ${DateTime.now()}');
  return url;
}
