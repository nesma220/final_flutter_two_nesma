import 'package:final_flutter_two_nesma/modules/cart_screen.dart';
import 'package:final_flutter_two_nesma/modules/settings_screen.dart';
import 'package:final_flutter_two_nesma/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {

  final List<Map<String, dynamic>> events = [
    {
      "image": "assets/event1.png",
      "price": "500 SR",
      "title": "New Music Event on Dubai Botek for Valentine Day",
      "location": "Riyadh, Marash Tower",
      "rating": 4.5,
      "isVisible": true,
    },
    {
      "image": "assets/event2.png",
      "price": "450 SR",
      "title": "Live Concert in Riyadh Arena",
      "location": "Riyadh, Arena",
      "rating": 4.7,
      "isVisible": true,
    },
    {
      "image": "assets/event2.png",
      "price": "300 SR",
      "title": "Tech Conference 2024",
      "location": "Jeddah, Tech Hub",
      "rating": 4.3,
      "isVisible": false,
    },
    {
      "image": "assets/event2.png",
      "price": "450 SR",
      "title": "Live Concert in Riyadh Arena",
      "location": "Riyadh, Arena",
      "rating": 4.7,
      "isVisible": true,
    },
    {
      "image": "assets/event2.png",
      "price": "300 SR",
      "title": "Tech Conference 2024",
      "location": "Jeddah, Tech Hub",
      "rating": 4.3,
      "isVisible": false,
    },
  ];

  List<Map<String, dynamic>> bookedEvents = [];

  void addToCard(Map<String, dynamic> event) {
    setState(() {
      if (!bookedEvents.contains(event)) {
        bookedEvents.add(event);
      }
    });
  }

  void goToCardScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CardScreen(bookedEvents: bookedEvents),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Theme.of(context).colorScheme.surface,

      appBar: AppBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title:  Text(
          "Events",
          style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              Get.toNamed(Routes.settings);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: events.length,
              itemBuilder: (context, index) {
                final event = events[index];
                if (event["isVisible"]) {
                  return eventCard(event);
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
          bottomButton(),
        ],
      ),
    );
  }

  Widget eventCard(Map<String, dynamic> event) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Stack(
              children: [
                Image.asset(
                  event["image"],
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      event["price"],
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            event["rating"].toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        event["title"],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  event["location"],
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  onPressed: () => addToCard(event),
                  child: const Text("ADD TO CARD",
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomButton() {
    return GestureDetector(
      onTap: goToCardScreen,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        ),
        child: Center(
          child: TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const CartScreen();
                },
              ));
            },
            child: const Text(
              "GO TO CARD",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

class CardScreen extends StatelessWidget {
  final List<Map<String, dynamic>> bookedEvents;

  const CardScreen({super.key, required this.bookedEvents});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Booked Events")),
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: bookedEvents.length,
        itemBuilder: (context, index) {
          final event = bookedEvents[index];
          return ListTile(
            leading: Image.network(event["image"],
                width: 50, height: 50, fit: BoxFit.cover),
            title: Text(event["title"]),
            subtitle: Text(event["location"]),
          );
        },
      ),
    );
  }
}
