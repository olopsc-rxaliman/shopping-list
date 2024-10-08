import "package:flutter/material.dart";

class NoItemsWidget extends StatelessWidget {
  const NoItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Tap on ",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Icon(
            Icons.add,
            color: Colors.white,
          ),
          Text(
            " to add an item to the list",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      )
    );
  }
}