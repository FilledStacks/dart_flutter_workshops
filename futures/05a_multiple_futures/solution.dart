Future<void> main() async {
  final fileIdsToDownload = [123, 324, 534, 121, 22, 232, 34];
  await downloadAllFiles(fileIdsToDownload);
}

Future<void> downloadAllFiles(List<int> fileIdsToDownload) async {
  // Loop through each Id and download the file for the id
  for (final id in fileIdsToDownload) {
    await downloadFile(id);
  }

  print('Notify user all dowloads are complete!');
}

Future<void> downloadFile(int fileId) async {
  await Future.delayed(Duration(milliseconds: fileId * 10));
  final url = 'http://downloaded.fileid=$fileId';
  print('download complete for: $url at ${DateTime.now()}');
}
