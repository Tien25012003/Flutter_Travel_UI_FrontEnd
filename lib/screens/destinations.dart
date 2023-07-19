import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/activity_model.dart';
import '../models/destination_model.dart';

class DestinationScreen extends StatefulWidget {
  final Destination destination;
  const DestinationScreen({super.key, required this.destination});

  @override
  State<DestinationScreen> createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle.dark,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                    height: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 6),
                              blurRadius: 6)
                        ]),
                    child: Hero(
                      tag: widget.destination.imageUrl,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image(
                          image: AssetImage(widget.destination.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Colors.black,
                        iconSize: 30,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            color: Colors.black,
                            iconSize: 30,
                          ),
                          IconButton(
                            icon: const Icon(FontAwesomeIcons.list),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            color: Colors.black,
                            iconSize: 25,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.destination.city,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                FontAwesomeIcons.locationArrow,
                                size: 10,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                widget.destination.country,
                                style: const TextStyle(
                                    color: Colors.white70, fontSize: 20),
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: widget.destination.activities.length,
                  itemBuilder: (context, index) {
                    Activity activity = widget.destination.activities[index];
                    return Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(40, 5, 20, 5),
                          height: 170,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    activity.imageUrl,
                                    width: 120,
                                    height: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              width: 100,
                                              child: Text(
                                                activity.name,
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                          Text(
                                            "\$${activity.price}",
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
