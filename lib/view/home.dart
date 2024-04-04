import 'package:curdnotes/controller/note_controller.dart';
import 'package:curdnotes/view/new_note.dart';
import 'package:curdnotes/view/note_widgwt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class NotePage extends StatelessWidget {
  NotePage({super.key});
  DbController dbcontra = Get.put(DbController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade300,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text("Note Api"),
        
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Get.to(() => NewNote());
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: Obx(
            () => GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: dbcontra.notesList
                  .map(
                    (e) => NoteWidget(note: e),
                  )
                  .toList(),
            ),
          )),
    );
  }
}
