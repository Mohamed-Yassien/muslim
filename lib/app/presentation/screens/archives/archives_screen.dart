import 'package:flutter/material.dart';
List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];

class ArchivesScreen extends StatefulWidget {
  const ArchivesScreen({super.key});

  @override
  _ReorderableListDemoState createState() => _ReorderableListDemoState();
}

class _ReorderableListDemoState extends State<ArchivesScreen> {
  @override
  Widget build(BuildContext context) {
    return  ReorderableListView(
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (newIndex > oldIndex) {
            newIndex -= 1;
          }
          final item = items.removeAt(oldIndex);
          items.insert(newIndex, item);
        });
      },
      children: List.generate(
        items.length,
            (index) {
          final item = items[index];
          return ListTile(
            key: Key('$item'),
            title: Text(item),
          );
        },
      ),
    );
  }
}
