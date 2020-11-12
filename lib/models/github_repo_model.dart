import 'dart:convert';

import 'package:equatable/equatable.dart';

class GithubRepoModel extends Equatable {
  final int id;
  final String name;
  final String description;
  final String htmlUrl;
  GithubRepoModel({
    this.id,
    this.name,
    this.description,
    this.htmlUrl,
  });

  @override
  List<Object> get props => [id, name, description, htmlUrl];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'html_url': htmlUrl,
    };
  }

  factory GithubRepoModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return GithubRepoModel(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      htmlUrl: map['html_url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GithubRepoModel.fromJson(String source) =>
      GithubRepoModel.fromMap(json.decode(source));
}
