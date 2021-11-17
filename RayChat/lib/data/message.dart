import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String text;
  final DateTime date;
  final String email;

  DocumentReference reference;

  Message({this.text, this.date, this.email, this.reference});

  factory Message.fromJson(Map<dynamic, dynamic> json) => Message(
        text: json['text'] as String,
        date: DateTime.parse(json['date'] as String),
        email: json['email'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'date': date.toString(),
        'text': text,
        'email': email,
      };

  factory Message.fromSnapshot(DocumentSnapshot snapshot) {
    final message = Message.fromJson(snapshot.data());
    message.reference = snapshot.reference;
    return message;
  }
}
