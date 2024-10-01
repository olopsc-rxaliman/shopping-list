import "package:flutter/material.dart";
import "package:shopping_list/hive.dart";

class AddItemPage extends StatefulWidget {
  const AddItemPage({super.key});

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Item",
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_nameController.text.isNotEmpty && _quantityController.text.isNotEmpty) {
            HiveFunctions.addItem({
              'name': _nameController.text,
              'quantity': _quantityController.text,
            });
            Navigator.of(context).pop();
          }
          else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Please fill all of the field'),
              )
            );
          }
        },
        label: const Text("Add Item"),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              keyboardType: TextInputType.text,
              maxLines: 1,
              decoration: const InputDecoration(
                labelText: "Item Name",
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _quantityController,
              keyboardType: TextInputType.number,
              maxLines: 1,
              decoration: const InputDecoration(
                labelText: "Quantity",
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}