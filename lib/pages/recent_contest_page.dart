import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentContestPage extends StatefulWidget {
  static const tag = '/recent-contest';

  const RecentContestPage({Key? key}) : super(key: key);

  @override
  State<RecentContestPage> createState() => _RecentContestPageState();
}

class _RecentContestPageState extends State<RecentContestPage> {
  var list = [];

  @override
  void initState() {
    _readData();
    super.initState();
  }

  _readData() async {
    await DefaultAssetBundle.of(context)
        .loadString('assets/jsons/recent.json')
        .then((value) {
      setState(() {
        list = json.decode(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recent Contest'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.orange,
      ),
      backgroundColor: const Color(0xFFc5e5f3),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: list.length,
          itemBuilder: (_, i) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              margin:
                  const EdgeInsets.only(left: 25, right: 25, bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFFebf8fd),
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage:
                          AssetImage("assets/${list[i]['img']}"),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          list[i]['status'],
                          style: const TextStyle(
                              color: Colors.orange,
                              fontSize: 18,
                              decoration: TextDecoration.none),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: 170,
                          child: Text(
                            list[i]['text'],
                            style: const TextStyle(
                                color: Color(0xFF3b3f42),
                                fontSize: 18,
                                decoration: TextDecoration.none),
                          ),
                        )
                      ],
                    ),
                    Expanded(child: Container()),
                    SizedBox(
                      width: 70,
                      height: 70,
                      child: Text(
                        list[i]['time'],
                        style: const TextStyle(
                            fontSize: 10,
                            decoration: TextDecoration.none,
                            color: Color(0xFFb2b8bb)),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
