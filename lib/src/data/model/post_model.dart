import 'dart:convert';
import 'package:equatable/equatable.dart';

typedef JsonMap = Map<String, dynamic>;

class PostModel extends Equatable {
  int? id;
  String? title;
  String? body;

  PostModel({
    this.id,
    this.title,
    this.body,
  });

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
