import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soccer_app/presentation/providers/fixture/fixture_provider.dart';

class StatisticsScreen extends StatelessWidget {
  static const path = '/StatisticsScreen';
  static const name = 'StatisticsScreen';
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final statisticsProvider = Provider.of<FixtureProvider>(context);
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -screenSize.width * 0.175, 
            left: -screenSize.width * 0.175, 
            child: CircleAvatar(
              radius: screenSize.width * 0.35,
              backgroundColor: Colors.lightBlue.withOpacity(0.5),
            ),
          ),
          Positioned(
            top: -screenSize.width * 0.2, 
            right: -screenSize.width * 0.2, 
            child: CircleAvatar(
              radius: screenSize.width * 0.4,
              backgroundColor: Colors.lightBlue.withOpacity(0.5),
            ),
          ),
          Positioned(
            top: screenSize.height * 0.9,
            right:   screenSize.width * 0.4,
            child: CircleAvatar(
              radius: screenSize.width * 0.50,
              backgroundColor: Colors.lightBlue.withOpacity(0.5),
            ),
          ),
          Positioned(
            top: screenSize.height * 0.75,
            left:  screenSize.width * 0.5,
            child: CircleAvatar(
              radius: screenSize.width * 0.50,
              backgroundColor: Colors.lightBlue.withOpacity(0.5),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: ListView.builder(
              itemCount: statisticsProvider.allSta.length,
              itemBuilder: (BuildContext context, int index) {
                final stac = statisticsProvider.allSta[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(stac.team.name),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        itemCount: stac.statistics.length,
                        itemBuilder: (BuildContext context, int index) {
                          final stacData = stac.statistics[index]; 
                          //double valor = stacData.value;              
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(stacData.type),
                              LinearProgressIndicator(
                                value: stacData.value.noSuchMethod(),
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}