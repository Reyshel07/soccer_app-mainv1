import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:soccer_app/models/fixlineups/fixture.dart';
import 'package:soccer_app/models/fixlineups/lineups_model.dart';
import 'package:soccer_app/models/fixlineups/statistics.dart';

class FixtureProvider extends ChangeNotifier{
    final dio = Dio();

    String baseUrl = 'https://v3.football.api-sports.io';
    String apiToken = '865745fb3f72bee765b237bc391730ba';

    List<ResponseFixt> allFixture=[];
    List<ResponseLine> allLineups=[];
    List<ResponseSta> allSta = [];
    


    Future<void> getAllFixture()async{
        try{
            final headers = {
            'x-rapidapi-key': apiToken
            };       
            final response = await dio.get(
                "$baseUrl/fixtures?date=2024-07-14&season=2024",
                options: Options(
                    headers: headers
                ),
            );

            if(response.statusCode == 200){
                final res = ResponseFixture.fromJson(response.data);
                allFixture.addAll(res.response);
                notifyListeners();
            }
        }catch(e){
            print(e);
        }
    }
    Future<void> getAllLineups()async{
      try {
        final headers ={
          'x-rapidapi-key': apiToken
        };
        final response = await dio.get(
          "$baseUrl/fixtures/lineups?fixture=592872",
          options: Options(
            headers: headers
          )
        );
        if(response.statusCode == 200){
          final res = ResponseLineups.fromJson(response.data);
          allLineups.addAll(res.response);
          notifyListeners();
        }
      } catch (e) {
        print(e);
      }
    }
    Future<void> getallStatistics()async{
    try {
      final headers = {
        'x-rapidapi-key': apiToken
      };
      final response = await dio.get(
        "$baseUrl/fixtures/statistics?fixture=215662",
        options: Options(
          headers: headers
        ),
      );
      if (response.statusCode == 200) {
        final res = ResponseStatistics.fromJson(response.data);
        allSta.addAll(res.response);
        notifyListeners();
      }
    } catch (e) {
      
    }
  }
}