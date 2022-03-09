import 'package:flutter/material.dart';

import '../../MyComponent/ddb2.dart';

class LoadingList extends StatefulWidget {
  const LoadingList({Key? key}) : super(key: key);

  @override
  State<LoadingList> createState() => _LoadingListState();
}

class _LoadingListState extends State<LoadingList> {
  final items1 = ['Vassel2', 'Vassel3', 'Vassel1', 'Vassel4'];
  final item1 = ['Vassel2', 'Vassel54', 'Vassel8', 'Vassel4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.orange[300],
          title: const Text("Loading List"),
          centerTitle: true,
          // leading: const Icon(Icons.arrow_back),
        ),
        body: Center(
          child: ListView(children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/vassel.png",
                  fit: BoxFit.cover,
                  height: 250.0,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Vessel",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w500),
                      ),
                      DropDownButton(listItems: items1),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Vayage",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w500),
                          ),
                          DropDownButton(listItems: items1)
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 50,
                              width: 150,
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Icon(
                                    Icons.refresh_outlined,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    "Refresh",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(9)),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 50,
                              width: 150,
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Icon(Icons.save_sharp),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    "Save",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.greenAccent,
                                  borderRadius: BorderRadius.circular(9)),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )
          ]),
        ));
  }
}
