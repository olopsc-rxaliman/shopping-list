import "package:flutter/material.dart";
import "package:shopping_list/components/app_bar.dart";
import "package:shopping_list/components/no_items_widget.dart";
import "package:shopping_list/components/shopping_list_widget.dart";
import "package:shopping_list/services/hive.dart";
import "package:shopping_list/pages/add_item_page.dart";

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
      ? const NoItemsWidget()
      : ShoppingListWidget(
        shoppingList: myHiveData,
        refreshFunction: () {
          getHiveData();
        },
      ),
    );
  }
}