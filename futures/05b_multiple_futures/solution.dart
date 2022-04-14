Future<void> main() async {
  final fileIdsToDownload = [123, 324, 534, 121, 22, 232, 34];
  await downloadAllFiles(fileIdsToDownload);
}

Future<void> downloadAllFiles(List<int> fileIdsToDownload) async {
  // Create a list of Future<String>
  final downloadFutures = <Future<void>>[];

  // Loop through each Id and call the function to construct the Future
  for (final id in fileIdsToDownload) {
    downloadFutures.add(downloadFile(id));
  }

  // Await on all the Futures together
  await Future.wait(downloadFutures);

  print('Notify user all dowloads are complete!');
}

Future<void> downloadFile(int fileId) async {
  await Future.delayed(Duration(milliseconds: fileId * 10));
  final url = 'http://downloaded.fileid=$fileId';
  print('download complete for: $url at ${DateTime.now()}');
}
