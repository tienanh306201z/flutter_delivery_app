import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_delivery_app/controller/detail_controller.dart';
import 'package:get/get.dart';

class DetailPage extends StatefulWidget {
  static const tag = '/detail';

  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var imgs = [];
  final detailController = Get.put(DetailController());

  @override
  void initState() {
    _readData();
    detailController.getFavStatus();
    super.initState();
  }

  _readData() async {
    await DefaultAssetBundle.of(context)
        .loadString('assets/jsons/img.json')
        .then((value) {
      imgs = json.decode(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    int _currentIndex = 0;
    return Scaffold(
      body: Container(
        color: const Color(0xFFc5e5f3),
        child: Stack(
          children: [
            Positioned(
                top: 50,
                left: 10,
                child: IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.arrow_back_ios),
                )),
            Positioned(
              top: 120,
              left: 0,
              height: 100,
              width: width,
              child: Container(
                width: width,
                height: 100,
                margin: const EdgeInsets.only(left: 25, right: 25),
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
                            AssetImage("assets/${Get.arguments['img']}"),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Get.arguments['name'],
                            style: const TextStyle(
                                color: Color(0xFF3b3f42),
                                fontSize: 18,
                                decoration: TextDecoration.none),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            "Top Level",
                            style: TextStyle(
                                color: Color(0xFFfdebb2),
                                fontSize: 12,
                                decoration: TextDecoration.none),
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
                      Container(
                        width: 70,
                        height: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xFFf3fafc)),
                        child: const Center(
                          child: Icon(
                            Icons.notifications,
                            color: Color(0xFF69c5df),
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 320,
              left: 0,
              width: width,
              height: height,
              child: Container(
                width: 80,
                height: 80,
                color: const Color(0xFFf9fbfc),
              ),
            ),
            Positioned(
              top: 250,
              left: 0,
              width: width,
              height: 250,
              child: Container(
                margin: const EdgeInsets.only(left: 25, right: 25),
                width: width,
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFfcfffe),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 20,
                          spreadRadius: 1,
                          offset: const Offset(0, 10),
                          color: Colors.grey.withOpacity(0.2))
                    ]),
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 20, top: 20, bottom: 20, right: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            Get.arguments['title'],
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w500),
                          ),
                          Expanded(child: Container())
                        ],
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: width,
                        child: Text(
                          Get.arguments['text'],
                          style: const TextStyle(
                              fontSize: 20, color: Color(0xFFb8b8b8)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        thickness: 1.0,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.watch_later,
                                  color: Color(0xFF69c5df)),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    Get.arguments['name'],
                                    style: const TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFF303030),
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const Text(
                                    "Deadline",
                                    style: TextStyle(
                                        fontSize: 18, color: Color(0xFFacacac)),
                                  )
                                ],
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.monetization_on,
                                  color: Color(0xFFfb8483)),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    Get.arguments['prize'],
                                    style: const TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFF303030),
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const Text(
                                    "Prize",
                                    style: TextStyle(
                                        fontSize: 18, color: Color(0xFFacacac)),
                                  )
                                ],
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.star, color: Color(0xFFfbc33e)),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Top Level",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFF303030),
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    "Entry",
                                    style: TextStyle(
                                        fontSize: 18, color: Color(0xFFacacac)),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                top: 540,
                left: 25,
                height: 50,
                child: RichText(
                    text: const TextSpan(
                        text: "Total Participants ",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Colors.black),
                        children: [
                      TextSpan(
                          text: "(11)",
                          style: TextStyle(color: Color(0xFFfbc33e)))
                    ]))),
            //images
            Stack(children: [
              for (int i = 0; i < imgs.length; i++)
                Positioned(
                  top: 590,
                  left: (20 + i * 35).toDouble(),
                  width: 50,
                  height: 50,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                            image: AssetImage("assets/${imgs[i]['img']}"),
                            fit: BoxFit.cover)),
                  ),
                )
            ]),
            //favourite
            Positioned(
                top: 670,
                left: 25,
                child: Row(
                  children: [
                    Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xFFfbc33e)),
                        child: GetX<DetailController>(
                          builder: (_) => InkWell(
                            onTap: () {
                              detailController.setFavStatus();
                            },
                            child: detailController.isFavorite.value
                                ? const Icon(Icons.favorite,
                                    color: Colors.white)
                                : const Icon(Icons.favorite_border, color: Colors.white,),
                          ),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Add to favorite",
                      style: TextStyle(color: Color(0xFFfbc33e), fontSize: 18),
                    )
                  ],
                ))
            //))
          ],
        ),
      ),
    );
  }
}
