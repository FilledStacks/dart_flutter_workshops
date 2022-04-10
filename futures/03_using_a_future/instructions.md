# Using a Future

Using a Future requires a bit more work. In the first chapter I showed you what would happen if you used asynchronous `Future` code the same way as synchronous (`normal`) code. They go all out of order and return strange objects to you. So how do we fix that? By using `async`, `await` and `.then`. These are the keywords/functions used to "unwrap" or interact with your Future. You've already seen `async`. The next one we'll look at is the `await` keyword. 

## Awaiting on a Future

The await keywords tells dart to "pause" execution of the current code function and continue when the future code block has completed. If you update your main function to the following code.

```dart
Future<void> main() async {
  // Put your code below
  String location = 'Cape Town';
  final weather = await getWeather(location);
  print('weather: $weather');
}
```

When you run this code you'll see that we now get logs that look more normal

```txt
Fetching weather ...
weather retrieved
weather: 30
```

So there's a few things that had to update for us to use the Future effectively. 

1. The calling function has to be turned into a `Future` (If you want to use async/await)
2. We had to mark the function as `async`: To tell dart that this function will be executing asynchronously
3. We added `await` infront of the `getWeather` call to tell Dart to wait for the result of the Future `getWeather` before we continue.

But what if you don't want to turn your calling function into a Future? Well that's where the `.then` function comes in. 

## Handling result through then

It's a common occurence that you might not want to turn your calling function into a Future when using other `futures`. If we start at the main function that had the broken code

```dart
void main() {
  // Put your code below
  String location = 'Cape Town';
  final weather = getWeather(location);
  print('weather: $weather');
}
```

We can update this without using async await. Update the code in your main function to the following

```dart
void main() {
  // Put your code below
  String location = 'Cape Town';

  getWeather(location)
    .then((weather) => print('weather: $weather'));
}
```

When you run this you'll see that everything is still in order, or console output is in the same order as expected. In this code what we told dart is "Don't wait for this code to complete, but when it does complete call this function I'm giving you inside `then`" . This means the code will continue to execute any code following the call to `getWeather` immediately. To see this in action update the code one last time to the following.

```dart
void main() {
  // Put your code below
  String location = 'Cape Town';

  getWeather(location)
    .then((weather) => print('weather: $weather'));

  print('I am the last line!');
}
```

The logs that you'll see when you run this is 

```txt
Fetching weather ...
I am the last line!
weather retrieved
weather: 30
```

This shows that "I am the last line!" is printed out before the weather outputs. This is because dart continued to execute the function after calling getWeather and moved on to the last line in the code. The Future callback supplied in `.then` will be called when that future value is ready. 

Now that you know how to use Futures, what happens when an error happens during that long running process? Let's see how to handle errors.
