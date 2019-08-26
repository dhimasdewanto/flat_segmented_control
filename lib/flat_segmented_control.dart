library flat_segmented_control;

import 'package:flutter/material.dart';

class FlatSegmentedControl extends StatefulWidget {
  final List<Widget> children;

  final List<Widget> tabChildren;

  /// The color of the line that appears below the selected tab.
  ///
  /// Defaults to Theme's indicatorColor [Theme.of(context).indicatorColor].
  final Color indicatorColor;

  /// The color of selected tab labels.
  ///
  /// Defaults to text body2 color [Theme.of(context).textTheme.body2.color].
  final Color labelColor;

  /// The color of unselected tab labels.
  ///
  /// Defaults to text body2 color [Theme.of(context).textTheme.body2.color].
  final Color unselectedLabelColor;

  /// Whether the children can be swiped horizontally.
  /// 
  /// Defaults to [false].
  final bool isChildrenSwipeable;

  /// Padding of tab menu, not tab children.
  /// 
  /// Defaults to [EdgeInsets.zero]
  final EdgeInsetsGeometry tabPadding;

  /// The view padding.
  /// 
  /// Defaults to [EdgeInsets.zero]
  final EdgeInsetsGeometry childrenPadding;

  /// Define the children width. Please change as desired.
  /// 
  /// Defaults to device width.
  final double childrenWidth;

  /// Define the children height. Please change as desired.
  /// 
  /// Defaults to device height.
  final double childrenHeight;

  FlatSegmentedControl({
    Key key,
    @required this.children,
    @required this.tabChildren,
    this.indicatorColor,
    this.labelColor,
    this.isChildrenSwipeable = false,
    this.unselectedLabelColor,
    this.tabPadding,
    this.childrenPadding,
    this.childrenWidth,
    this.childrenHeight,
  })  : assert(children != null),
        assert(tabChildren != null),
        assert(tabChildren.length == children.length),
        super(key: key);

  @override
  _FlatSegmentedControlState createState() => _FlatSegmentedControlState();
}

class _FlatSegmentedControlState extends State<FlatSegmentedControl>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: widget.children.length,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: widget.tabPadding ?? EdgeInsets.zero,
          child: TabBar(
            controller: _tabController,
            tabs: widget.tabChildren,
            indicatorColor: widget.indicatorColor,
            labelColor:
                widget.labelColor ?? Theme.of(context).textTheme.body2.color,
            unselectedLabelColor: widget.unselectedLabelColor ??
                Theme.of(context).textTheme.body2.color,
          ),
        ),
        Container(
          height: widget.childrenHeight ?? MediaQuery.of(context).size.height,
          width: widget.childrenWidth ?? MediaQuery.of(context).size.width,
          padding: widget.childrenPadding ?? EdgeInsets.zero,
          child: TabBarView(
            controller: _tabController,
            physics: widget.isChildrenSwipeable
                ? ScrollPhysics()
                : NeverScrollableScrollPhysics(),
            children: widget.children,
          ),
        ),
      ],
    );
  }
}
