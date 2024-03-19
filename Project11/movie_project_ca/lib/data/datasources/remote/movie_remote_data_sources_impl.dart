import 'dart:convert';

import 'package:movie_project_ca/core/errors/server_exception.dart';
import 'package:movie_project_ca/data/datasources/movie_remote_data_sources.dart';
import 'package:movie_project_ca/data/models/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieRemoteDataSourcesImpl extends MovieRemoteDataSources{

  final http.Client client;

  MovieRemoteDataSourcesImpl({required this.client});

  static const BASEURL = "https://api.the moviesdb.org/3";
  static const API_KEY = "b0e7151a1a5725a9af579d540f695075";

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await client.get(
      Uri.parse("$BASEURL/movie/popular?api_key=$API_KEY"),
    );

    if(response.statusCode ==200){
      final responseBody = json.decode(response.body);
      final List<MovieModel> movies = (responseBody['results'] as List).map((movie) => MovieModel.
      fromJson(movie)).toList(); 
      return movies;  
    }else{
      throw ServerException(message: "error fetching popular movies from api");
    }
  }

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    final response = await client.get(
      Uri.parse("$BASEURL/search/movie?query=$query&api_key=$API_KEY"),
    );

    if(response.statusCode ==200){
      final responseBody = json.decode(response.body);
      final List<MovieModel> movies = (responseBody['results'] as List).map((movie) => MovieModel.
      fromJson(movie)).toList(); 
      return movies;  
    }else{
      throw ServerException(message: "error fetching trending from api");
    }
  }

  @override
  Future<List<MovieModel>> getTrendingMovies() async {
    final response = await client.get(
      Uri.parse("$BASEURL/trending/movie/day?api_key=$API_KEY"),
    );

    if(response.statusCode ==200){
      final responseBody = json.decode(response.body);
      final List<MovieModel> movies = (responseBody['results'] as List).map((movie) => MovieModel.
      fromJson(movie)).toList(); 
      return movies;  
    }else{
      throw ServerException(message: "error fetching trending from api");
    }
  }
  
}