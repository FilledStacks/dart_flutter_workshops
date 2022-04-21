# Using .then with Future

It's a common occurence that you might not want to turn your calling function into a Future when using other `futures`. You can use a future without using `async/await` by calling the `then` function on a future type and giving it a function to call when the Future value returns. 


```dart
  myFuture().then(
    (futureValue) => print('future returned: $futureValue')
  )
```

## Your Turn

Call `getWeather` and print out the value returned without using async/await.

---


When you run this you'll see console output is in the same order as expected. In this code what you told dart is "Don't wait for this code to complete, but when it does complete call this function I'm giving you inside `then`.

## Bonus

This has a nice (sometimes sneaky, side effect). The code will continue to execute all code after calling `getWeather` regardless of if it's has returned it's value. 

Add a print statement after you call `getWeather` as the last line in the function and run it. You'll see the last line is output before `getWeather` completes.

---

Now that you know how to use Futures, what happens when an error happens during that long running process? You'll cover that in the next step.
