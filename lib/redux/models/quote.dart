import 'package:flutter/material.dart';

class Quote {
  int id;
  String body;
  String author;
  bool isSaved;
  
  Quote({
    @required this.id,
    @required this.body,
    @required this.author,
    this.isSaved
  });

  Quote.fromJson({Map<String, dynamic> json, String base}){
    id = json['id'];
    body = json['body'];
    author = json['author'];
    isSaved = false;
  }

  Map<String, dynamic> toJson(){
  return {
    "id": this.id,
    "body": this.body,
    "author": this.author,
  };
}

  
}

