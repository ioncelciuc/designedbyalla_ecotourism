import 'package:designedbyalla_ecotourism/components/problem_button.dart';
import 'package:designedbyalla_ecotourism/components/progress_bar_item.dart';
import 'package:designedbyalla_ecotourism/components/rounded_button.dart';
import 'package:designedbyalla_ecotourism/constants.dart';
import 'package:designedbyalla_ecotourism/models/user_info.dart';
import 'package:designedbyalla_ecotourism/screens/home/home.dart';
import 'package:designedbyalla_ecotourism/screens/return_page.dart';
import 'package:designedbyalla_ecotourism/services/helper.dart';
import 'package:designedbyalla_ecotourism/strings.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

double height = 0;
double width = 0;

class Ecosite extends StatefulWidget {
  static final GlobalKey<EcositeState> globalKey = GlobalKey();

  Ecosite() : super(key: globalKey);

  @override
  EcositeState createState() => EcositeState();
}

class EcositeState extends State<Ecosite> with AutomaticKeepAliveClientMixin {
  UserInformation userInfo = UserInformation();
  double _sliderValue = 0;
  int tutorialIndex = 0;
  int infoBoxIndex = 0;
  int fixButton = 0;

  void initialize() async {
    UserInformation existingUserInfo =
        await Helper.instace.getCurrentUserInfo();
    setState(() {
      userInfo = existingUserInfo;
      _sliderValue = double.parse(userInfo.temperature.toString());
    });
    if (!Strings.showTutorial) {
      setOpacity(
        problemButton1: userInfo.problem1 ? 0.5 : 0,
        problemButton2: userInfo.problem2 ? 0.5 : 0,
        problemButton3: userInfo.problem3 ? 0.5 : 0,
        problemButton4: userInfo.problem4 ? 0.5 : 0,
        problemButton5: userInfo.problem5 ? 0.5 : 0,
      );
    }
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    initialize();
  }

  int problemIndex;
  int problemTextIndex;

  void showEcosupplyDialog() {
    PageController controller = PageController(initialPage: 0);
    List<Widget> widgetList = List<Widget>();
    for (int i = 0; i < Strings.ecosupplyImage.length; i++) {
      widgetList.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 150,
              child: Card(
                elevation: 5,
                shape: roundedRectangleBorder(radius: 10),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Image.asset(Strings.ecosupplyImage[i]),
                ),
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: Card(
                shape: roundedRectangleBorder(radius: 10),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Text(
                      Strings.en
                          ? Strings.enEcosupplyText[i]
                          : Strings.cnEcosupplyText[i],
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
    showDialog(
      context: context,
      builder: (BuildContext context) => Material(
        color: Color.fromARGB(255, 89, 188, 203),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'images/exitScreen.png',
                      height: 40,
                    ),
                  ),
                ],
              ),
              Image.asset('images/logo_no_name.png', height: 70),
              SizedBox(height: 16),
              Expanded(
                child: Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 8),
                        Text(
                          Strings.en
                              ? Strings.enChooseEcosupply
                              : Strings.cnChooseEcosupply,
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16),
                        Expanded(
                          child: PageView(
                            children: widgetList,
                            controller: controller,
                          ),
                        ),
                        SizedBox(height: 8),
                        InkWell(
                          onTap: () async {
                            bool solvesProblem = false;
                            switch (problemIndex) {
                              case 1:
                                if (controller.page.toInt() == 0 ||
                                    controller.page.toInt() == 1)
                                  solvesProblem = true;
                                userInfo.problem1 = false;
                                break;
                              case 2:
                                if (controller.page.toInt() == 2 ||
                                    controller.page.toInt() == 3)
                                  solvesProblem = true;
                                userInfo.problem2 = false;
                                break;
                              case 3:
                                if (controller.page.toInt() == 4 ||
                                    controller.page.toInt() == 5)
                                  solvesProblem = true;
                                userInfo.problem3 = false;
                                break;
                              case 4:
                                if (controller.page.toInt() == 6 ||
                                    controller.page.toInt() == 7)
                                  solvesProblem = true;
                                userInfo.problem4 = false;
                                break;
                              case 5:
                                if (controller.page.toInt() == 8 ||
                                    controller.page.toInt() == 9)
                                  solvesProblem = true;
                                userInfo.problem5 = false;
                                break;
                            }
                            if (solvesProblem) {
                              await Helper.instace.updateUserInfo(userInfo);
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => Material(
                                  child: Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Image.asset('images/logo_no_name.png',
                                            height: 70),
                                        SizedBox(height: 8),
                                        Expanded(
                                          child: Container(
                                            child: Image.asset(
                                              'images/ecotip_problem_$problemIndex.png',
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        InkWell(
                                          onTap: () {
                                            setOpacity(
                                              image: 1,
                                              problemButton1:
                                                  userInfo.problem1 ? 1 : 0,
                                              problemButton2:
                                                  userInfo.problem2 ? 1 : 0,
                                              problemButton3:
                                                  userInfo.problem3 ? 1 : 0,
                                              problemButton4:
                                                  userInfo.problem4 ? 1 : 0,
                                              problemButton5:
                                                  userInfo.problem5 ? 1 : 0,
                                            );
                                            setState(() {
                                              problemIndex = null;
                                              fixButton = 0;
                                            });
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  Material(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(16),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      Image.asset(
                                                        'images/logo.png',
                                                        height: 70,
                                                      ),
                                                      SizedBox(height: 16),
                                                      Expanded(
                                                        child: Card(
                                                          elevation: 10,
                                                          shape:
                                                              roundedRectangleBorder(
                                                                  radius: 30),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(16),
                                                            child: Column(
                                                              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                              children: [
                                                                Text(
                                                                  Strings.en
                                                                      ? Strings
                                                                          .enOnGoodPath
                                                                      : Strings
                                                                          .cnOnGoodPath,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          24),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    child: Image
                                                                        .asset(
                                                                            'images/ecopoints.png'),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  '+20 ${Strings.en ? Strings.enEcopoints : Strings.cnEcopoints}',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        32,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                            .orange[
                                                                        300],
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                    height: 16),
                                                                Text(
                                                                  Strings.en
                                                                      ? Strings
                                                                          .enReturnPageCongrats2
                                                                      : Strings
                                                                          .cnReturnPageCongrats2,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          17),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 64),
                                                        child: RoundedButton(
                                                          title: Strings.en
                                                              ? Strings.enClaim
                                                              : Strings.cnClaim,
                                                          textColor:
                                                              Colors.black,
                                                          onPressed: () async {
                                                            setState(() {
                                                              userInfo.ecopoints =
                                                                  userInfo.ecopoints +
                                                                      20;
                                                            });
                                                            await Helper.instace
                                                                .addEcopoints(
                                                                    20);
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          child: Image.asset(
                                            'images/okay.png',
                                            height: 40,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => Material(
                                  color: Color.fromARGB(255, 89, 188, 203),
                                  child: Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Image.asset('images/logo_no_name.png',
                                            height: 70),
                                        SizedBox(height: 16),
                                        Expanded(
                                          child: Card(
                                            elevation: 5,
                                            shape: roundedRectangleBorder(
                                                radius: 10),
                                            child: Padding(
                                              padding: const EdgeInsets.all(16),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    Strings.en
                                                        ? Strings.enWrongItem
                                                        : Strings.cnWrongItem,
                                                    style: TextStyle(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  Card(
                                                    color: Colors.orange,
                                                    elevation: 0,
                                                    shape:
                                                        roundedRectangleBorder(
                                                            radius: 10),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(32),
                                                      child: Text(
                                                        Strings.en
                                                            ? Strings
                                                                .enItemNotApplicable
                                                            : Strings
                                                                .cnItemNotApplicable,
                                                        style: TextStyle(
                                                            fontSize: 20),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Image.asset(
                                                      'images/okay.png',
                                                      height: 50,
                                                    ),
                                                  ),
                                                ],
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
                          },
                          child: Image.asset(
                            'images/claim.png',
                            height: 50,
                          ),
                        ),
                      ],
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

  void tryToResolveProblem() {
    if (problemTextIndex == 0) {
      setState(() {
        problemTextIndex++;
        fixButton = problemIndex;
        nextButtonOpacity = 0;
      });
      setOpacity(
        image: 0.5,
        problemButton1: problemIndex == 1 ? 1 : (userInfo.problem1 ? 0.5 : 0),
        problemButton2: problemIndex == 2 ? 1 : (userInfo.problem2 ? 0.5 : 0),
        problemButton3: problemIndex == 3 ? 1 : (userInfo.problem3 ? 0.5 : 0),
        problemButton4: problemIndex == 4 ? 1 : (userInfo.problem4 ? 0.5 : 0),
        problemButton5: problemIndex == 5 ? 1 : (userInfo.problem5 ? 0.5 : 0),
      );
    }
  }

  void setProblemIndex(int index) {
    setState(() {
      problemIndex = index;
      nextButtonOpacity = 1;
      problemTextIndex = 0;
      fixButton = 0;
    });
  }

  double opacityEcopoints = 1;
  double opacityTemperature = 1;
  double opacityEcosupply = 1;
  double opacityImage = 1;
  double opacityProblemButton1 = 1;
  double opacityProblemButton2 = 1;
  double opacityProblemButton3 = 1;
  double opacityProblemButton4 = 1;
  double opacityProblemButton5 = 1;
  double nextButtonOpacity = 1;

  double opacityArrowGuide = 0;
  double opacityArrowEcopoints = 0;
  double opacityArrowEcosupply = 0;
  double opacityArrowTemperature = 0;
  double opacityArrowInfoBox = 0;
  double opacityArrowImage = 0;
  double opacityArrowProblem = 0;
  double opacityArrowEcosite = 0;
  double opacityArrowAdventure = 0;
  double opacityArrowMission = 0;
  double opacityArrowprogress = 0;

  void setOpacity({
    double ecopoints,
    double temperature,
    double ecosupply,
    double image,
    double problemButton1,
    double problemButton2,
    double problemButton3,
    double problemButton4,
    double problemButton5,
  }) {
    setState(() {
      opacityEcopoints = ecopoints ?? opacityEcopoints;
      opacityTemperature = temperature ?? opacityTemperature;
      opacityEcosupply = ecosupply ?? opacityEcosupply;
      opacityImage = image ?? opacityImage;
      opacityProblemButton1 = problemButton1 ?? opacityProblemButton1;
      opacityProblemButton2 = problemButton2 ?? opacityProblemButton2;
      opacityProblemButton3 = problemButton3 ?? opacityProblemButton3;
      opacityProblemButton4 = problemButton4 ?? opacityProblemButton4;
      opacityProblemButton5 = problemButton5 ?? opacityProblemButton5;
    });
  }

  void startTutorial() {
    setState(() {
      problemIndex = null;
      problemTextIndex = null;
      tutorialIndex = 0;
      nextButtonOpacity = 1;
      fixButton = 0;
      Strings.showTutorial = true;
      setOpacity(
        temperature: 0.5,
        ecopoints: 0.5,
        ecosupply: 0.5,
        image: 0.5,
        problemButton1: 0.5,
        problemButton2: 0.5,
        problemButton3: 0.5,
        problemButton4: 0.5,
        problemButton5: 0.5,
      );
      print('STARTED!');
    });
  }

  void tutorial(int ecositeIndex) async {
    var ancestralState = context.findAncestorStateOfType<HomeState>();
    switch (ecositeIndex) {
      case 0:
        //intro
        break;

      case 1:
        //guide button
        setState(() {
          opacityArrowGuide = 1;
        });
        ancestralState.setOpacity(
          settings: 0.5,
          title: 0.5,
          guide: 1,
          ecosite: 0.5,
          adventure: 0.5,
          mission: 0.5,
          progress: 0.5,
        );
        setOpacity(
          ecopoints: 0.5,
          temperature: 0.5,
          ecosupply: 0.5,
          image: 0.5,
          problemButton1: 0.5,
          problemButton2: 0.5,
          problemButton3: 0.5,
          problemButton4: 0.5,
          problemButton5: 0.5,
        );
        break;

      case 2:
        //ecopoints
        setState(() {
          opacityArrowGuide = 0;
          opacityArrowEcopoints = 1;
        });
        ancestralState.setOpacity(
          guide: 0.5,
        );
        setOpacity(
          ecopoints: 1,
        );
        break;

      case 3:
        //ecosupply
        setState(() {
          opacityArrowEcopoints = 0;
          opacityArrowEcosupply = 1;
        });
        setOpacity(
          ecopoints: 0.5,
          ecosupply: 1,
        );
        break;

      case 4:
        //temperature
        setState(() {
          opacityArrowEcosupply = 0;
          opacityArrowTemperature = 1;
        });
        setOpacity(
          ecosupply: 0.5,
          temperature: 1,
        );
        break;

      case 5:
        //info box
        setState(() {
          opacityArrowTemperature = 0;
          opacityArrowInfoBox = 1;
        });
        setOpacity(
          temperature: 0.5,
        );
        break;

      case 6:
        //image
        setState(() {
          opacityArrowInfoBox = 0;
          opacityArrowImage = 1;
        });
        setOpacity(
          image: 1,
        );
        break;

      case 7:
        //problem button
        setState(() {
          opacityArrowImage = 0;
          opacityArrowProblem = 1;
        });
        setOpacity(
          image: 0.5,
          problemButton1: 1,
        );
        break;

      case 8:
        //ecosite
        setState(() {
          opacityArrowProblem = 0;
          opacityArrowEcosite = 1;
        });
        ancestralState.setOpacity(
          ecosite: 1,
        );
        setOpacity(
          problemButton1: 0.5,
        );
        break;

      case 9:
        //adventure
        setState(() {
          opacityArrowEcosite = 0;
          opacityArrowAdventure = 1;
        });
        ancestralState.setOpacity(
          ecosite: 0.5,
          adventure: 1,
        );
        break;

      case 10:
        //mission
        setState(() {
          opacityArrowAdventure = 0;
          opacityArrowMission = 1;
        });
        ancestralState.setOpacity(
          adventure: 0.5,
          mission: 1,
        );
        break;

      case 11:
        //progress
        setState(() {
          opacityArrowMission = 0;
          opacityArrowprogress = 1;
        });
        ancestralState.setOpacity(
          mission: 0.5,
          progress: 1,
        );
        break;

      default:
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        await sharedPreferences.setBool('TUTORIAL', false);
        tutorialIndex = 0;
        setState(() {
          infoBoxIndex = 0;
          fixButton = 0;
          Strings.showTutorial = false;
          this.tutorialIndex = 0;
          opacityArrowGuide = 0;
          opacityArrowEcopoints = 0;
          opacityArrowEcosupply = 0;
          opacityArrowTemperature = 0;
          opacityArrowInfoBox = 0;
          opacityArrowImage = 0;
          opacityArrowProblem = 0;
          opacityArrowEcosite = 0;
          opacityArrowAdventure = 0;
          opacityArrowMission = 0;
          opacityArrowprogress = 0;
        });
        ancestralState.setOpacity(
          settings: 1,
          title: 1,
          guide: 1,
          ecosite: 1,
          adventure: 1,
          mission: 1,
          progress: 1,
        );
        setOpacity(
          ecopoints: 1,
          temperature: 1,
          ecosupply: 1,
          image: 1,
          problemButton1: userInfo.problem1 ? 0.5 : 0,
          problemButton2: userInfo.problem2 ? 0.5 : 0,
          problemButton3: userInfo.problem3 ? 0.5 : 0,
          problemButton4: userInfo.problem4 ? 0.5 : 0,
          problemButton5: userInfo.problem5 ? 0.5 : 0,
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: opacityEcopoints != 1 || Strings.showTutorial
                              ? null
                              : () {
                                  print('ecopoints');
                                },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Opacity(
                                opacity: opacityEcopoints,
                                child: Container(
                                  width: 60,
                                  height: 90,
                                  child: Card(
                                    shape: roundedRectangleBorder(radius: 20)
                                        .copyWith(
                                            side: BorderSide(
                                                color: Colors.grey[300])),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(
                                            'images/progress_bar_ecopoint.png',
                                          ),
                                          Text(
                                            '${userInfo.ecopoints}',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Opacity(
                                opacity: opacityArrowTemperature,
                                child: Image.asset(
                                  'images/arrow_right.png',
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Opacity(
                                opacity: opacityTemperature,
                                child: Card(
                                  shape: roundedRectangleBorder(radius: 15)
                                      .copyWith(
                                          side: BorderSide(
                                              color: Colors.grey[300])),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 15, right: 15, top: 8),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                ProgressBarItem(
                                                  text: '0.5°C',
                                                  body: Image.asset(
                                                    'images/progress_bar_sun_sea.png',
                                                    height: 16,
                                                    width: 16,
                                                  ),
                                                ),
                                                buildProgressBarItemWithContainer(
                                                    1,
                                                    2,
                                                    Colors.lightBlue[300]),
                                                buildProgressBarItemWithContainer(
                                                    2,
                                                    3,
                                                    Colors.lightBlue[300]),
                                                buildProgressBarItemWithContainer(
                                                    3, 4, Colors.lightBlue[300],
                                                    text: '1.5°C'),
                                                buildProgressBarItemWithContainer(
                                                    4, 5, Colors.red),
                                                buildProgressBarItemWithContainer(
                                                    5, 6, Colors.red),
                                                ProgressBarItem(
                                                  text: '2.5°C',
                                                  body: Image.asset(
                                                    'images/progress_bar_desert.png',
                                                    height: 16,
                                                    width: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          SliderTheme(
                                            data: SliderTheme.of(context)
                                                .copyWith(
                                              trackHeight: 13,
                                              tickMarkShape: SliderTickMarkShape
                                                  .noTickMark,
                                              thumbShape:
                                                  RoundSliderThumbShape(),
                                              disabledActiveTrackColor:
                                                  _sliderValue > 4
                                                      ? Colors.red
                                                      : Colors.lightBlue[300],
                                              disabledInactiveTrackColor:
                                                  _sliderValue > 4
                                                      ? Colors.red[100]
                                                      : Colors.lightBlue[100],
                                            ),
                                            child: Slider(
                                              divisions: 6,
                                              min: 0,
                                              max: 7,
                                              value: _sliderValue,
                                              onChanged: null,
                                            ),
                                          ),
                                          Text(
                                            _sliderValue > 4 ? 'WARNING!' : '',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Opacity(
                                    opacity: opacityArrowEcopoints,
                                    child: Image.asset(
                                      'images/arrow_left.png',
                                      height: 50,
                                      width: 50,
                                    ),
                                  ),
                                  Opacity(
                                    opacity: opacityArrowEcosupply,
                                    child: Image.asset(
                                      'images/arrow_right.png',
                                      height: 50,
                                      width: 50,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Opacity(
                          opacity: opacityEcosupply,
                          child: InkWell(
                            onTap: opacityEcosupply != 1 || Strings.showTutorial
                                ? null
                                : () {
                                    print('ecosupply');
                                  },
                            child: Container(
                              width: 60,
                              height: 90,
                              child: Card(
                                shape: roundedRectangleBorder(radius: 20)
                                    .copyWith(
                                        side: BorderSide(
                                            color: Colors.grey[300])),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        'images/progress_bar_ecosupply.png',
                                      ),
                                      Text(
                                        '${userInfo.ecosupply}',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
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
              ),
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 5,
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          height: 120,
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Stack(
                                children: [
                                  Image.asset(
                                    'images/avatar_${userInfo.avatar ?? '1'}.png',
                                    height: 50,
                                    width: 50,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Opacity(
                                        opacity: opacityArrowImage,
                                        child: Image.asset(
                                          'images/arrow_down.png',
                                          height: 50,
                                          width: 50,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Card(
                                  elevation: 5,
                                  shape: roundedRectangleBorder(radius: 10),
                                  child: Padding(
                                    padding: EdgeInsets.all(4),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: SingleChildScrollView(
                                            child: Text(
                                              problemIndex == null
                                                  ? (Strings.showTutorial &&
                                                          tutorialIndex <
                                                              Strings.enTutorial
                                                                  .length
                                                      ? (Strings.en
                                                          ? Strings.enTutorial[
                                                              tutorialIndex]
                                                          : Strings.cnTutorial[
                                                              tutorialIndex])
                                                      : (Strings.en
                                                          ? Strings.enInfoBox[
                                                              infoBoxIndex]
                                                          : Strings.cnInfoBox[
                                                              infoBoxIndex]))
                                                  : (problemIndex == 1
                                                      ? (Strings.en
                                                          ? Strings.enProblem1[
                                                              problemTextIndex]
                                                          : Strings.cnProblem1[
                                                              problemTextIndex])
                                                      : problemIndex == 2
                                                          ? (Strings.en
                                                              ? Strings
                                                                      .enProblem2[
                                                                  problemTextIndex]
                                                              : Strings
                                                                      .cnProblem2[
                                                                  problemTextIndex])
                                                          : problemIndex == 3
                                                              ? (Strings.en
                                                                  ? Strings
                                                                          .enProblem3[
                                                                      problemTextIndex]
                                                                  : Strings
                                                                          .cnProblem3[
                                                                      problemTextIndex])
                                                              : problemIndex ==
                                                                      4
                                                                  ? (Strings.en
                                                                      ? Strings
                                                                              .enProblem4[
                                                                          problemTextIndex]
                                                                      : Strings
                                                                              .cnProblem4[
                                                                          problemTextIndex])
                                                                  : (Strings.en
                                                                      ? Strings
                                                                              .enProblem5[
                                                                          problemTextIndex]
                                                                      : Strings
                                                                              .cnProblem5[
                                                                          problemTextIndex])),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Strings.showTutorial
                                                  ? InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          tutorialIndex = 12;
                                                        });
                                                        tutorial(tutorialIndex);
                                                      },
                                                      child: Image.asset(
                                                        'images/skip.png',
                                                        height: 30,
                                                      ),
                                                    )
                                                  : Container(),
                                              InkWell(
                                                onTap: nextButtonOpacity != 1
                                                    ? null
                                                    : () {
                                                        if (Strings
                                                            .showTutorial) {
                                                          setState(() {
                                                            tutorialIndex++;
                                                          });
                                                          tutorial(
                                                              tutorialIndex);
                                                        } else if (infoBoxIndex <
                                                            Strings.enInfoBox
                                                                    .length -
                                                                1) {
                                                          setState(() {
                                                            infoBoxIndex++;
                                                            if (infoBoxIndex ==
                                                                Strings.enInfoBox
                                                                        .length -
                                                                    1) {
                                                              nextButtonOpacity =
                                                                  0;
                                                              setOpacity(
                                                                problemButton1:
                                                                    userInfo.problem1
                                                                        ? 1
                                                                        : 0,
                                                                problemButton2:
                                                                    userInfo.problem2
                                                                        ? 1
                                                                        : 0,
                                                                problemButton3:
                                                                    userInfo.problem3
                                                                        ? 1
                                                                        : 0,
                                                                problemButton4:
                                                                    userInfo.problem4
                                                                        ? 1
                                                                        : 0,
                                                                problemButton5:
                                                                    userInfo.problem5
                                                                        ? 1
                                                                        : 0,
                                                              );
                                                            }
                                                          });
                                                        } else {
                                                          tryToResolveProblem();
                                                        }
                                                      },
                                                child: Opacity(
                                                  opacity: nextButtonOpacity,
                                                  child: Image.asset(
                                                    'images/next.png',
                                                    height: 30,
                                                  ),
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
                            ],
                          ),
                        ),
                        Expanded(
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  Opacity(
                                    opacity: opacityImage,
                                    child: EcositeImage(),
                                  ),
                                  Opacity(
                                    opacity: opacityArrowInfoBox,
                                    child: Image.asset(
                                      'images/arrow_up.png',
                                      height: 50,
                                      width: 50,
                                    ),
                                  )
                                ],
                              ),
                              ProblemButton(
                                opacity: opacityProblemButton2,
                                width: width,
                                bottomDivision: 7,
                                leftDivision: 4,
                                buttonIndex: 2,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: width / 7.6),
                                    child: Opacity(
                                      opacity: opacityArrowProblem,
                                      child: Image.asset(
                                        'images/arrow_down.png',
                                        height: 50,
                                        width: 50,
                                      ),
                                    ),
                                  ),
                                  ProblemButton(
                                    opacity: opacityProblemButton1,
                                    width: width,
                                    bottomDivision: 3,
                                    leftDivision: 6,
                                    buttonIndex: 1,
                                  ),
                                ],
                              ),
                              ProblemButton(
                                opacity: opacityProblemButton3,
                                width: width,
                                bottomDivision: 2.5,
                                leftDivision: 1.7,
                                buttonIndex: 3,
                              ),
                              ProblemButton(
                                opacity: opacityProblemButton4,
                                width: width,
                                bottomDivision: 3.5,
                                leftDivision: 1.4,
                                buttonIndex: 4,
                              ),
                              ProblemButton(
                                opacity: opacityProblemButton5,
                                width: width,
                                bottomDivision: 7.5,
                                leftDivision: 1.4,
                                buttonIndex: 5,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Opacity(
                    opacity: opacityArrowGuide,
                    child: Image.asset(
                      'images/arrow_up.png',
                      height: 50,
                      width: 50,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Opacity(
                  opacity: opacityArrowEcosite,
                  child: Image.asset(
                    'images/arrow_down.png',
                    height: 50,
                    width: 50,
                  ),
                ),
                Opacity(
                  opacity: opacityArrowAdventure,
                  child: Image.asset(
                    'images/arrow_down.png',
                    height: 50,
                    width: 50,
                  ),
                ),
                Opacity(
                  opacity: opacityArrowMission,
                  child: Image.asset(
                    'images/arrow_down.png',
                    height: 50,
                    width: 50,
                  ),
                ),
                Opacity(
                  opacity: opacityArrowprogress,
                  child: Image.asset(
                    'images/arrow_down.png',
                    height: 50,
                    width: 50,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  ProgressBarItem buildProgressBarItemWithContainer(
      int min, int max, Color color,
      {String text}) {
    return ProgressBarItem(
      text: text,
      body: Container(
        height: 20,
        width: 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color:
              min < _sliderValue && _sliderValue < max ? color : Colors.white,
          border: Border.all(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
    );
  }
}

class EcositeImage extends StatefulWidget {
  @override
  _EcositeImageState createState() => _EcositeImageState();
}

class _EcositeImageState extends State<EcositeImage> {
  GlobalKey _key = GlobalKey();

  double getHeight() {
    final RenderBox renderBox = _key.currentContext.findRenderObject();
    final size = renderBox.size;
    return size.height;
  }

  double getWidth() {
    final RenderBox renderBox = _key.currentContext.findRenderObject();
    final size = renderBox.size;
    return size.width;
  }

  void setData() {
    setState(() {
      height = getHeight();
      width = getWidth();
    });
    print('HEIGHT: $height\nWIDTH: $width\n');
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => setData());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _key,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          alignment: Alignment.bottomCenter,
          image: AssetImage(
            'images/ecosite.png',
          ),
        ),
      ),
    );
  }
}
