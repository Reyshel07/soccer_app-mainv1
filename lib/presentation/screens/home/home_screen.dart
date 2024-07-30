import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:soccer_app/presentation/providers/fixture/fixture_provider.dart';
import 'package:soccer_app/presentation/screens/home/fixture_lineups.dart';
import 'package:soccer_app/presentation/screens/home/statistics.dart';
import 'package:soccer_app/presentation/screens/ligues/ligues_sceen.dart';

class HomeScreen extends StatefulWidget {
  static const path = '/home';
  static const name = 'home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final responseFixt = Provider.of<FixtureProvider>(context, listen: false);
    responseFixt.getAllFixture();
  }

  @override
  Widget build(BuildContext context) {
    final responseFixt = Provider.of<FixtureProvider>(context);
    final screenSize = MediaQuery.of(context).size;
    final double letterSize = screenSize.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.lightBlue.withOpacity(0.5), 
        title: TextButton(
          onPressed: () { responseFixt.getAllLineups(); context.push(FixtureLineups.path);},
          child: Text("Lineups", style:  TextStyle(fontSize: letterSize * 0.025, fontWeight: FontWeight.bold,color: Colors.white),),
        ),
        actions: [
          TextButton(
            onPressed: () => context.push(LiguesScreen.path),
            child: Text("Leagues",style:  TextStyle(fontSize: letterSize * 0.025, fontWeight: FontWeight.bold,color: Colors.white),),
          )
        ],
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
          ListView.builder(
            itemCount: responseFixt.allFixture.length,
            itemBuilder: (BuildContext context, int index) {
              final infoFixt = responseFixt.allFixture[index];
              return GestureDetector(
                onTap: () {
                  responseFixt.getallStatistics();
                  context.push(StatisticsScreen.path);
                },
                child: Container(
                  padding: const EdgeInsets.all(1),
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  height: 110,
                  child: Card(
                    color: Colors.white,
                    elevation: 5,
                    shadowColor: Colors.black54,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Primer lado
                        SizedBox(
                          width: 70,
                          child: Text(
                            infoFixt.teams.home.name,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        CircleAvatar(
                          child: FadeInImage(
                            placeholder: AssetImage('assets/loading.gif'),
                            image: NetworkImage(infoFixt.teams.home.logo),
                          ),
                        ),
          
                        // Parte central
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              infoFixt.fixture.timezone.name,
                              style: TextStyle(
                                fontSize: letterSize * 0.013 ,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '2024',
                              style: TextStyle(
                                fontSize: letterSize * 0.013,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              infoFixt.league.name,
                              style: TextStyle(
                                fontSize: letterSize * 0.010,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
          
                        // Segundo lado
                        CircleAvatar(
                          child: FadeInImage(
                            placeholder: AssetImage('assets/loading.gif'),
                            image: NetworkImage(infoFixt.teams.away.logo),
                          ),
                        ),
                        SizedBox(
                          width: 70,
                          child: Text(
                            infoFixt.teams.away.name,
                            style: TextStyle(fontSize: letterSize *0.010 ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
