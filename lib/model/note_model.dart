import 'dart:convert';

class NotesModel {
    String title;
    String descriptin;
    String date;
    String time;
    String id;

    NotesModel({
        required this.title,
        required this.descriptin,
        required this.date,
        required this.time,
        required this.id,
    });

    factory NotesModel.fromRawJson(String str) => NotesModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory NotesModel.fromJson(Map<String, dynamic> json) => NotesModel(
        title: json["title"],
        descriptin: json["descriptin"],
        date: json["date"],
        time: json["time"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "descriptin": descriptin,
        "date": date,
        "time": time,
        "id": id,
    };
}
