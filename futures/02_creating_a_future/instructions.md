# Creating a Future

Futures are created like any other type in Dart. The most common use case is returning the type `Future` from a function that you want to run asynchronously.

If you look at the code on the right you can turn the function `calculateSum` into a future simply by "wrapping" the int in a Future. Update the `calculateSum` function and change the function signature to return `Future<int>` instead of `int`. 

```dart
Future<int> calculateSum(int a, int b) {
  final sum = a + b;
  print('sum calculated');
  return sum;
}
```

When you do this update you'll see that there's an error on the last line in the function. This is expected. Dart is a typed language so it's the same as if you defined a function that returns a `String` but you return a `int` instead. To fix this there's one of two things you can do.

## 1. Tell dart to wrap this function in a Future

To do this we can make use of the `async` keyword on the function signature. If you update your function to:

```dart
Future<int> calculateSum(int a, int b) async {
  final sum = a + b;
  print('sum calculated');
  return sum;
}
```

The error will go away. This is because dart now knows that whatever the result is of the code in your body, when it's returned it'll be returned inside a Future instance that you have to unwrap in the calling code. Turning the function above into a future is not useful, but this applies to any function you want to transform into a future.

## 2. Wrap your return value in a Future (manually)

The `Future` class provides you with a factory function that you can use to construct a Future that will return a single value when unwrapped. If you update the return statement of your function to the following.

```dart
Future<int> calculateSum(int a, int b) {
  final sum = a + b;
  print('sum calculated');
  return Future.value(sum);
}
```

You'll notice that we now don't need the async keyword, that's because we're now manually returning a `Future.value` type which satisfies the function signature. This way is commonly used when you want turn a function into a Future that doesn't make use of any Future's internally. To make more sense of all of this lets look at using a Future.
