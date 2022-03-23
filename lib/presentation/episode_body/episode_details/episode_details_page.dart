import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/data/models/episode_model.dart';

import '../../navigation/main_navigation.dart';
import '../episode_body_model.dart';

class EpisodeDetailsPage extends StatefulWidget {
  const EpisodeDetailsPage({Key? key}) : super(key: key);

  @override
  _EpisodeDetailsPageState createState() => _EpisodeDetailsPageState();
}

class _EpisodeDetailsPageState extends State<EpisodeDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<EpisodeBodyModel>();
    final charactersM = model.characters;
    print(model.characters.length);
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final episode = args['episode'] as Episode;

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          episode.name,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 110,
            width: size.width,
            color: Colors.grey.shade200,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              children: [
                Text(
                  'date: ${episode.air_date}',
                  style: const TextStyle(color: Colors.grey),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    'name: ${episode.name}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  'episode: ${episode.episode}',
                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Text(
                    'Characters',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                model.isLoadInProgress
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 2 / 3,
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemCount: episode.characters.length,
                        itemBuilder: (context, index) {
                          final character = charactersM[index];

                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  MainNavigationRouteNames.characterDetails,
                                  arguments: character);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.grey.shade200,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                    ),
                                    child: SizedBox(
                                      height: size.height * 0.25,
                                      child: Image.network(
                                        character.image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16.0, top: 8),
                                    child: Text(
                                      character.status,
                                      style: TextStyle(
                                          color: Colors.grey.shade300,
                                          fontSize: 16),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16.0, top: 4),
                                    child: Text(
                                      character.name,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
