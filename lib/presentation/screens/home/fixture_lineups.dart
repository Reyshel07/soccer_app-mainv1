import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:soccer_app/presentation/providers/fixture/fixture_provider.dart';
import 'package:soccer_app/presentation/utils/assets_utlis.dart';

class FixtureLineups extends StatelessWidget {
  static const path = '/FixtureLineups';
  static const name = 'FixtureLineups';


  @override
  Widget build(BuildContext context) {
   final fixtureLineups = Provider.of<FixtureProvider>(context);
   final screenSize = MediaQuery.of(context).size;
   final double smallSpacing = screenSize.height * 0.02;
   final double letterSize = screenSize.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
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
          Expanded(
            child: ListView.builder(
              itemCount: fixtureLineups.allLineups.length,
              itemBuilder: (BuildContext context, int index) {
                final infoLine = fixtureLineups.allLineups[index];
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(infoLine.team.name),
                              CircleAvatar(
                                child: FadeInImage(
                                  placeholder: AssetImage(AssetImageApp.getLoadingGif),
                                  image: NetworkImage(infoLine.team.logo),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text('COACH', style:  TextStyle(fontSize: letterSize * 0.015),),
                          Text(infoLine.coach.name),
                          SizedBox(height: 10),
                          Text('STARTRIN XI', style: TextStyle(fontSize: letterSize * 0.015),),
                          Card(
                            child: Column(
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: infoLine.startXi.length,// Corrige el número de elementos en la lista
                                  itemBuilder: (BuildContext context, int index) {
                                    final infSub = infoLine.startXi[index];
                                    return Container(
                                      padding: EdgeInsets.symmetric(vertical: 5),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(infSub.player.number.toString()),
                                              Text(infSub.player.name)
                                            ],
                                          ),
                                          
                                        ],
                                      ),
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Text('SUBSTITUTES', style: TextStyle(fontSize: letterSize * 0.015),),
                          Card(
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: infoLine.substitutes.length, // Corrige el número de elementos en la lista
                              itemBuilder: (BuildContext context, int index) {
                                final infS = infoLine.substitutes[index];
                                return Container(
                                  padding: const  EdgeInsets.symmetric(vertical: 5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(infS.player.number.toString()),
                                          Text(infS.player.name)
                                        ],
                                      ),
                                      
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ), 
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
