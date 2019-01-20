import 'package:by_love1/cart_item.dart';
import 'package:by_love1/shopping_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux_dev_tools/flutter_redux_dev_tools.dart';
import 'package:redux/redux.dart';
import 'add_item_dialoog.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';


class ShoppingCart extends StatelessWidget {
  final DevToolsStore<List<CartItem>> store;
  const ShoppingCart({Key key, this.store}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Shopping List"),
      ),
      body: new ShoppingList(),
      floatingActionButton: new FloatingActionButton(
          onPressed:() => _openAddItemDialog(context), child: new Icon(Icons.add),
      ),
      endDrawer: new ReduxDevTools(store),
    );
  } // Widget build
} // class ShoppingCart

_openAddItemDialog(BuildContext context) {
  showDialog(context: context, builder: (context) => new AddItemDialog());
}
