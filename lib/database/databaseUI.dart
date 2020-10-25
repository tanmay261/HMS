import 'package:flutter/material.dart';
import 'package:flutter_auth/database/databasehelper.dart';

class DatabaseUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('test database using sqflite')),
      ),
      body: Column(
        children: [
          FlatButton(
              onPressed: () async {
                int i = await DatabaseHelper.instance
                    .insert({DatabaseHelper.columnName: 'First Entry'});
                print('the inserted id is $i');
              },
              child: Text('Insert')),
          FlatButton(
              onPressed: () async{
               await DatabaseHelper.instance.delete(1);
              },
              child: Text('Delete')),
          FlatButton(
              onPressed: () async {
                List<Map<String, dynamic>> queryRows =
                    await DatabaseHelper.instance.queryAll();
                print(queryRows);
              },
              child: Text('Query')),
          FlatButton(
              onPressed: () async {
                int updatedId = await DatabaseHelper.instance.update({
                  DatabaseHelper.columnId: null,
                  DatabaseHelper.columnName: 'Updated Entry'
                });
                print(updatedId);
              },
              child: Text('Update'))
        ],
      ),
    );
  }
}
