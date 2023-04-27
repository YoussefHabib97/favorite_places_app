import 'package:flutter/material.dart';

// Model imports
import 'package:favorite_places/models/place_model.dart';

// Screen imports
import 'package:favorite_places/screens/place_details_screen.dart';

class PlacesList extends StatelessWidget {
  final List<Place> places;
  const PlacesList({super.key, required this.places});

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Text(
          "No places added yet",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      );
    }

    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (context, index) => ListTile(
        leading: CircleAvatar(
          radius: 24,
          backgroundImage: FileImage(places[index].image),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PlaceDetailsScreen(place: places[index]),
            ),
          );
        },
        title: Text(
          places[index].title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        subtitle: Text(
          places[index].location.address,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
    );
  }
}
