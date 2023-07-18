import 'package:travel_ui/utilites/app_image.dart';

import 'activity_model.dart';

class Destination {
  late String imageUrl;
  late String city;
  late String country;
  late String description;
  List<Activity> activities;
  Destination(
      {required this.imageUrl,
      required this.city,
      required this.country,
      required this.description,
      required this.activities});
}

List<Activity> activities = [
  Activity(
      imageUrl: "${AppImage.imagePath}stmarksbasilica.jpg",
      name: "St.Mark\'s Basilica",
      type: "Sightseeing Tour",
      startTimes: ['9:00 am', '11:00 am'],
      rating: 5,
      price: 30),
  Activity(
    imageUrl: '${AppImage.imagePath}gondola.jpg',
    name: 'Walking Tour and Gonadola Ride',
    type: 'Sightseeing Tour',
    startTimes: ['11:00 pm', '1:00 pm'],
    rating: 4,
    price: 210,
  ),
  Activity(
    imageUrl: '${AppImage.imagePath}murano.jpg',
    name: 'Murano and Burano Tour',
    type: 'Sightseeing Tour',
    startTimes: ['12:30 pm', '2:00 pm'],
    rating: 3,
    price: 125,
  ),
];

List<Destination> destinations = [
  Destination(
    imageUrl: 'assets/images/venice.jpg',
    city: 'Venice',
    country: 'Italy',
    description: 'Visit Venice for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/paris.jpg',
    city: 'Paris',
    country: 'France',
    description: 'Visit Paris for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/newdelhi.jpg',
    city: 'New Delhi',
    country: 'India',
    description: 'Visit New Delhi for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/saopaulo.jpg',
    city: 'Sao Paulo',
    country: 'Brazil',
    description: 'Visit Sao Paulo for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/newyork.jpg',
    city: 'New York City',
    country: 'United States',
    description: 'Visit New York for an amazing and unforgettable adventure.',
    activities: activities,
  ),
];
