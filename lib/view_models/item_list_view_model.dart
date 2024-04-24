import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/sample_item.dart';

final itemListProvider =
    ChangeNotifierProvider<ItemListViewModel>((ref) => ItemListViewModel());

class ItemListViewModel extends ChangeNotifier {
  List<SampleItem> _items = [];
  List<SampleItem> get items => _items;

  void addItem(String name, String description) {
    final newItem = SampleItem(
      id: DateTime.now().toString(),
      name: name,
      description: description,
    );
    _items.add(newItem);
    notifyListeners(); // Notify the UI of changes
  }

void updateItemName(String itemId, String newName) {
    final itemIndex = _items.indexWhere((item) => item.id == itemId);
    if (itemIndex != -1) {
      _items[itemIndex].name = newName;
      notifyListeners(); // Notify the UI of changes
    }
  }

  void deleteItem(String itemId) {
    _items.removeWhere((item) => item.id == itemId);
    notifyListeners(); // Notify the UI of changes
  }

}
