//searchdelegate

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:soccer_app/presentation/providers/ligues/ligues_provider.dart';
import 'package:soccer_app/presentation/utils/assets_utlis.dart';

class SearchLeaguesByName extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
          context.read<LiguesProvider>().clearSearchResults();
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.pop();
      },
      icon: const Icon(Icons.arrow_back_ios),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    context.read<LiguesProvider>().getLeaguesByName(query);

    return Consumer<LiguesProvider>(
      builder: (context, provider, child) {
        if (provider.searchResults.isEmpty) {
          return const Center(
            child: Text("No se encontraron datos")
          );
        }

        return ListView.builder(
          itemCount: provider.searchResults.length,
          itemBuilder: (context, index) {
            return ListTile(
              trailing: SizedBox(
                  // width: 65,
                  height: 100,
                  child: FadeInImage(
                    placeholder: AssetImage(AssetImageApp.getLoadingGif),
                    image:
                        NetworkImage(provider.searchResults[index].league.logo),
                    fit: BoxFit.cover,
                  )),
              title: Text(provider.searchResults[index].league.name),
            );
          },
        );
      },
    );
    //Lo que obtnegamos del servicio
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
