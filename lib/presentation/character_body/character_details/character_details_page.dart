import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/models/character_model.dart';

class CharacterDetailsPage extends StatefulWidget {
  const CharacterDetailsPage({Key? key}) : super(key: key);

  @override
  _CharacterDetailsPageState createState() => _CharacterDetailsPageState();
}

class _CharacterDetailsPageState extends State<CharacterDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final character = ModalRoute.of(context)!.settings.arguments as Character;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 280,
                width: size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/back_image.png',
                      ),
                      fit: BoxFit.cover),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: size.height * 0.035),
                  child: Column(
                    children: [
                      Container(
                        height: 140,
                        width: 140,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                          image: DecorationImage(
                              image: NetworkImage(character.image)),
                          border: Border.all(color: Colors.white, width: 4),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          character.status,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ),
                      Text(
                        character.name,
                        style: const TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        character.species,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Informations',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey),
                    ),
                    const SizedBox(height: 20),
                    textTitle('Gender'),
                    Text(character.gender, style: _style),
                    const Divider(),
                    textTitle('Origin'),
                    Text(character.origin.name, style: _style),
                    const Divider(),
                    textTitle('Type'),
                    Text(character.type ?? 'unknown', style: _style),
                    const Divider(),
                    textTitle('Location'),
                    Text(character.location.name, style: _style),
                    const Divider(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0, bottom: 12),
                      child: Text(
                        'Episodes : ${character.episode.length}',
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  final _style = const TextStyle(color: Colors.grey);

  Widget textTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    );
  }
}
