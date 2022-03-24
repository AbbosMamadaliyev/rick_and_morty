import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/presentation/location_body/location_body_model.dart';

class LocationBodyWidget extends StatefulWidget {
  const LocationBodyWidget({Key? key}) : super(key: key);

  @override
  _LocationBodyWidgetState createState() => _LocationBodyWidgetState();
}

class _LocationBodyWidgetState extends State<LocationBodyWidget> {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<LocationBodyModel>();
    final locations = model.locations;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Location',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: model.isLoadInProgress
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              itemCount: locations.length,
              itemBuilder: (BuildContext context, int index) {
                model.showMovieAtIndex(index);
                final location = locations[index];

                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade300)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          location.name,
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          location.type,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 16,
                childAspectRatio: 4 / 2.5,
                crossAxisCount: 2,
                mainAxisSpacing: 16,
              ),
            ),
    );
  }
}

// flutter bloc
