# flat_segmented_control

Segemented Control with TabView for Flutter. Inspired by SegmentedControl (iOS) and Material Design.

![Gif Example](https://raw.githubusercontent.com/dhimasdewanto/flat_segmented_control/master/readme_assets/example.gif)

## How to use

1. Add flat_segmented_control to your package's pubspec.yaml, then intall it.

2. Import package.

```
import 'package:flat_segmented_control/flat_segmented_control.dart';
```

3. Add this to your child Widget.
```
FlatSegmentedControl(
    tabChildren: <Widget>[
        Container(
        height: 50.0,
        child: Center(child: Text("Tab 1")),
        ),
        Container(
        height: 50.0,
        child: Center(child: Text("Tab 2")),
        ),
        Container(
        height: 50.0,
        child: Center(child: Text("Tab 3")),
        ),
    ],
    childrenHeight: 150.0,
    children: <Widget>[
        Center(child: Text("View 1")),
        Center(child: Text("View 2")),
        Center(child: Text("View 3")),
    ],
),
```

## Check

1. Make sure length of children same as navChildren.
2. Change childrenHeight or childrenWidth if you desire.