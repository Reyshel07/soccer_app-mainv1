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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ligues"),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchLeaguesByName(),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: ListView.builder(
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
            title: Text(leagueInformation.league.name),
            subtitle: Text(leagueInformation.league.type.name),
          );
        },
      ),
    );
  }
}
