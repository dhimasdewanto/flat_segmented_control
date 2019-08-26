library flat_segmented_control;

import 'package:flutter/material.dart';

class FlatSegmentedControl extends StatefulWidget {
  final List<Widget> children;
  final List<Widget> tabChildren;
  final Color indicatorColor;
  final Color labelColor;
  final Color unselectedLabelColor;
  final bool isChildrenScrollable;
  final EdgeInsetsGeometry tabPadding;
  final EdgeInsetsGeometry childrenPadding;
  final double childrenWidth;
  final double childrenHeight;

  FlatSegmentedControl({
    Key key,
    @required this.children,
    @required this.tabChildren,
    this.indicatorColor,
    this.labelColor,
    this.isChildrenScrollable = false,
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
            indicatorColor:
                widget.indicatorColor ?? Theme.of(context).primaryColor,
            labelColor:
                widget.labelColor ?? Theme.of(context).textTheme.body1.color,
            unselectedLabelColor: widget.unselectedLabelColor ??
                Theme.of(context).textTheme.body1.color,
          ),
        ),
        Container(
          height: widget.childrenHeight ?? MediaQuery.of(context).size.height,
          width: widget.childrenWidth ?? MediaQuery.of(context).size.width,
          padding: widget.childrenPadding ?? EdgeInsets.zero,
          child: TabBarView(
            controller: _tabController,
            physics: widget.isChildrenScrollable
                ? ScrollPhysics()
                : NeverScrollableScrollPhysics(),
            children: widget.children,
          ),
        ),
      ],
    );
  }
}
