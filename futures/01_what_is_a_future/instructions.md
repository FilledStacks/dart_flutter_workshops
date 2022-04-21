# What is a Future?

There are two types of tasks when writing software. Synchronous and Asynchronous and you ALWAYS need to use both. Futures are used for asynchronous tasks. Lets look at an example of both. In the code on the right there are 2 functions. 

1. `calculateSum`: This function takes in 2 values and returns the sum of those two values
2. `getWeather`: This function contains a long running task and has to wait for that to complete before returning the expected result.

The first funcion is synchronous, this means that the code will only continue to execute when this function is complete. 

## Your Turn

In `main`, call `calculateFunction` and print out the result.

---

Run this code and you'll see the program will complete the execution of each step before continuing on to the next line of code. If you click on the console tab under the code you'll see logs like below.

```
sum calculated
sum: 3
```

This is a synchronous task. Each line of code completes before moving to the next. Now, lets look at the `getWeather()` function. It has the type `Future`, How do you get an actual value from this function? The answer is ... Not like the code above 🤯 

## Your Turn

For this example, lets just write it the wrong way 🙈 Under the code you added above call the `getWeather` future and print out the response similar to above. 

---

If you run this code (and you did it the wrong way 😉) you'll see that the console output looks a bit weird. You'll see an additional 3 log outputs.

```
Fetching weather ...
weather: Instance of 'Future<double>'
weather retrieved
```

The first thing to notice is `Instance of Future<double>`, you returned 30 and it's not printed out anywhere. The second and more important thing to notice is `"weather retrieved"` printed out after the `"weather: $weather"` statement but the function was called before it. 

To dive deeper into this lets learn more about Futures in Dart!