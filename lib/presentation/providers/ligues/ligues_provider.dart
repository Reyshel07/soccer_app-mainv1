import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:soccer_app/models/league/league_model_response.dart';
import 'package:soccer_app/models/league/search_response.dart';

class LiguesProvider extends ChangeNotifier {
 final dio = Dio();

 String baseUrl = 'https://v3.football.api-sports.io';
 String apiToken = '865745fb3f72bee765b237bc391730ba';
 
 List<ResponseAllLeague> allLeagues = [];

 Future<void> getAllLigues()async{
  try {

    final headers = {
      'x-rapidapi-key': apiToken
    };
    final response = await dio.get(
      "$baseUrl/leagues",
      options: Options(
        headers: headers
      )
    );

    if (response.statusCode == 200) {
      final res = ResponseLeague.fromJson(response.data);

      allLeagues.addAll(res.response);
      notifyListeners();

    }

  } catch (e) {
    print(e); 
  }
 }

 List<SearchResponse> searchResults = [];

  Future<void> getLeaguesByName(String name)async{
  try {

    final headers = {
      'x-rapidapi-key': apiToken
    };
    final response = await dio.get(
      "$baseUrl/leagues?name=$name",
      options: Options(
        headers: headers
      )
    );

    if (response.statusCode == 200) {
      //resultados que haya encontrado sobre el nombre escrito
      final res= SearchResponseLeague.fromJson(response.data);
      searchResults = res.response;
      notifyListeners();
      print(searchResults[0]);

    }

  } catch (e) {
    print(e); 
  }
 }

 void clearSearchResults(){
  searchResults.clear();
  notifyListeners();
 }



}