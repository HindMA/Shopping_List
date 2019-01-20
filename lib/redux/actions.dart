import 'package:by_love1/cart_item.dart';


class AddItemAction{
  final CartItem item ;

  AddItemAction(this.item);
} // AddItemAction

class ToggleStateItemAction{
  final CartItem item ;

  ToggleStateItemAction(this.item);
} // ToggleStateItemAction

class DeleteItemAction{
  final CartItem item ;

  DeleteItemAction(this.item);
} // DeleteItemAction



