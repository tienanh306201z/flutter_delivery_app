import 'package:flutter/material.dart';
import 'package:flutter_delivery_app/pages/popular_contest_page.dart';
import 'package:get/get.dart';

import '/pages/content_page.dart';
import '/pages/detail_page.dart';
import '/pages/home_page.dart';
import '/pages/recent_contest_page.dart';

var routes = [
  GetPage(name: HomePage.tag, page: () => const HomePage()),
  GetPage(name: ContentPage.tag, page: () => const ContentPage()),
  GetPage(name: DetailPage.tag, page: () => const DetailPage()),
  GetPage(
      name: RecentContestPage.tag,
      page: () => const RecentContestPage(),
      curve: Curves.easeInOut),
  GetPage(name: PopularContestPage.tag, page: () => const PopularContestPage()),
];
