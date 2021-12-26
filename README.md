Findo will provide debounce features for your searching operations. While user writing anything in findofield, it doesn't send directly. This field wait to break the users writing.(This component default time 300ms but if you want custom duration, you can declare at the constructor)

## Features

### Debounce - Cancalable

Moslty using text field for searching but if you use directly TextField with onChange, it'll make more resource using so you can just say how often do you wan to use it then findo returns to result for your time.

```dart
 FindoField(duration: Duration(seconds: 100), onChanged: .. ),
```

## Getting started

I've used only [async](https://pub.dev/packages/async) package for tihs library.

## Usage

```dart
void _fetchSearch(String value) {
    // It'll be called every 300 seconds
    _samples.where((element) => element.contains(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FindoField(
          duration: Duration(seconds: 100),
          onChanged: (value) {
            _fetchSearch(value);
          },
        ),
      ),
    );
  }
```

## Additional information

That's package pretty small but more important solutions. Do you want to add fixes, features or etc., you can always send P.R and i'll lovely to checking.
