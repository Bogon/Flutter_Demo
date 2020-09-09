import 'package:flutter/material.dart';
import '../home/home.dart';
import '../favorate/favorate.dart';

final List<Widget> pages = [
  HomeScreen(),
  FavorateScreen(),
];

final List<BottomNavigationBarItem> items = [
  BottomNavigationBarItem(
    title: Text("首页"),
    icon: Icon(Icons.home),
  ),

  BottomNavigationBarItem(
    title: Text("收藏"),
    icon: Icon(Icons.star),
  ),
];