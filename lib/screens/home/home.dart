import 'package:designedbyalla_ecotourism/components/guide_card.dart';
import 'package:designedbyalla_ecotourism/constants.dart';
import 'package:designedbyalla_ecotourism/screens/home/adventure.dart';
import 'package:designedbyalla_ecotourism/screens/home/ecosite.dart';
import 'package:designedbyalla_ecotourism/screens/home/mission.dart';
import 'package:designedbyalla_ecotourism/screens/home/progress.dart';
import 'package:designedbyalla_ecotourism/screens/sign_in_and_register/sign_page.dart';
import 'package:designedbyalla_ecotourism/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static const String id = 'Home';

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int _selectedPageIndex = 0;
  PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  double opacitySettings = 1;
  double opacityTitle = 1;
  double opacityGuide = 1;
  double opacityNavBarEcosite = 1;
  double opacityNavBarAdventure = 1;
  double opacityNavBarMission = 1;
  double opacityNavBarProgress = 1;

  void setOpacity({
    double settings,
    double title,
    double guide,
    double ecosite,
    double adventure,
    double mission,
    double progress,
  }) {
    setState(() {
      opacitySettings = settings ?? opacitySettings;
      opacityTitle = title ?? opacityTitle;
      opacityGuide = guide ?? opacityGuide;
      opacityNavBarEcosite = ecosite ?? opacityNavBarEcosite;
      opacityNavBarAdventure = adventure ?? opacityNavBarAdventure;
      opacityNavBarMission = mission ?? opacityNavBarMission;
      opacityNavBarProgress = progress ?? opacityNavBarProgress;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PopupMenuTheme(
                    data: PopupMenuThemeData(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Opacity(
                      opacity: opacitySettings,
                      child: PopupMenuButton(
                          enabled: opacitySettings == 1,
                          onSelected: (value) async {
                            if (value == 0) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) => Material(
                                        color: Colors.transparent,
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 32),
                                            child: Stack(
                                              alignment: Alignment.topRight,
                                              children: [
                                                Image.asset(
                                                  'images/infoBox.png',
                                                  alignment: Alignment.center,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                      child: Image.asset(
                                                        'images/exitScreen.png',
                                                        height: 35,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ));
                            } else {
                              try {
                                await FirebaseAuth.instance.signOut();
                                Navigator.pushReplacementNamed(
                                    context, SignPage.id);
                              } catch (e) {
                                print(e);
                              }
                            }
                          },
                          offset: Offset(0, 25),
                          child: Image.asset(
                            'images/option.png',
                            height: 24,
                          ),
                          itemBuilder: (BuildContext context) {
                            return <PopupMenuEntry>[
                              PopupMenuItem(
                                child: Text(Strings.en
                                    ? Strings.enAbout
                                    : Strings.cnAbout),
                                value: 0,
                              ),
                              PopupMenuDivider(
                                height: 1,
                              ),
                              PopupMenuItem(
                                child: Text(Strings.en
                                    ? Strings.enSignOut
                                    : Strings.cnSignOut),
                                value: 1,
                              ),
                            ];
                          }),
                    ),
                  ),
                  Opacity(
                    opacity: opacityTitle,
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                        children: [
                          TextSpan(
                            text: 'Hello, ',
                            style: TextStyle(
                              color: Colors.orange[300],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text:
                                FirebaseAuth.instance.currentUser.displayName ??
                                    '',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: opacityGuide,
                    child: InkWell(
                      onTap: opacityGuide != 1 || Strings.showTutorial
                          ? null
                          : () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  PageController _guideController =
                                      PageController(initialPage: 0);
                                  int guideDescriptionIndex = 0;
                                  return StatefulBuilder(
                                    builder: (context, setState) => Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Card(
                                        shape:
                                            roundedRectangleBorder(radius: 16),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Image.asset(
                                                  'images/header.png',
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 8,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      IconButton(
                                                        icon: Icon(
                                                          Icons.help,
                                                          size: 25,
                                                          color:
                                                              Colors.blueGrey,
                                                        ),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                          setState(() {
                                                            Ecosite.globalKey
                                                                .currentState
                                                                .startTutorial();
                                                          });
                                                        },
                                                      ),
                                                      Text(
                                                        Strings.en
                                                            ? Strings
                                                                .enGuideTitle
                                                            : Strings
                                                                .cnGuideTitle,
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Image.asset(
                                                          'images/exitScreen.png',
                                                          height: 30,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                Strings.en
                                                    ? Strings.enGuideSubtitle
                                                    : Strings.cnGuideSubtitle,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Padding(
                                                padding: EdgeInsets.all(8),
                                                child: PageView(
                                                  onPageChanged: (value) {
                                                    setState(() {
                                                      guideDescriptionIndex =
                                                          value;
                                                    });
                                                  },
                                                  controller: _guideController,
                                                  physics:
                                                      ClampingScrollPhysics(),
                                                  children: [
                                                    GuideCard(
                                                      imagePath:
                                                          'images/progress_bar_ecopoint.png',
                                                    ),
                                                    GuideCard(
                                                      imagePath:
                                                          'images/progress_bar_ecosupply.png',
                                                    ),
                                                    GuideCard(
                                                      imagePath:
                                                          'images/userProgress.png',
                                                      boxFit: BoxFit.fitWidth,
                                                    ),
                                                    GuideCard(
                                                      imagePath:
                                                          'images/ecosite.png',
                                                    ),
                                                    GuideCard(
                                                      imagePath:
                                                          'images/missionColour.png',
                                                    ),
                                                    GuideCard(
                                                      imagePath:
                                                          'images/adventureColour.png',
                                                    ),
                                                    GuideCard(
                                                      imagePath:
                                                          'images/progressColour.png',
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Card(
                                                  elevation: 10,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(16),
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Text(
                                                        Strings.enGuideDescription[
                                                            guideDescriptionIndex],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                      child: Image.asset(
                        'images/guideButton.png',
                        height: 28,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Ecosite(),
                  Adventure(),
                  Mission(),
                  Progress(),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: 70,
          margin: EdgeInsets.all(4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Opacity(
                  opacity: opacityNavBarEcosite,
                  child: InkWell(
                    onTap: opacityNavBarEcosite != 1 || Strings.showTutorial
                        ? null
                        : () {
                            setState(() {
                              _selectedPageIndex = 0;
                              _pageController.jumpToPage(_selectedPageIndex);
                            });
                          },
                    child: Card(
                      shape: roundedRectangleBorder(radius: 10),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'images/${_selectedPageIndex == 0 ? 'ecositeColour' : 'ecositeGray'}.png',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Opacity(
                  opacity: opacityNavBarAdventure,
                  child: InkWell(
                    onTap: opacityNavBarAdventure != 1 || Strings.showTutorial
                        ? null
                        : () {
                            setState(() {
                              _selectedPageIndex = 1;
                              _pageController.jumpToPage(_selectedPageIndex);
                            });
                          },
                    child: Card(
                      shape: roundedRectangleBorder(radius: 10),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'images/${_selectedPageIndex == 1 ? 'adventureColour' : 'adventureGray'}.png',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Opacity(
                  opacity: opacityNavBarMission,
                  child: InkWell(
                    onTap: opacityNavBarMission != 1 || Strings.showTutorial
                        ? null
                        : () {
                            setState(() {
                              _selectedPageIndex = 2;
                              _pageController.jumpToPage(_selectedPageIndex);
                            });
                          },
                    child: Card(
                      shape: roundedRectangleBorder(radius: 10),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'images/${_selectedPageIndex == 2 ? 'missionColour' : 'missionGray'}.png',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Opacity(
                  opacity: opacityNavBarProgress,
                  child: InkWell(
                    onTap: opacityNavBarProgress != 1 || Strings.showTutorial
                        ? null
                        : () {
                            setState(() {
                              _selectedPageIndex = 3;
                              _pageController.jumpToPage(_selectedPageIndex);
                            });
                          },
                    child: Card(
                      shape: roundedRectangleBorder(radius: 10),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'images/${_selectedPageIndex == 3 ? 'progressColour' : 'progressGray'}.png',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
