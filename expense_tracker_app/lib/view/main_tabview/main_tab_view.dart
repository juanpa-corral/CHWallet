import 'package:expense_tracker_app/common/color_extension.dart';
import 'package:expense_tracker_app/view/home/home_view.dart';
import 'package:flutter/material.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int selecTab = 0;
  PageStorageBucket pageStorageBucket = PageStorageBucket();
  Widget currentTabView = const HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.gray,
      body: Stack(
        children: [
          PageStorage(bucket: pageStorageBucket, child: currentTabView),
          SafeArea(
            child: Column(
              children: [
                const Spacer(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset("assets/img/bottom_bar_bg.png"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    selecTab = 0;
                                    currentTabView = const HomeView();
                                  });
                                },
                                icon: Image.asset(
                                  "assets/img/home.png",
                                  width: 20,
                                  height: 20,
                                  color: selecTab == 0
                                      ? TColor.white
                                      : TColor.gray30,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    selecTab = 1;
                                    currentTabView = Container();
                                  });
                                },
                                icon: Image.asset(
                                  "assets/img/budgets.png",
                                  width: 20,
                                  height: 20,
                                  color: selecTab == 1
                                      ? TColor.white
                                      : TColor.gray30,
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                                height: 50,
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    selecTab = 2;
                                    currentTabView = Container();
                                  });
                                },
                                icon: Image.asset(
                                  "assets/img/calendar.png",
                                  width: 20,
                                  height: 20,
                                  color: selecTab == 2
                                      ? TColor.white
                                      : TColor.gray30,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    selecTab = 3;
                                    currentTabView = Container();
                                  });
                                },
                                icon: Image.asset(
                                  "assets/img/creditcards.png",
                                  width: 20,
                                  height: 20,
                                  color: selecTab == 3
                                      ? TColor.white
                                      : TColor.gray30,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      InkWell(
                        onTap: (){
                          
                        },
                        child: Container(
                          margin: const EdgeInsets.all(20),
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: TColor.secondary.withOpacity(0.25),
                                blurRadius: 8,
                                offset: const Offset(0, 4))
                          ], borderRadius: BorderRadius.circular(50)),
                          child: Image.asset("assets/img/center_btn.png", width: 55, height: 55,),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
