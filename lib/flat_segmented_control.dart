library flat_segmented_control;

import 'package:flutter/material.dart';

class FlatSegmentedControl extends StatefulWidget {
  final List<Widget> children;
  final List<Widget> navChildren;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry navPadding;

  FlatSegmentedControl({
    Key key,
    @required this.children,
    @required this.navChildren,
    this.padding = const EdgeInsets.all(0.0),
    this.navPadding = const EdgeInsets.all(0.0),
  }) : super(key: key);

  _FlatSegmentedControlState createState() =>
      _FlatSegmentedControlState();
}

class _FlatSegmentedControlState extends State<FlatSegmentedControl> {
  int _selected = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: widget.navPadding,
          child: Row(
            children: _getListNavs(),
          ),
        ),
        Flexible(
          fit: FlexFit.loose,
          child: Container(
            padding: widget.padding,
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: widget.children,
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _getListNavs() {
    return List<Widget>.generate(
      widget.navChildren.length,
      (index) => NavButton(
        selected: _selected,
        index: index,
        navChildren: widget.navChildren,
        onPressed: () {
          setState(() {
            _selected = index;
            _pageController.animateToPage(
              index,
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: 400),
            );
          });
        },
      ),
    );
  }
}

class NavButton extends StatelessWidget {
  final int selected;
  final int index;
  final VoidCallback onPressed;
  final List<Widget> navChildren;

  NavButton({
    @required this.selected,
    @required this.index,
    @required this.onPressed,
    @required this.navChildren,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 2.5,
            color: selected == index
                ? Theme.of(context).primaryColor
                : Theme.of(context).canvasColor,
          ),
        ),
      ),
      child: FlatButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onPressed: onPressed,
        child: navChildren[index],
      ),
    );
  }
}