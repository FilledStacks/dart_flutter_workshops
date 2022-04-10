# Why use Futures?

There are two types of tasks when writing software. Synchronous and Asynchronous and you ALWAYS need to use both. Futures are used for asynchronous tasks. Lets look at an example of both. In the code on the right we have 2 functions. 

1. `calculateSum`: This function takes in 2 values and returns the sum of those two values
2. `getWeather`: This function "requests the weather information from somewhere else" and has to wait for that data to come back. In our example we just pause for 3 seconds, but in real life it would make a request.

The first funcion is synchronous, this means that the code will only continue to execute when this function is complete. Put the code below into the main function

```dart
int a = 1, b =2;
int sum = calculateSum(a, b);
print('sum: $sum');
```

Then the program would complete the execution of each step before continuing on to the next line of code. You would see the logs like this

```txt
sum calculated
sum: 3
```

This is synchronous. Each line completes before moving to the next. Now lets look at the `getWeather` function. It uses a type Future, How do we write code for that? The answer is ... Not like the code above 🤯 If we do, some strange things happen. Update your code in the main function to the code below.

```dart
String location = 'Cape Town';
final weather = getWeather(location);
print('weather: $weather');
```

If you run this code you'll see that the last logs look a bit weird. 

```txt
weather: Instance of 'Future<double>'
weather retrieved
```

The first thing to notice is `Instance of Future<double>`, we returned 30 and it's not printed out anywhere. The second and more important thing to notice is Weather retrieved printed out after the `print('weather: $weather');` statement but the function was called before it. 

To dive deeper into this lets learn more about Futures in Dart!