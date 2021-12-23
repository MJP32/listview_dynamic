import 'package:flutter/material.dart';

import 'Intervals.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  final List<String> names = <String>[];
  final List<String> times = <String>[];
  final List<String> songs = <String>[];

  TextEditingController nameController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController songController = TextEditingController();

  void addItemToList(Intervals interval){
    setState(() {
      names.add(interval.name);
      times.add(interval.time);
      songs.add(interval.song);
    });
  }
  List<Intervals> myIntervals = [];
  final List myProducts = List.generate(5, (index) {
    return {"id": index, "title": "Product \#$index", "price": index + 1};
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Tutorial - googleflutter.com'),
        ),
        body: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                  ),
                ),

              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: timeController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Time',
                  ),
                ),

              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: songController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Song',
                  ),
                ),

              ),
              RaisedButton(
                child: Text('Add'),
                onPressed: () {
                  var interval = Intervals(nameController.text, timeController.text,songController.text);
                  myIntervals.add(new Intervals(nameController.text, timeController.text,songController.text));
                  addItemToList(interval
                  );
                },
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: myIntervals.length,
                  itemBuilder: (BuildContext ctx, index) {
                    // Display the list item
                    return Dismissible(
                      key: UniqueKey(),

                      // only allows the user swipe from right to left
                      direction: DismissDirection.endToStart,

                      // Remove this product from the list
                      // In production enviroment, you may want to send some request to delete it on server side
                      onDismissed: (_){
                        setState(() {
                          myProducts.removeAt(index);
                          myIntervals.removeAt(index);
                        });
                      },

                      // Display item's title, price...
                      child: Card(
                        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text(myIntervals[index].time),
                          ),
                          title: Text(myIntervals[index].name),
                          subtitle:

                          Text("\$${myIntervals[index].song}"),
                          trailing: Icon(Icons.arrow_back),


                        ),
                      ),

                      // This will show up when the user performs dismissal action
                      // It is a red background and a trash icon
                      background: Container(
                        color: Colors.red,
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              )
            ]
        )
    );
  }
}

