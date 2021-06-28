import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  var textController = new TextEditingController();
  var todoText = "";
  List<dynamic> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lime[50],
      appBar: AppBar(
        title: Text("Todo List"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 10.0, right: 8.0, bottom: 10.0, left: 8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 290),
                    child: TextField(
                      controller: textController,
                      onChanged: (value) {
                        todoText = value;
                      },
                      decoration: InputDecoration(
                        hintText: 'Add Items',
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.cyan,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        todos.add(todoText);
                        textController.text = "";
                        todoText = "";
                      });
                    },
                    child: Icon(
                      Icons.add_box_outlined,
                      color: Colors.teal[700],
                      size: 40.0,
                    ),
                  ),
                ],
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.orange[300],
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(color: Colors.blueGrey, blurRadius: 10.0),
                        ],
                      ),
                      height: 50,
                      margin: EdgeInsets.only(top: 15),
                      child: ListTile(
                        title: Text(
                          "${todos[index]}",
                          style: TextStyle(
                              color: Colors.teal[900],
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        trailing: Container(
                          width: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text("Edit Todo"),
                                          content: TextField(
                                            onChanged: (value) {
                                              todoText = value;
                                            },
                                          ),
                                          actions: [
                                            OutlinedButton(
                                                onPressed: () {
                                                  setState(() {
                                                    todos.replaceRange(index,
                                                        index + 1, {todoText});
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text("Add"))
                                          ],
                                        );
                                      });
                                },
                                child: Icon(
                                  Icons.create_rounded,
                                  color: Colors.teal[700],
                                  size: 20.0,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    todos.removeAt(index);
                                  });
                                },
                                child: Icon(
                                  Icons.delete_rounded,
                                  color: Colors.teal[700],
                                  size: 20.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
