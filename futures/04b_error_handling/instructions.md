# Handle Errors from a Future

In addition to normal the `try/catch`, Futures offer two specific ways to handle errors.

## 1. Using catchError function

Similar to the `.then` function you can also call the `.catchError` function on a Future. This function takes in a callback function that passes the error as an object and expects you to return a value that is the same type as the future. _This is a "Catch all" solution where you cannot specify the type of error you want to catch._

```dart
myBoolFuture().catchError((error) {
  print('An error happened: $error');
  return false;
});
```

### Your Turn

On the `getWeather` function call, call the `catchError` function and print out "Error fetching weather. $error".

---

If you run the code you should see

```
Fetching weather ...
weather retrieved
Error fetching weather. No weather found at Cape Town
weather: -99999
```

You have to return a value from the catchError function because even though you are adding a failure clause, the value of `weather` still needs something to be assigned when this happens. It's your responsibility to return a value to the calling function if one is required.

## 2. Then onError callback

<!-- Can you give an example of onError handling an error of a specific type? The code example below appears as though it handles all types of errors?-->
If you are using `.then`, you also have a specific way to handle your errors. The function has a named parameter `onError` where you can supply a callback function that accepts a single object as a parameter. _This function can fire for an error of a specific type. This is used for more precise error handling than the `catchError` function above._

```dart
  myFuture()
    .then(
      (weather){}, 
      onError: (error) => 
          print('I am an error. $error'),
      );
}
```

### Your Turn

Call the `getWind` fuction using .then and handle the error for it in the `onError` callback.

---

You almost know everything about using futures. Lets move on to something less talked about. Handling multiple futures at the same time.