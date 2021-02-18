import 'package:designedbyalla_ecotourism/constants.dart';
import 'package:designedbyalla_ecotourism/screens/choose_avatar.dart';
import 'package:designedbyalla_ecotourism/screens/steps_page/step_page.dart';
import 'package:designedbyalla_ecotourism/strings.dart';
import 'package:flutter/material.dart';

class StepsPage extends StatefulWidget {
  static const String id = 'StepsPage';

  @override
  _StepsPageState createState() => _StepsPageState();
}

class _StepsPageState extends State<StepsPage> {
  final int _numPages = 4;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: isActive ? Colors.teal[300] : Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Image.asset(
                    'images/logo.png',
                    height: 70,
                  ),
                ),
                Expanded(
                  child: Card(
                    shape: roundedRectangleBorder(radius: 10),
                    elevation: 10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: PageView(
                            physics: ClampingScrollPhysics(),
                            controller: _pageController,
                            onPageChanged: (int page) {
                              setState(() {
                                _currentPage = page;
                              });
                            },
                            children: [
                              StepPage(
                                title: Strings.en
                                    ? Strings.enStepPage1Title
                                    : Strings.cnStepPage1Title,
                                imgUrl: 'images/step_page_1.png',
                                text: Strings.en
                                    ? Strings.enStepPage1Text
                                    : Strings.cnStepPage1Text,
                              ),
                              StepPage(
                                title: Strings.en
                                    ? Strings.enStepPage2Title
                                    : Strings.cnStepPage2Title,
                                imgUrl: 'images/step_page_2.png',
                                text: Strings.en
                                    ? Strings.enStepPage2Text
                                    : Strings.cnStepPage2Text,
                              ),
                              StepPage(
                                title: Strings.en
                                    ? Strings.enStepPage3Title
                                    : Strings.cnStepPage3Title,
                                imgUrl: 'images/step_page_3.png',
                                text: Strings.en
                                    ? Strings.enStepPage3Text
                                    : Strings.cnStepPage3Text,
                              ),
                              StepPage(
                                title: Strings.en
                                    ? Strings.enStepPage4Title
                                    : Strings.cnStepPage4Title,
                                imgUrl: 'images/step_page_4.png',
                                text: Strings.en
                                    ? Strings.enStepPage4Text
                                    : Strings.cnStepPage4Text,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                  child: Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _buildPageIndicator(),
                      ),
                      MaterialButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, ChooseAvatar.id);
                        },
                        child: Text(
                          _currentPage == 3
                              ? (Strings.en ? Strings.enNext : Strings.cnNext)
                              : (Strings.en ? Strings.enSkip : Strings.cnSkip),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
