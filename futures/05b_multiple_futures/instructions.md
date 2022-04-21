
# Waiting for multiple Futures to complete

In contrast to the previous example, instead of waiting for a future to complete before starting the next one, you will start all futures at the same time and wait for all of them to finish.

## Future.wait

The future class provides you with a static utility function that can be used to wait for multiple futures given an `Iterable` of `Future<T>`.

```dart
await Future.wait([
    getWeather(),
    getWind(),
]);
```

## Your Turn

In the `downloadAllFiles` function, go through the list of FileId's to download and call the `downloadFile` function and store the returning Future in a list. Then use the `Future.wait` call to wait on all those Futures to complete.

---

When you run the the code above you'll see logs like below

```
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

You're almost done and you'll be a Future expert! The last thing to look at is timeouts.



