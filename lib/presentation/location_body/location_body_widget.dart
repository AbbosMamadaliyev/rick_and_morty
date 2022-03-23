import 'package:flutter/material.dart';
import 'package:rick_and_morty/presentation/navigation/main_navigation.dart';

class LocationBodyWidget extends StatefulWidget {
  const LocationBodyWidget({Key? key}) : super(key: key);

  @override
  _LocationBodyWidgetState createState() => _LocationBodyWidgetState();
}

class _LocationBodyWidgetState extends State<LocationBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Location',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        crossAxisSpacing: 16,
        childAspectRatio: 4 / 2,
        children: List.generate(5, (index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(MainNavigationRouteNames.locationDetails);
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'planet',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'earth',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
