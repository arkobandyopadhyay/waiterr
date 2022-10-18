import 'package:waiterr/Model/menu_item_model.dart';
import 'package:expandable_group/expandable_group_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:waiterr/theme.dart';

class MenuAllList extends StatefulWidget {
  List<List<MenuItemModel>>? productList;
  Function? header;
  Function? buildItems;
  MenuAllList({Key? key, this.productList, this.buildItems, this.header})
      : super(key: key);
  @override
  State<MenuAllList> createState() => _MenuAllListState();
}

class _MenuAllListState extends State<MenuAllList> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: widget.productList!.map((group) {
      int index = widget.productList!.indexOf(group);
      return ExpandableGroup(
        expandedIcon: const Icon(
          Icons.arrow_drop_down,
          size: 40,
          color: GlobalTheme.primaryColor,
        ),
        collapsedIcon: const Icon(
          Icons.arrow_right,
          size: 40,
          color: GlobalTheme.primaryColor,
        ),
        isExpanded: true,
        header: widget.header!(widget.productList![index][0].stockGroup),
        items: widget.buildItems!(context, group),
        headerEdgeInsets: EdgeInsets.only(left: 16.0, right: 16.0),
      );
    }).toList());
  }
}