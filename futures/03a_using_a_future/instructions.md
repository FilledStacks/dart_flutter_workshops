# Using a Future with await and async

Using a Future requires a bit more work. In the first chapter, you learned what would happen if you used asynchronous `Future` code the same way as synchronous ("normal") code. The `await` keywords tells Dart to "pause" execution of the current code function and continue after the future code block has completed. `await` requires the function it's being called in to be marked as async.

```dart
Future myFunction() async {
  await myFuture();
}
```

## Your Turn

<!-- Once again, I just used `print(await getWeather('Berlin'));` and did not store it in a variable called weather. -->
In the main function call `getWeather` using the `async/await` keywords and store the result in a variable called `weather`. Print out "weather: $weather" when complete.

---

The result should look more normal than what you saw in Chapter 1

```
Fetching weather ...
weather retrieved
weather: 30
```

But what if you don't want to turn your calling function into a Future? You will handle that in the next step.
