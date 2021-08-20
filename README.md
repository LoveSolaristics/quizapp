# Flutter TodoList

Create a simple todolist Flutter application

<div align="center">
  <img src="https://github.com/LoveSolaristics/todolist-flutter/blob/f021453a5321e93ba1fe24d3c935d2a27838aa98/doc/Functional.gif">
</div>

To run the project on your machine:

- make sure you have Dart and Flutter installed: https://flutter.dev/docs/get-started/install
- clone this repository with `git clone git@github.com:LoveSolaristics/todolist-flutter.git`

## Flutter concepts

### Widgets

Flutter is using Widgets to create the applications' UI.
Widgets let you declare how and what to render on the screen.

Widgets can be composed to create more complex UI, creating a widgets tree,
similar to the [Document Object Model](https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model/Introduction)
which is used to represent html pages.

For example a todo list app could be represented with the follownig wireframe:

![todolist-app](https://github.com/LoveSolaristics/todolist-flutter/blob/f021453a5321e93ba1fe24d3c935d2a27838aa98/doc/App.png)

From there we can start to have an idea of the widgets tree structure:

![todolist-app](https://github.com/LoveSolaristics/todolist-flutter/blob/f021453a5321e93ba1fe24d3c935d2a27838aa98/doc/App%20Tree.png)

See also:

- Introduction to widgets: <https://flutter.dev/docs/development/ui/widgets-intro>
- Widget catalog: <https://flutter.dev/docs/development/ui/widgets>
- widget index: <https://flutter.dev/docs/reference/widgets>
- widget of the week on Youtube: <https://www.youtube.com/watch?v=b_sQ9bMltGU&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG>

### Create a new Flutter application

#### A quick CLI tour

You can create a new Flutter project with the following command line:

```sh
flutter create --org io.anfimov --project-name todolist .
```

This will create the project `todolist` in the current folder `.`.
The `--org` flag uses the [reverse domain name notation](https://en.wikipedia.org/wiki/Reverse_domain_name_notation) to identify your application.

You can then run the application with `flutter run` and run the tests with `flutter test`.

For the list of command type `flutter help`.
For more details about a specific command, for example `create`, run `flutter create --help`.

#### Material Design

[Material Design](https://material.io/design/introduction) is a guideline to create user interface.
Flutter implements the guideline with the [material components widgets](https://flutter.dev/docs/development/ui/widgets/material).
This list of widgest allow us to create rapdly a UI folling the best practices from material design.
To use these widgets you need first to import the `material` Dart package with `import 'package:flutter/material.dart';`
You can then browse all the material widgets and select the ones required for your application <https://api.flutter.dev/flutter/material/material-library.html>

You have also the possiblity to create an IOs look by using the [Cupertino widgets package](https://flutter.dev/docs/development/ui/widgets/cupertino)

#### Main Widgets used

- [Scaffold](https://api.flutter.dev/flutter/material/Scaffold-class.html)
- [AppBar](https://api.flutter.dev/flutter/material/AppBar-class.html)
- [CheckboxListTile](https://api.flutter.dev/flutter/material/CheckboxListTile-class.html)
- [ListView](https://api.flutter.dev/flutter/widgets/ListView-class.html)
- [TextField](https://api.flutter.dev/flutter/material/TextField-class.html)
- [Column](https://api.flutter.dev/flutter/widgets/Column-class.html)
- [Expanded](https://api.flutter.dev/flutter/widgets/Expanded-class.html)

Note that the `Column` and `Exapanded` widgets are "space" widgets.
