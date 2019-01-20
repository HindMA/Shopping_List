import 'package:by_love1/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:by_love1/redux/actions.dart';

class ShoppingItem extends StatefulWidget {
  final CartItem item;
  const ShoppingItem({Key key, this.item}) : super(key: key);
  @override
  _ShoppingItemState createState() => _ShoppingItemState();
}

class _ShoppingItemState extends State<ShoppingItem> {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<List<CartItem>, OnItemDelete>(
      converter: (store)=> (itemName) {
        store.dispatch(DeleteItemAction(widget.item));
      },
      builder: (context, callback )=> new Dismissible(
        onDismissed: (_){
          setState(() {
            callback(widget.item);
          });
        },
          key: new Key(widget.item.name),
          child: StoreConnector<List<CartItem>, OnToggleStateAction>(
            converter: (store) =>
                (item) => store.dispatch(ToggleStateItemAction(item)),
            builder: (context, callback) => new ListTile(
              title: new Text(widget.item.name),
              leading:
              new Checkbox(value: widget.item.checked, onChanged: (value){
                setState(() {
                  callback(CartItem(name: widget.item.name, checked: value));
                });
              }),
            ),
          )),
    );
  }
}

typedef OnToggleStateAction = Function(CartItem item);
typedef OnItemDelete = Function(CartItem item);
