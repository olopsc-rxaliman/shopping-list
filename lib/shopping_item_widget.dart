import "package:flutter/material.dart";

class ShoppingItemWidget extends StatelessWidget {
  final String name;
  final String quantity;

  const ShoppingItemWidget({
    super.key,
    required this.name,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        title: Row(
          children: [
            Text(quantity),
            const SizedBox(width: 15),
            Text(name),
          ],
        ),
        trailing: IconButton(
          onPressed: () {

          },
          icon: const Icon(Icons.delete),
        ),
        contentPadding: const EdgeInsets.only(
          left: 15,
          right: 1,
        ),
      ),
    );
  }
}