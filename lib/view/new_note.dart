import 'package:curdnotes/controller/note_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewNote extends StatelessWidget {
  const NewNote({super.key});

  @override
  Widget build(BuildContext context) {
    DbController dbController=Get.put(DbController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("New-Note"),
      ),
body: Padding(padding: EdgeInsets.all(8),
child: ListView(
  children: [
    TextFormField(
      controller: dbController.title,
      decoration: InputDecoration(
        hintText: "Title",
        border: InputBorder.none,
        hintStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
        )
      ),
    ),
    TextFormField(
      controller: dbController.des,
      decoration: InputDecoration(
        hintText: "description",
        border: InputBorder.none,
        hintStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
        )
      ),
    ),
    SizedBox(height: 20,),
    ElevatedButton(onPressed: (){
      dbController.addNote();
    },
     child: Text("Save"))
  ],
),
),
    );
  }
}