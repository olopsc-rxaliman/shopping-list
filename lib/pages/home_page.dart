import "package:flutter/material.dart";
import "package:shopping_list/pages/add_item_page.dart";
import "package:shopping_list/shopping_item_widget.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text(
          "SHOPPING LIST",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AddItemPage())
          );
        },
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
      body:
      // const Center(
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text(
      //         "Tap on ",
      //         style: TextStyle(
      //           color: Colors.white,
      //         ),
      //       ),
      //       Icon(
      //         Icons.add,
      //         color: Colors.white,
      //       ),
      //       Text(
      //         "To add an item to the list",
      //         style: TextStyle(
      //           color: Colors.white,
      //         ),
      //       ),
      //     ],
      //   )
      // ),

      ListView(
        children: const [
          ShoppingItemWidget(
            name: "Item",
            quantity: "5",
          ),
          ShoppingItemWidget(
            name: "Item",
            quantity: "5",
          ),
          ShoppingItemWidget(
            name: "Item",
            quantity: "5",
          ),
        ],
      ),
    );
  }
}