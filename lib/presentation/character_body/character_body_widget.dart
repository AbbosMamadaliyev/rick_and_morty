import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../navigation/main_navigation.dart';
import 'character_body_model.dart';

class CharacterBodyWidget extends StatefulWidget {
  const CharacterBodyWidget({Key? key}) : super(key: key);

  @override
  _CharacterBodyWidgetState createState() => _CharacterBodyWidgetState();
}

class _CharacterBodyWidgetState extends State<CharacterBodyWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final model = context.watch<CharacterBodyModel>();
    final characters = model.characters;
    print(characters.length);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Character',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(MainNavigationRouteNames.characterFilter);
            },
            icon: const Icon(
              Icons.filter_list,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: model.isLoadInProgress
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 2 / 3,
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    final character = characters[index];
                    model.showMovieAtIndex(index);

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
                              padding:
                                  const EdgeInsets.only(left: 16.0, top: 8),
                              child: Text(
                                character.status,
                                style: TextStyle(
                                    color: Colors.grey.shade300, fontSize: 16),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 16.0, top: 4),
                              child: Text(
                                character.name,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
    );
  }
}

/*
GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(16),
              childAspectRatio: 2 / 3.4,
              crossAxisSpacing: 16,
              mainAxisSpacing: 20,
              children: List.generate(characters.length, (index) {
                model.showMovieAtIndex(index);
                final character = characters[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(MainNavigationRouteNames.characterDetails);
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
                          padding: const EdgeInsets.only(left: 16.0, top: 8),
                          child: Text(
                            character.status,
                            style: TextStyle(
                                color: Colors.grey.shade300, fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, top: 4),
                          child: Text(
                            character.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            )

 */
