import "package:flutter/material.dart";
import "package:shopping_list/hive.dart";
import "package:shopping_list/shopping_item_widget.dart";

class ShoppingListWidget extends StatelessWidget {
  final List shoppingList;
  final Function() refreshFunction;

  const ShoppingListWidget({
    super.key,
    required this.shoppingList,
    required this.refreshFunction,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(
        shoppingList.length,
        (index) {
          final item = shoppingList[index];
          return ShoppingItemWidget(
            name: item['name'],
            quantity: item['quantity'],
            deleteFunction: () {
              HiveFunctions.deleteItem(item['key']);
              refreshFunction();
            },
          );
        },
      ).toList(),
    );
  }
}