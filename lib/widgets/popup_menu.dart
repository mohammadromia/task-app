import 'package:flutter/material.dart';

import '../models/task.dart';

class PopupMenu extends StatelessWidget {
  final Task task;
  final VoidCallback cancelOrDeleteCallback;

  final VoidCallback likeOrDislike;

  const PopupMenu({
    super.key,
    required this.cancelOrDeleteCallback,
    required this.likeOrDislike,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: task.isDeleted == false
            ? (context) => [
                  PopupMenuItem(
                      onTap: () {},
                      child: TextButton.icon(
                          onPressed: null,
                          icon: Icon(Icons.edit),
                          label: Text('Edit'))),
                  PopupMenuItem(
                      onTap: likeOrDislike,
                      child: TextButton.icon(
                          onPressed: null,
                          icon: task.isFavorite == false
                              ? Icon(Icons.bookmark_add_outlined)
                              : Icon(Icons.bookmark_remove),
                          label: task.isFavorite == false
                              ? Text('Add to Bookmarks')
                              : Text('Remove from Bookmarks'))),
                  PopupMenuItem(
                      onTap: cancelOrDeleteCallback,
                      child: TextButton.icon(
                          onPressed: null,
                          icon: Icon(Icons.delete),
                          label: Text('Delete')))
                ]
            : (context) => [
                  PopupMenuItem(
                      onTap: () {},
                      child: TextButton.icon(
                          onPressed: null,
                          icon: Icon(Icons.restore_from_trash),
                          label: Text('Restore'))),
                  PopupMenuItem(
                      onTap: cancelOrDeleteCallback,
                      child: TextButton.icon(
                          onPressed: null,
                          icon: Icon(Icons.delete_forever),
                          label: Text('Delete Forever')))
                ]);
  }
}
