# Multiple Future handling

Lets take an example where you can select multiple items in a list and then you select download to start downloading all of the selected files. On the right you'll see code that stores a list of `filedIdsToDownload`, imagine this list was selected in a UI where you multi select files. Then there's a function called `downloadAllFiles` that we want to complete **when all the files are downloaded**. Our goal is to only complete this function when all files have been downloaded. Lets look at the "normal" way to do this first.

## Normal Async await in a loop

All we'll do is loop over each file id, call the future and `await` on it. You can update your `downloadAllFiles` to the following code:

```dart
Future<void> downloadAllFiles(List<int> fileIdsToDownload) async {
  // Create a list of Future<String>
  final downloadFutures = <Future<String>>[];
  
  // Loop through each Id and download the file for the id
  for(final id in fileIdsToDownload) {
      final url = await downloadFile(id);
  }
  
  print('Notify user all dowloads are complete!');
}
```

You'll see when you run this code the output should look like below and it took 13 seconds to complete. 

```txt
download complete for: http://downloaded.fileid=123 at 2022-04-10 13:53:47.732
download complete for: http://downloaded.fileid=324 at 2022-04-10 13:53:50.981
download complete for: http://downloaded.fileid=534 at 2022-04-10 13:53:56.328
download complete for: http://downloaded.fileid=121 at 2022-04-10 13:53:57.544
download complete for: http://downloaded.fileid=22 at 2022-04-10 13:53:57.770
download complete for: http://downloaded.fileid=232 at 2022-04-10 13:54:00.097
download complete for: http://downloaded.fileid=34 at 2022-04-10 13:54:00.441
Notify user all dowloads are complete!
```

The reason it took 13 seconds is because each future ran "syncrhonously", meaning the next future will only run when the current one completes, which kind of defeats the purpose. Lets look at a better way to do this.


## Waiting for multiple Futures to complete

To imrpove on the normal way of doing this we have to create all the futures in a list and then await on the entire list of futures. Update your `downloadAllFiles` to the following

```dart
Future<void> downloadAllFiles(List<int> fileIdsToDownload) async {
  // Create a list of Future<String>
  final downloadFutures = <Future<String>>[];
  
  // Loop through each Id and call the function to construct the Future
  for(final id in fileIdsToDownload) {
      downloadFutures.add(downloadFile(id));
  }
  
  // Await on all the Futures together
  await Future.wait(downloadFutures);
  
  print('Notify user all dowloads are complete!');
}
```

When you run the the code above you'll see logs like below

```txt
download complete for: http://downloaded.fileid=22 at 2022-04-10 13:51:20.403
download complete for: http://downloaded.fileid=34 at 2022-04-10 13:51:20.521
download complete for: http://downloaded.fileid=121 at 2022-04-10 13:51:21.391
download complete for: http://downloaded.fileid=123 at 2022-04-10 13:51:21.412
download complete for: http://downloaded.fileid=232 at 2022-04-10 13:51:22.502
download complete for: http://downloaded.fileid=324 at 2022-04-10 13:51:23.426
download complete for: http://downloaded.fileid=534 at 2022-04-10 13:51:25.526
Notify user all dowloads are complete!
```

Looking at the time it took to complete. It took 5.5 seconds in total. That's an over 2x increase in by using the `Future.wait` function. The reason for this is simple, all Future's started at the same time and none of them were "blocked" or waiting on the previous one to complete. This feature is not often required but it makes a big difference when it can be applied in the right situation. 

We're almost done and you'll be a Future expert! The last thing to look at is timeouts.



