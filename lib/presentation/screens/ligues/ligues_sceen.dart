import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soccer_app/presentation/providers/ligues/ligues_provider.dart';
import 'package:soccer_app/presentation/providers/ligues/search_delegate_leagues.dart';
import 'package:soccer_app/presentation/utils/assets_utlis.dart';

class LiguesScreen extends StatefulWidget {
  static const path = '/ligues';
  static const name = 'ligues';
  const LiguesScreen({super.key});

  @override
  State<LiguesScreen> createState() => _LiguesScreenState();
}

class _LiguesScreenState extends State<LiguesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final leaguesProvider =
          Provider.of<LiguesProvider>(context, listen: false);
      leaguesProvider.getAllLigues();
    });
  }

  @override
  Widget build(BuildContext context) {
    final leaguesProvider = Provider.of<LiguesProvider>(context);
    final screenSize = MediaQuery.of(context).size;
    final double letterSize = screenSize.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue.withOpacity(0.5),
        title: Text("Ligues", style: TextStyle(fontSize: letterSize * 0.028, color: Colors.white, fontWeight: FontWeight.bold),),
        actions: [
          IconButton(
            color:  Colors.white,
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchLeaguesByName(),
              );
            },
            icon: const Icon(color: Colors.white,Icons.search),
          ),
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
            itemCount: leaguesProvider.allLeagues.length,
            itemBuilder: (BuildContext context, int index) {
              final leagueInformation = leaguesProvider.allLeagues[index];
              return ListTile(
                trailing: SizedBox(
                    width: 40,
                    height: 100,
                    child: FadeInImage(
                      placeholder: AssetImage(AssetImageApp.getLoadingGif),
                      image: NetworkImage(leagueInformation.league.logo),
                      fit: BoxFit.cover,
                    )),
                title: Text(leagueInformation.league.name, style: TextStyle(fontSize: letterSize * 0.018),),
                subtitle: Text(leagueInformation.league.type.name,style: TextStyle(fontSize: letterSize * 0.018))
              );
            },
          ),
        ],
      ),
    );
  }
}
