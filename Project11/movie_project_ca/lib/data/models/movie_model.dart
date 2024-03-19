import 'package:flutter/foundation.dart';
import 'package:movie_project_ca/domain/entities/movie.dart';

class MovieModel{
  final int id;
  final String title;
  final String overview;
  final String posterPath;

  MovieModel({required this.id, required this.title, required this.overview, required this.posterPath});

  factory MovieModel.fromJson(Map<String,dynamic> json){
    return MovieModel(
      id: json['id'], 
      title: json['title'], 
      overview: json['overview'],
      posterPath: json['posterPath']
      );
  }

  Map<String,dynamic> toJson(){
    return {
      'id' :id,
      'title' :title,
      'overview':overview,
      'posterPath':posterPath
    };
  }

  Movie toEntity(){
    return Movie(id: id, title: title, overview: overview, posterPath: posterPath);
  }

}