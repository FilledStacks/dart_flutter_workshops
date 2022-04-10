# Futures and Errors

Futures has their own way of handling errors ontop of the existing exception catching techniques. Lets start with how we indicate that we have an error.

## Indicate there's an error

We have 2 ways that we can indicate that an error has occurred inside a Future that we have created.

### 1. Future.error

Inside a function that's expected to return a `Future<T>` if we want the calling function to know that something went wrong we can return `Future.error` from the future to trigger an exception state in dart. Update the `getWeather` function to the code below and run it.

```dart
Future<double> getWeather(String location) async {
  print('Fetching weather ...');
  await Future.delayed(Duration(seconds: 3));
  print('weather retrieved');

  // Return a Future.error to indicate something went wrong
  return Future.error('No weather found at $location');
}
```

You'll see the following print out `Uncaught Error: No weather found at Cape Town`. 

### 2. Throw an Exception

In addition to the `Future.error` functionality above you can also throw an Exception from a Future. Update the function to 

```dart
Future<double> getWeather(String location) async {
  print('Fetching weather ...');
  await Future.delayed(Duration(seconds: 3));
  print('weather retrieved');

  // Throw an exception to indicate someting went wrong
  throw Exception('No weather found at $location');
}
```

You'll see a similar console log `Uncaught Error: Exception: No weather found at Cape Town` this time with Exception in there as well. What I want you to notice is that the function execution stopped before getting to the `weather` print statement. This is because the program will crash if there's an unhandled error like this. So lets look at handling these errors.

## Handling Errors

There are 3 different ways to handle errors in Futures and all of them have their place and some of them are up to preference and coding style. Lets start with the ways to handle errors when using async/await.

### 1. Using catchError function

Update your main function to

```dart
Future<void> main() async {
  // Put your code below
  String location = 'Cape Town';
  
  final weather = await getWeather(location)
    .catchError((error) {
        print('Error fetching weather. Message: $error');
        return -99999.0;
      });
  
  print('weather: $weather');
}
```

What we added here is a `catchError` function that will be executed when an exception is thrown or when a Future.error is returned. If you run the code you'll see 

```txt
Fetching weather ...
weather retrieved
Error fetching weather. Message: Exception: No weather found at Cape Town
weather: -99999
```

Note that in the `catchError` we also return a value. The reason for this is that even though we're adding a failure clause, the value of `weather` still needs something to be assigned when this happens so it's your responsibility to return a value to the calling function if one is required. This function will fire for returning a Future.error as well as throwing an Exception.

### 2. Using try/catch function

The other way to handle uncaught errors is by using the universal `try/catch` statement in dart. This can only be done effectively if you're using the `await` keyword. Update the code in your main function to

```dart
Future<void> main() async {
  // Put your code below
  String location = 'Cape Town';
  
  try {
    final weather = await getWeather(location);
    print('weather: $weather');
  } catch(error) {
    print('Error fetching weather. Message: $error');
  }
}
```

You should see a similar logs for returning an Error or throwing an Exception.

```txt
Fetching weather ...
weather retrieved
Error fetching weather. Message: No weather found at Cape Town
```

### 3. Then onError callback

If you have to use the `.then` function then you also have a specific way to handle your errors. Update the code in your main function to 

```dart
Future<void> main() async {
  // Put your code below
  String location = 'Cape Town';
  
  getWeather(location)
    .then(
      (weather) => print('weather: $weather'), 
      onError: (error) => 
          print('Error fetching weather. Message: $error'),
      );
}
```

Phew, that's a lot. But we got through it. That's everything related to errors. This should give you all the tools required to handle any situation with error handling. Lets move on to something less talked about. Handling multiple Futures at the same time.