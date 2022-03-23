import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:rick_and_morty/presentation/episode_body/episode_body_model.dart';
import 'package:rick_and_morty/presentation/navigation/main_navigation.dart';

import '../../data/models/character_model.dart';

class EpisodeBodyWidget extends StatefulWidget {
  const EpisodeBodyWidget({Key? key}) : super(key: key);

  @override
  _EpisodeBodyWidgetState createState() => _EpisodeBodyWidgetState();
}

class _EpisodeBodyWidgetState extends State<EpisodeBodyWidget> {
  final String _baseUrl = 'https://rickandmortyapi.com/api/episode';
  String link = '';

  Future<Character> charactersInEpisode() async {
    final url = Uri.parse(_baseUrl);
    final response = await http.get(url);
    Map<String, dynamic> map = jsonDecode(response.body);
    print((map['results'] as List)
        .map((e) => print((e['characters'] as List).map((e) {
              setState(() {
                link = e;
              });
            }))));
    final result = Character.fromMap(map);
    print(link);
    return result;
  }

  @override
  void initState() {
    charactersInEpisode();
    print('hello');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<EpisodeBodyModel>();
    final episodes = model.episodes;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Episode',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: model.isLoadInProgress
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      model.showEpisodeAtIndex(index);
                      final episode = episodes[index];

                      return InkWell(
                        onTap: () {
                          context
                              .read<EpisodeBodyModel>()
                              .charactersOnEpisode(episode.characters, index);

                          Navigator.of(context).pushNamed(
                            MainNavigationRouteNames.episodeDetails,
                            arguments: {
                              'episode': episode,
                            },
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  episode.episode,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4.0),
                                  child: Text(
                                    episode.name,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey),
                                  ),
                                ),
                                Text(
                                  episode.air_date,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey.shade500,
                              size: 18,
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 6.0),
                        child: Divider(),
                      );
                    },
                    itemCount: 12,
                  ),
                ],
              ),
            ),
    );
  }
}
