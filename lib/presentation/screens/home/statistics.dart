import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
    final double letterSize = screenSize.height;
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.lightBlue.withOpacity(0.5),
        leading: IconButton(
          color: Colors.white,
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: -screenSize.width * 0.5, 
            left: -screenSize.width * 0.2, 
            child: CircleAvatar(
              radius: screenSize.width * 0.35,
              backgroundColor: Colors.lightBlue.withOpacity(0.5),
            ),
          ),
          Positioned(
            top: -screenSize.width * 0.6, 
            right: -screenSize.width * 0.2, 
            child: CircleAvatar(
              radius: screenSize.width * 0.4,
              backgroundColor: Colors.lightBlue.withOpacity(0.5),
            ),
          ),
          Positioned(
            top: screenSize.height * 0.7,
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
            padding: EdgeInsets.all(20),
            child: ListView.builder(
              itemCount: statisticsProvider.allSta.length,
              itemBuilder: (BuildContext context, int index) {
                final stac = statisticsProvider.allSta[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(stac.team.name, style: TextStyle(fontSize: letterSize * 0.025, fontWeight: FontWeight.bold),),
                    SizedBox(
                      height: screenSize.height * 4,
                      child: ListView.builder(
                        itemCount: stac.statistics.length,
                        itemBuilder: (BuildContext context, int index) {
                          final stacData = stac.statistics[index]; 
                          //double valor = stacData.value;              
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(stacData.type, style: TextStyle(fontSize: letterSize * 0.022)),
                              SizedBox(height: screenSize.height * 0.02),
                              LinearProgressIndicator(
                                //value: stacData.value.noSuchMethod(),
                                color: Colors.blue.shade900,
                                backgroundColor: Colors.green.shade900,
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
