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

  FlatSegmentedControl({
    Key key,
    @required this.children,
    @required this.tabChildren,
    this.indicatorColor,
    this.labelColor,
    this.isChildrenScrollable = false,
    this.unselectedLabelColor,
    this.tabPadding = EdgeInsets.zero,
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
    return Flex(
      direction: Axis.vertical,
      children: <Widget>[
        Padding(
          padding: widget.tabPadding,
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
        Expanded(
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