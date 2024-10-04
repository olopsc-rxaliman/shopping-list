import "package:flutter/material.dart";
import "package:shopping_list/components/app_bar.dart";
import "package:shopping_list/hive.dart";
import "package:shopping_list/pages/add_item_page.dart";
import "package:shopping_list/shopping_item_widget.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List myHiveData = [];

  getHiveData() {
    setState(() {
      myHiveData = HiveFunctions.getAllItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    getHiveData();
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: applicationBar,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AddItemPage(
              refreshFunction: () {
                getHiveData();
              },
            ))
          );
        },
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
      body: myHiveData.isEmpty
      ? const Center(
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
              "To add an item to the list",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        )
      )
      : ListView(
        children: List.generate(
          myHiveData.length,
          (index) {
            final item = myHiveData[index];
            return ShoppingItemWidget(
              name: item['name'],
              quantity: item['quantity'],
              deleteFunction: () {
                HiveFunctions.deleteItem(item['key']);
                getHiveData();
              },
            );
          },
        ).toList(),
      ),
    );
  }
}