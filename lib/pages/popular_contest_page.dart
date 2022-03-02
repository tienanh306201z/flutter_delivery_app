import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'detail_page.dart';

class PopularContestPage extends StatefulWidget {
  static const tag = '/popular-contest';

  const PopularContestPage({Key? key}) : super(key: key);

  @override
  State<PopularContestPage> createState() => _PopularContestPageState();
}

class _PopularContestPageState extends State<PopularContestPage> {
  var info = [];

  @override
  void initState() {
    _readData();
    super.initState();
  }

  _readData() async {
    await DefaultAssetBundle.of(context)
        .loadString('assets/jsons/detail.json')
        .then((value) {
      setState(() {
        info = json.decode(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Contest'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.orange,
      ),
      backgroundColor: const Color(0xFFc5e5f3),
      body: PageView.builder(
          padEnds: false,
          pageSnapping: true,
          controller: PageController(viewportFraction: 0.3),
          itemCount: info.length,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (_, i) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () => Get.toNamed(DetailPage.tag, arguments: {
                    'title': info[i]['title'],
                    'name': info[i]['name'],
                    'text': info[i]['text'],
                    'time': info[i]['time'],
                    'img': info[i]['img'],
                    'prize': info[i]['prize'],
                  }),
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    height: 220,
                    width: MediaQuery.of(context).size.width - 20,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: i.isEven
                            ? const Color(0xFF69c5df)
                            : const Color(0xFF9294cc)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              info[i]['title'],
                              style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            Expanded(child: Container())
                          ],
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            info[i]['text'],
                            style: const TextStyle(
                                fontSize: 20, color: Color(0xFFb8eefc)),
                          ),
                        ),
                        const Spacer(),
                        const Divider(
                          thickness: 1.0,
                        ),
                        Row(children: [
                          for (int j = 0; j < 4; j++)
                            SizedBox(
                              width: 50,
                              height: 50,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/${info[j]['img']}"),
                                        fit: BoxFit.cover)),
                              ),
                            )
                        ]),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            );
          }),
    );
  }
}
