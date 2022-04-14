# Notify of Errors in a Future

There are 2 ways that you can indicate that an error has occurred inside a Future that you have created.

## 1. Future.error

Inside a function that's expected to return a `Future<T>` if you want the calling function to know that something went wrong you can return `Future.error("My error")` from the future to trigger an exception state in dart. 

## Your Turn

Update the `getWeather` function to return an error that tells the caller "No weather found at $location".


### 2. Throw an Exception

In addition to the `Future.error` functionality above you can also throw an Exception from a Future. 

## Your Turn

Update the `getWind` function and throw an exception that says "No weather found at $location".

---

Now that you've indicated there's an error, you need to handle that error. You'll do this in the next step.
