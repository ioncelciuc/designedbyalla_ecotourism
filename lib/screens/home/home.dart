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
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedPageIndex = 0;
  final _pages = [
    Ecosite(),
    Adventure(),
    Mission(),
    Progress(),
  ];
  PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
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
                    child: PopupMenuButton(
                        onSelected: (value) async {
                          if (value == 0) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) => Material(
                                      color: Colors.transparent,
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 32),
                                          child: Stack(
                                            alignment: Alignment.topRight,
                                            children: [
                                              Image.asset(
                                                'images/infoBox.png',
                                                alignment: Alignment.center,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
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
                  RichText(
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
                          text: FirebaseAuth.instance.currentUser.displayName ??
                              '',
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      'images/guideButton.png',
                      height: 28,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(),
                children: _pages,
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
                child: InkWell(
                  onTap: () {
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
              Expanded(
                child: InkWell(
                  onTap: () {
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
              Expanded(
                child: InkWell(
                  onTap: () {
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
              Expanded(
                child: InkWell(
                  onTap: () {
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
            ],
          ),
        ),
      ),
    );
  }
}
