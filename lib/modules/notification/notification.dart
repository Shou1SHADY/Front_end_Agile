import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import '../../../models/notifications.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  List<Notifications> notification = [
    Notifications(
        icon: Icons.man,
        notificationTitle: "Notification Title",
        notificationBody: "Notification Body",
        time: "Time for notification"),
    Notifications(
        icon: Icons.man,
        notificationTitle: "Notification Title",
        notificationBody: "Notification Body",
        time: "Time for notification"),
    Notifications(
        icon: Icons.man,
        notificationTitle: "Notification Title",
        notificationBody: "Notification Body",
        time: "Time for notification"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        actions: [
          Badge(
            position: BadgePosition.topEnd(top: 10, end: 10),
            badgeContent: const Text("1"),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_alert_outlined),
            ),
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: <Color>[Colors.purple, Colors.blue]),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: notification.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(Icons.man),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("A new Activity",
                      style: TextStyle(fontSize: 18),
                      overflow: TextOverflow.ellipsis,
                      softWrap: true),
                  Text(
                    "Check in",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              trailing: const Text(
                "14-10-2022 04:04 PM",
                style: TextStyle(fontSize: 10),
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            );
          },
        ),
      ),
    );
  }
}
