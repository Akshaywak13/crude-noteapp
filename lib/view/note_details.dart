import 'package:curdnotes/controller/note_controller.dart';
import 'package:curdnotes/model/note_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoteDetailsPage extends StatelessWidget {
  final NotesModel note;
  const NoteDetailsPage({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    DbController dbController=Get.put(DbController());
    dbController.titleDetails.text =note.title.toString();
    dbController.desDetails.text=note.descriptin.toString();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("New-Note"),
        actions: [
          IconButton(
              onPressed: () {
                dbController.deleteNotes(note.id);
                
              },
              icon: Icon(
                Icons.delete,
                color: Colors.white,
              ))
        ],
      ),
body: Padding(padding: EdgeInsets.all(8),
child: ListView(
  children: [
    TextFormField(
     controller: dbController.titleDetails,
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
      controller: dbController.desDetails,
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
      dbController.updateNote(note.id!);
    },
     child: Text("Save"))
  ],
),
),
    );
  }
}