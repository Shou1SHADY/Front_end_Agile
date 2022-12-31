import 'package:flutter/material.dart';

import '../../models/room.dart';

class Visualize extends StatelessWidget {
  List<Materialss> views = <Materialss>[
    Materialss(
        avatar: "assets/photos/Bills-and-plans.510a8cba.png", name: "Name"),
    Materialss(
        avatar: "assets/photos/Bills-and-plans.510a8cba.png", name: "Name"),
    Materialss(
        avatar: "assets/photos/Bills-and-plans.510a8cba.png", name: "Name"),
    Materialss(
        avatar: "assets/photos/Bills-and-plans.510a8cba.png", name: "Name"),
  ];

  Visualize({super.key});

  @override
  Widget build(BuildContext context) {
    //////////////////////////////////////////////////////////////
    List tabs = [
      Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/photos/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              height: 150,
              child: Column(children: const [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.amberAccent,
                ),
                SizedBox(
                  height: 10,
                ),
                Text("data"),
              ]),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: views.length,
                itemBuilder: ((context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          AssetImage(views[index].avatar.toString()),
                    ),
                    title: Text(views[index].name.toString()),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/photos/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              height: 150,
              child: Column(children: const [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.amberAccent,
                ),
                SizedBox(
                  height: 10,
                ),
                Text("data"),
              ]),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: views.length,
                itemBuilder: ((context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          AssetImage(views[index].avatar.toString()),
                    ),
                    title: Text(views[index].name.toString()),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/photos/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              height: 150,
              child: Column(children: const [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.amberAccent,
                ),
                SizedBox(
                  height: 10,
                ),
                Text("data"),
              ]),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: views.length,
                itemBuilder: ((context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          AssetImage(views[index].avatar.toString()),
                    ),
                    title: Text(views[index].name.toString()),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    ];
//////////////////////////////////////////////////////////////////

    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Child moments"),
            // title: Row(
            //   children: [
            //     CircleAvatar(
            //       backgroundColor: Colors.amberAccent,
            //     ),
            //     Text("data"),
            //   ],
            // ),
            bottom: const TabBar(
              tabs: [
                Tab(
                  child: Text("data"),
                ),
                Tab(
                  child: Text("data"),
                ),
                Tab(
                  child: Text("data"),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [...tabs.map((e) => e)],
          )),
    );
  }
}
