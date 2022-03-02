import 'package:flutter/material.dart';
import 'package:flutter_delivery_app/pages/content_page.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  static const tag = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF69c5df),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            height: 700,
            child: Container(
              height: 700,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/img/background.jpg'),
                      fit: BoxFit.cover)),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Pick Your Favourite\nContests',
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width - 25,
                      child: const Text(
                        'We make great design work happen with our great community designer',
                        style: TextStyle(color: Colors.white60),
                      )),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: 200,
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFffbc33e)),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: const Color(0xFFfbc33e),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      onPressed: () => Get.toNamed(ContentPage.tag),
                      child: const Text(
                        "Get started",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
