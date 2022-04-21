# Future Timeouts

Futures are designed for long running tasks, but you don't always want them to run for very long. Some tasks you want to ensure always returns under a certain amount of time. To make sure the future returns in the correct amount of time or fails, you can use the timeout functionality. 

## Timing out

In the main function call the `downloadFile` function and you'll see any value that is passed in will take multiple minutes to complete. Instead of waiting so long, you can stop this function after 1 second using the `timeout` function. 

This function takes a duration (when to time out), and an `onTimeout` function that is called when your duration is complete. You need to return a value in this timeout if your `Future` is expected to return a value.

```dart
await getWeather('Cape Town')
    .timeout(
    Duration(seconds: 1), 
    onTimeout: (){
     print('Future timed out!');
        return 'TIME_OUT'; // Is this valid? In previous steps, `getWeather` returns a `Future<int>`, not a `Future<String>`? This makes it seem like timeout can emit any type of object, but isn't it constrained to returning an `int` here?
     },
  );
```

## Your turn

Use the `timeout` function to stop the `downloadFile` call after 1 second. Print out "Future timed out" at the start of the callback function and Return a value 'TIME_OUT' from the function.

---

When you run the code now, even though you know that the function will take multiple minutes to complete, the timeout will actually kill off that future given the duration and then return the value from the `onTimeout` callback function. You should see similar logs to the one below.

```
Future timed out!
Download URL: TIME_OUT
```

That is everything you need to know about Futures! Well done and thank you for following along. 
