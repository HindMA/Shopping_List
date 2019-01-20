import 'package:by_love1/cart_item.dart';
import 'package:by_love1/shopping_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ShoppingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<List<CartItem>,List<CartItem>>(
      converter: (store)=> store.state,
    builder: (context,list)=> new ListView.builder(
        itemBuilder: (context,i) => new ShoppingItem(item : list[i]),
    itemCount: list.length ,
    ),
    );
  }
}
