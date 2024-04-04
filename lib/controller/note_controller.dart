import 'dart:convert';

//import 'dart:ffi';

import 'package:curdnotes/model/note_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DbController extends GetxController {
  String baseurl = "https://65e8133d53d564627a8fc5db.mockapi.io/noteapp";

  RxList<NotesModel> notesList = RxList<NotesModel>();
  TextEditingController title = TextEditingController();
  TextEditingController des = TextEditingController();
  TextEditingController titleDetails = TextEditingController();
  TextEditingController desDetails = TextEditingController();

  @override
  void onInit() {
    getNotes();
    super.onInit();
  }

  Future<void> getNotes() async {
    var response = await http.get(Uri.parse(baseurl));

    var notes = jsonDecode(response.body);
    notesList.clear();
    for (var note in notes) {
      notesList.add(NotesModel.fromJson(note));
    }

    if (response.statusCode == 200) {
      print("Get Note");
    }
  }

  Future<void> addNote() async {
    var newNote = NotesModel(
      title: title.text,
      descriptin: des.text,
      date: DateTime.now().toString(),
      time: "",
      id: "",
    );

    if (title.text != "" && des.text != "") {
      var response = await http.post(Uri.parse(baseurl),
          body: jsonEncode(newNote.toJson()),
          headers: {"content-type": "application/json"});
      if (response.statusCode == 201) {
        title.clear();
        des.clear();
        Get.back();
        getNotes();
        print("Note added");
      }
    } else {
      print(Get.snackbar("Error", "Pease Enter Something"));
    }
  }

  Future<void> deleteNotes(String id) async {
    var response = await http.delete(
        Uri.parse("https://65e8133d53d564627a8fc5db.mockapi.io/noteapp/$id"));
    if (response.statusCode == 200) {
      getNotes();
      Get.back();
      print(Get.snackbar("Deleting", "Sucssesfully"));
    }
  }

  Future<void> updateNote(String id) async {
    var updateModel = NotesModel(
      title: titleDetails.text,
      descriptin: desDetails.text,
      date: '',
      time: '',
      id: '',
    );
    var response = await http.put(
      Uri.parse("https://65e8133d53d564627a8fc5db.mockapi.io/noteapp/$id"),
      body: jsonEncode(updateModel.toJson()),
      headers: {"content-type": "application/json"},
    );
     if (response.statusCode == 200) {
        Get.back();
        getNotes();
        print("Notes Deleted");
      }
  }
}
