// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names, must_call_super, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:todo_list/api.dart';
import 'package:todo_list/data_list.dart';

class ListScreen extends StatefulWidget {
  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  ApiHelper api = ApiHelper();
  List<DataList> mylist = [];

  FetchData() async {
    var temp = await api.getallData();
    setState(() {
      mylist = temp;
    });
  }

  @override
  void initState() {
    FetchData();
  }

  void DeleteById(int id) async {
    await api.deleteList(id);
    FetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Count of Data Lists is ${mylist.length}"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/add");
              },
              icon: Icon(Icons.add_box_rounded))
        ],
      ),
      body: (mylist.isEmpty)
          ? Text("Data is Loading...")
          : ListView.builder(
              itemCount: mylist.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(mylist[index].title),
                  subtitle: Text(mylist[index].date),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed("/edit");
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Colors.teal,
                            )),
                        IconButton(
                            onPressed: () {
                              DeleteById(mylist[index].id);
                            },
                            icon: Icon(
                              Icons.delete_forever,
                              color: Colors.red,
                            ))
                      ],
                    ),
                  ),
                );
              }),
    );
  }
}
