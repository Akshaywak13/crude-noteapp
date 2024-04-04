import 'package:curdnotes/model/note_model.dart';
import 'package:curdnotes/view/note_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class NoteWidget extends StatelessWidget {
  final NotesModel note;
  const NoteWidget({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(NoteDetailsPage(note: note,));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.deepPurple.shade300,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Id : ${note.id}",
                  maxLines: 1,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
               
                Text(
                 "Title :${ note.title }",
                  maxLines: 1,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                
                Flexible(child: Text("Description :${note.descriptin}")),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
