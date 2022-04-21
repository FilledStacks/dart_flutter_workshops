# Creating a Future

Futures are created like any other type in Dart. The most common use case is returning the type `Future` from a function that you want to run asynchronously.

If you look at the code on the right, you can turn the function `calculateSum` into a future simply by returning the `Future<T>` and setting your generic argument (The "T"), to the type you want to return. 

## Your Turn

Update the `calculateSum` function to return a Future of type int. _Only updating the function signature, there will be some errors in the code and that's fine. You'll fix it below._

---

After this update you'll see that there's an error on the last line in the function. This is expected. Dart is a typed language so it's the same as if you defined a function that returns a `String` but you return a `int` instead. To fix this there's one of two things you can do.

## 1. Tell dart to wrap this function in a Future

To do this you can make use of the `async` keyword on the function signature just before the body starts. 

```dart
Future<void> myFuture() async {
}
```

<!-- Hm, feels like the "your turn" headings should be h3 instead of h2 since they belong to Sections 1 and 2 respectively. However, the text formatting for h3 on Dartpad is kinda bad. -->
### Your Turn

Mark the `calculateSum` function as async

---

The error will go away. This is because Dart now knows that whatever the result is of the code in your body, when it's returned it'll be returned inside a Future instance that you have to unwrap in the calling code. Turning the function above into a future is not useful, but this applies to any function you want to transform into a Future.

## 2. Wrap your return value in a Future (manually)

The `Future` class provides you with a factory function that you can use to construct a Future that will return a single value when unwrapped. This is done as follows.

```dart
final futureBoolean = Future.value(true);
```

### Your Turn

Update the `combineName` function to a `future` without using the `async` keyword.

---

You are now manually wraping your return valuue in a `Future` which satisfies the function signature. This way is commonly used when you want turn a function into a Future that doesn't make use of any async await functionality internally. 

To make more sense of all of this lets look at using a Future.
