import 'package:flutter/material.dart';
import '../models/sample_item.dart';
import '../view_models/item_list_view_model.dart';

class ItemDetailScreen extends StatelessWidget {
  final SampleItem item;
  final ItemListViewModel itemListViewModel;

  ItemDetailScreen(this.item, this.itemListViewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Details'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              _editItemName(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              _confirmDeleteItem(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${item.name}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Description: ${item.description}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  void _editItemName(BuildContext context) {
    final TextEditingController _nameController =
        TextEditingController(text: item.name);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Item Name'),
          content: TextField(
            controller: _nameController,
            decoration: InputDecoration(labelText: 'New Name'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                itemListViewModel.updateItemName(item.id, _nameController.text);
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _confirmDeleteItem(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirm Deletion'),
          content: Text('Are you sure you want to delete this item?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                itemListViewModel.deleteItem(item.id);
                Navigator.of(context).pop();
                Navigator.of(context)
                    .pop(); // Pop twice to go back to the item list screen
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
