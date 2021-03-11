import 'package:designedbyalla_ecotourism/components/progress_bar_item.dart';
import 'package:designedbyalla_ecotourism/components/reward_tile.dart';
import 'package:designedbyalla_ecotourism/constants.dart';
import 'package:designedbyalla_ecotourism/models/user_info.dart';
import 'package:designedbyalla_ecotourism/services/helper.dart';
import 'package:designedbyalla_ecotourism/strings.dart';
import 'package:flutter/material.dart';

class Mission extends StatefulWidget {
  @override
  _MissionState createState() => _MissionState();
}

class _MissionState extends State<Mission> {
  PageController pageController = PageController(initialPage: 0);
  int textIndex = 0;
  double _sliderValue = 0;
  UserInformation userInfo = UserInformation();

  List<Widget> missions() {
    List<Widget> missions = [];
    for (int i = 0; i < 4; i++) {
      missions.add(
        Card(
          elevation: 5,
          shape: roundedRectangleBorder(radius: 10),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios_rounded),
                  onPressed: () {
                    pageController.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.decelerate,
                    );
                  },
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //SizedBox(height: 4),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'images/mission${i + 1}.png',
                        height: 98,
                      ),
                    ),
                    Text(
                      Strings.en ? Strings.enDonate : Strings.cnDonate,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Strings.missionEcopoints[textIndex].toString(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 8),
                        Image.asset(
                          'images/progress_bar_ecopoint.png',
                          height: 25,
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios_rounded),
                  onPressed: () {
                    pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.decelerate,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    }
    return missions;
  }

  void donateEcopoints() async {
    if (userInfo.missionsCompleted[textIndex] == true) {
      showDialog(
        context: context,
        builder: (context) => Material(
          color: Color.fromARGB(255, 89, 188, 203),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 64),
            child: Column(
              children: [
                Image.asset('images/logo_no_name.png'),
                SizedBox(height: 16),
                Expanded(
                  child: Card(
                    elevation: 10,
                    shape: roundedRectangleBorder(radius: 20),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 32, left: 16, right: 16, bottom: 16),
                      child: Column(
                        children: [
                          Text(
                            Strings.en
                                ? Strings.enMissionAlreadyDonated[0]
                                : Strings.cnMissionAlreadyDonated[0],
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange[300]),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 16),
                          Text(
                            Strings.en
                                ? Strings.enMissionAlreadyDonated[1]
                                : Strings.cnMissionAlreadyDonated[1],
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 32),
                          Text(
                            Strings.en
                                ? Strings.enMissionAlreadyDonated[2]
                                : Strings.cnMissionAlreadyDonated[2],
                            textAlign: TextAlign.center,
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Image.asset('images/okay.png', height: 30),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    } else if (Strings.missionEcopoints[textIndex] > userInfo.ecopoints) {
      showDialog(
        context: context,
        builder: (context) => Material(
          color: Color.fromARGB(255, 89, 188, 203),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 64),
            child: Column(
              children: [
                Image.asset('images/logo_no_name.png'),
                SizedBox(height: 16),
                Expanded(
                  child: Card(
                    elevation: 10,
                    shape: roundedRectangleBorder(radius: 20),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 32, left: 16, right: 16, bottom: 16),
                      child: Column(
                        children: [
                          Text(
                            Strings.en
                                ? Strings.enMissionNotEnoughEcopoints[0]
                                : Strings.cnMissionNotEnoughEcopoints[0],
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange[300]),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 16),
                          Text(
                            Strings.en
                                ? Strings.enMissionNotEnoughEcopoints[1]
                                : Strings.cnMissionNotEnoughEcopoints[1],
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 32),
                          Text(
                            Strings.en
                                ? Strings.enMissionNotEnoughEcopoints[2]
                                : Strings.cnMissionNotEnoughEcopoints[2],
                            textAlign: TextAlign.center,
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Image.asset('images/okay.png', height: 30),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    } else {
      List<Widget> rewardList = [];
      switch (textIndex) {
        case 0:
          userInfo.ecosuppliesAvailable[1] = true;
          userInfo.ecosupply = userInfo.ecosupply + 1;
          rewardList.add(RewardTile(
            image: Strings.ecosupplyImage[1],
            title: Strings.en
                ? Strings.enEcosupplyEarned
                : Strings.cnEcosupplyEarned,
            subtitle: Strings.en
                ? Strings.enEcosupplyName[1]
                : Strings.cnEcosupplyName[1],
          ));
          break;
        case 1:
          userInfo.ecosuppliesAvailable[5] = true;
          userInfo.ecosupply = userInfo.ecosupply + 1;
          rewardList.add(RewardTile(
            image: Strings.ecosupplyImage[5],
            title: Strings.en
                ? Strings.enEcosupplyEarned
                : Strings.cnEcosupplyEarned,
            subtitle: Strings.en
                ? Strings.enEcosupplyName[5]
                : Strings.cnEcosupplyName[5],
          ));
          break;
        case 2:
          userInfo.ecosuppliesAvailable[9] = true;
          userInfo.ecosupply = userInfo.ecosupply + 1;
          rewardList.add(RewardTile(
            image: Strings.ecosupplyImage[9],
            title: Strings.en
                ? Strings.enEcosupplyEarned
                : Strings.cnEcosupplyEarned,
            subtitle: Strings.en
                ? Strings.enEcosupplyName[9]
                : Strings.cnEcosupplyName[9],
          ));
          break;
        case 3:
          userInfo.ecosuppliesAvailable[3] = true;
          userInfo.ecosuppliesAvailable[7] = true;
          userInfo.ecosupply = userInfo.ecosupply + 2;
          rewardList.add(RewardTile(
            image: Strings.ecosupplyImage[3],
            title: Strings.en
                ? Strings.enEcosupplyEarned
                : Strings.cnEcosupplyEarned,
            subtitle: Strings.en
                ? Strings.enEcosupplyName[3]
                : Strings.cnEcosupplyName[3],
          ));
          rewardList.add(RewardTile(
            image: Strings.ecosupplyImage[7],
            title: Strings.en
                ? Strings.enEcosupplyEarned
                : Strings.cnEcosupplyEarned,
            subtitle: Strings.en
                ? Strings.enEcosupplyName[7]
                : Strings.cnEcosupplyName[7],
          ));
          break;
      }
      setState(() {
        userInfo.ecopoints =
            userInfo.ecopoints - Strings.missionEcopoints[textIndex];
        userInfo.temperature = userInfo.temperature > 0
            ? userInfo.temperature - 1
            : userInfo.temperature;
        _sliderValue = userInfo.temperature.toDouble();
      });
      rewardList.add(RewardTile(
        image: 'images/progress_bar_sun_sea.png',
        subtitle: Strings.en
            ? Strings.enTemperatureReduced
            : Strings.cnTemperatureReduced,
      ));
      userInfo.missionsCompleted[textIndex] = true;
      await Helper.instace.updateUserInfo(userInfo);
      showDialog(
        context: context,
        builder: (context) => Material(
          color: Color.fromARGB(255, 89, 188, 203),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 64),
            child: Column(
              children: [
                Image.asset('images/logo_no_name.png'),
                SizedBox(height: 16),
                Expanded(
                  child: Card(
                    elevation: 10,
                    shape: roundedRectangleBorder(radius: 20),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 32, left: 16, right: 16, bottom: 16),
                      child: ListView(
                        children: [
                          Text(
                            Strings.en
                                ? Strings.enGreatNews
                                : Strings.cnGreatNews,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange[300],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 8),
                          Text(
                            '${Strings.en ? Strings.enEcopointsDonated : Strings.cnEcopointsDonated}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 89, 188, 203),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 32),
                          SingleChildScrollView(
                            child: Text(
                              Strings.en
                                  ? Strings.enMissionDonated[textIndex]
                                  : Strings.cnMissionDonated[textIndex],
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => Material(
                                  color: Color.fromARGB(255, 89, 188, 203),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 64),
                                    child: Column(
                                      children: [
                                        Image.asset('images/logo_no_name.png'),
                                        SizedBox(height: 16),
                                        Expanded(
                                          child: Card(
                                            elevation: 10,
                                            shape: roundedRectangleBorder(
                                                radius: 20),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 32,
                                                  left: 16,
                                                  right: 16,
                                                  bottom: 16),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    Strings.en
                                                        ? Strings.enOnGoodPath
                                                        : Strings.cnOnGoodPath,
                                                    style: TextStyle(
                                                      fontSize: 30,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.orange[300],
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  SizedBox(height: 16),
                                                  Expanded(
                                                    child: Column(
                                                      children: rewardList,
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) =>
                                                            Material(
                                                          child: Column(
                                                            children: [
                                                              SizedBox(
                                                                  height: 16),
                                                              Image.asset(
                                                                  'images/logo.png',
                                                                  height: 50),
                                                              SizedBox(
                                                                  height: 16),
                                                              Expanded(
                                                                child:
                                                                    Image.asset(
                                                                  'images/mission${textIndex + 1}ecotips.png',
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: 16),
                                                              InkWell(
                                                                onTap: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                  Navigator.pop(
                                                                      context);
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Image.asset(
                                                                    'images/okay.png',
                                                                    height: 30),
                                                              ),
                                                              SizedBox(
                                                                  height: 16),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: Image.asset(
                                                      'images/great.png',
                                                      height: 30,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: Image.asset('images/great.png', height: 30),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
  }

  void initialize() async {
    UserInformation existingUser = await Helper.instace.getCurrentUserInfo();
    setState(() {
      userInfo = existingUser;
      _sliderValue = userInfo.temperature.ceilToDouble();
    });
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //Temperature bar

          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
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
                      onTap: () {
                        print('ecopoints');
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 90,
                            child: Card(
                              shape: roundedRectangleBorder(radius: 20)
                                  .copyWith(
                                      side:
                                          BorderSide(color: Colors.grey[300])),
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
                                      '${userInfo.ecopoints ?? 0}',
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
                        ],
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Card(
                            shape: roundedRectangleBorder(radius: 15).copyWith(
                                side: BorderSide(color: Colors.grey[300])),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 15, right: 15, top: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                              1, 2, Colors.lightBlue[300]),
                                          buildProgressBarItemWithContainer(
                                              2, 3, Colors.lightBlue[300]),
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
                                      data: SliderTheme.of(context).copyWith(
                                        trackHeight: 13,
                                        tickMarkShape:
                                            SliderTickMarkShape.noTickMark,
                                        thumbShape: RoundSliderThumbShape(),
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
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        print('ecosupply');
                      },
                      child: Container(
                        width: 60,
                        height: 90,
                        child: Card(
                          shape: roundedRectangleBorder(radius: 20).copyWith(
                              side: BorderSide(color: Colors.grey[300])),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  'images/progress_bar_ecosupply.png',
                                ),
                                Text(
                                  '${userInfo.ecosupply ?? 0}',
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
                  ],
                ),
              ),
            ),
          ),

          //Rest of mission
          Expanded(
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              elevation: 5,
              shape: roundedRectangleBorder(radius: 10),
              child: Column(
                children: [
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      shape: roundedRectangleBorder(radius: 10),
                      color: Colors.orange[300],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            Strings.en
                                ? Strings.enContributeInRealWorldMission
                                : Strings.cnContributeInRealWorldMission,
                            style: TextStyle(
                              //  fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 160,
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    child: PageView(
                      controller: pageController,
                      onPageChanged: (value) {
                        setState(() {
                          textIndex = value;
                          print(value);
                        });
                      },
                      children: missions(),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      margin: EdgeInsets.all(8),
                      elevation: 5,
                      color: Color(0xFFEAECEF),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView(
                          children: [
                            Text(
                              Strings.en
                                  ? Strings.enMissionTitle[textIndex]
                                  : Strings.cnMissionTitle[textIndex],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                            ),
                            Text(''),
                            Text(
                              Strings.en
                                  ? Strings.enMissionSubtitle[textIndex]
                                  : Strings.cnMissionSubtitle[textIndex],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${Strings.en ? Strings.enRequirement : Strings.cnRequirement}: ${Strings.missionEcopoints[textIndex]} ${Strings.en ? Strings.enEcopoints : Strings.cnEcopoints}',
                            ),
                            Text(''), //empty space
                            Text(
                              Strings.en
                                  ? Strings.enProject
                                  : Strings.cnProject,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              Strings.en
                                  ? Strings.enMissionText[textIndex]
                                  : Strings.cnMissionText[textIndex],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      donateEcopoints();
                    },
                    child: Image.asset(
                      'images/donate.png',
                      height: 30,
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ],
      ),
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
