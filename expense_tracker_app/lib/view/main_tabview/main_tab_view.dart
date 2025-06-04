import 'package:expense_tracker_app/common/color_extension.dart';
import 'package:flutter/material.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.gray,
      body: Stack(children: [
        SafeArea(
          child: Column(
            children: [
              const Spacer(),
          
              Padding(padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20), child: 
              Stack(children: [
                Image.asset("assets/img/bottom_bar_bg.png")
              ],),)
            ],
          ),
        )
      ],),
    );
  }
}