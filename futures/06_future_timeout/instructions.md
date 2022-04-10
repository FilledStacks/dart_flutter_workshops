# Future Timeouts

Futures are there for long running tasks but we don't always want them to run for very long. Some tasks we want to ensure always returns under a certain amount of time. Things like fetching data from our backend. To make sure our future returns in the correct amount of time or fails instead we can use the timeout functionality. 

## Timing out

In the main function we can call our `downloadFile` function and we'll see any value we pass in will take multiple minutes to complete. So, if we want to make sure it completes or fails in 1 second we can use the timeout function. Call the future and add a `.timeout` function call like below

```dart
Future<void> main() async {
  final downloadUrl = await downloadFile(2)
      .timeout(
        Duration(seconds: 1), 
        onTimeout: (){
          print('Future timed out!');
          return 'TIME_OUT';
        },
      );
  print('Download URL: $downloadUrl');
}
```

When you run the code now, even though we know that the function will take multiple minutes to complete, the timeout will actually kill off that future given the duration and then return the value from the `onTimeone` callback function. You should see similar logs to the one below.

```dart
Future timed out!
Download URL: TIME_OUT
```

And with that, you should be able to handle all your `Future` requirements with `Futures` 🙈 .Thank you for following along, I am working on a Streams guide which I'll be posting [on my Twitter](https://twitter.com/filledstacks). There's some goodies in there!
