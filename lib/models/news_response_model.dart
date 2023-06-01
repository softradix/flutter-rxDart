import 'package:bloc_demo_project/common/extensions/string_extension.dart';

// This class handles the response of news api
class NewsResponseModel {
  NewsResponseModel({
      this.status, 
      this.totalResults, 
      this.articles,});

  NewsResponseModel.fromJson(dynamic json) {
    status = json['status'].toString().toStringConversion();
    totalResults = json['totalResults'].toString().toIntConversion();
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(Articles.fromJson(v));
      });
    }
  }
  String? status;
  int? totalResults;
  List<Articles>? articles;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['totalResults'] = totalResults;
    if (articles != null) {
      map['articles'] = articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Articles {
  Articles({
      this.source, 
      this.author, 
      this.title, 
      this.description, 
      this.url, 
      this.urlToImage, 
      this.publishedAt, 
      this.content,});

  Articles.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'].toString().toStringConversion();
    title = json['title'].toString().toStringConversion();
    description = json['description'].toString().toStringConversion();
    url = json['url'].toString().toStringConversion();
    urlToImage = json['urlToImage'].toString().toStringConversion();
    publishedAt = json['publishedAt'].toString().toStringConversion();
    content = json['content'].toString().toStringConversion();
  }
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }

}

class Source {
  Source({
      this.id, 
      this.name,});

  Source.fromJson(dynamic json) {
    id = json['id'].toString().toStringConversion();
    name = json['name'].toString().toStringConversion();
  }
  String? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}