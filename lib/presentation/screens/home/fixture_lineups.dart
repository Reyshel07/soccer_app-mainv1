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
   final double letterSize = screenSize.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue.withOpacity(0.5),
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
          Expanded(
            child: ListView.builder(
              itemCount: fixtureLineups.allLineups.length,
              itemBuilder: (BuildContext context, int index) {
                final infoLine = fixtureLineups.allLineups[index];
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(infoLine.team.name, style: TextStyle(fontSize: letterSize * 0.022, fontWeight: FontWeight.bold)),
                              SizedBox(width:  screenSize.width * 0.05,),
                              CircleAvatar(
                                child: FadeInImage(
                                  placeholder: AssetImage(AssetImageApp.getLoadingGif),
                                  image: NetworkImage(infoLine.team.logo),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenSize.height *0.02),
                          Text('COACH', style:  TextStyle(fontSize: letterSize * 0.020, fontWeight: FontWeight.bold)),
                          Text(infoLine.coach.name,style: TextStyle(fontSize: letterSize * 0.018),),
                          SizedBox(height: screenSize.height * 0.02),
                          Text('STARTRIN XI', style: TextStyle(fontSize: letterSize * 0.020, fontWeight: FontWeight.bold)),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.cyan.shade400,
                              borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child: Column(
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: infoLine.startXi.length,// Corrige el número de elementos en la lista
                                  itemBuilder: (BuildContext context, int index) {
                                    final infSub = infoLine.startXi[index];
                                    return Container(
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(infSub.player.number.toString(), style: TextStyle(fontSize: letterSize * 0.020, fontWeight: FontWeight.bold),),
                                              SizedBox(width: screenSize.width * 0.03),
                                              Text(infSub.player.name,style: TextStyle(fontSize: letterSize * 0.020),)
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
                          SizedBox(height: screenSize.height * 0.02),
                          Text('SUBSTITUTES', style: TextStyle(fontSize: letterSize * 0.022, fontWeight: FontWeight.bold)),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.deepPurple.shade400,
                              borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: infoLine.substitutes.length, // Corrige el número de elementos en la lista
                              itemBuilder: (BuildContext context, int index) {
                                final infS = infoLine.substitutes[index];
                                return Container(
                                  padding: const  EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(infS.player.number.toString(),style: TextStyle(fontSize: letterSize * 0.020, fontWeight: FontWeight.bold),),
                                          SizedBox(width: screenSize.width * 0.03),
                                          Text(infS.player.name,style: TextStyle(fontSize: letterSize * 0.020),)
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
