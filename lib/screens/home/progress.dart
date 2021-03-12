import 'package:designedbyalla_ecotourism/components/progress_bar_item.dart';
import 'package:designedbyalla_ecotourism/components/rounded_button.dart';
import 'package:designedbyalla_ecotourism/constants.dart';
import 'package:designedbyalla_ecotourism/models/user_info.dart';
import 'package:designedbyalla_ecotourism/services/helper.dart';
import 'package:designedbyalla_ecotourism/strings.dart';
import 'package:flutter/material.dart';

class Progress extends StatefulWidget {
  @override
  _ProgressState createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  double _sliderValue = 0;
  UserInformation userInfo = UserInformation();
  int page = 0;
  PageController controller = PageController(initialPage: 0);

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
          //TEMPERATURE BAR
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

          //REST OF PROGRESS PAGE
          Expanded(
            child: Card(
              color: Color(0xFFEAECEF),
              elevation: 10,
              shape: roundedRectangleBorder(radius: 10),
              margin: EdgeInsets.all(12),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Card(
                      color: Color(0xFFEAECEF),
                      elevation: 5,
                      shape: roundedRectangleBorder(radius: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: RoundedButton(
                              title: Strings.en
                                  ? Strings.enAchievement
                                  : Strings.cnAchievement,
                              onPressed: () {
                                setState(() {
                                  page = 0;
                                  controller.jumpToPage(page);
                                });
                              },
                              color: page == 0
                                  ? Color.fromARGB(255, 89, 188, 203)
                                  : Color(0xFFEAECEF),
                              textColor:
                                  page == 0 ? Colors.white : Colors.black,
                              elevation: 0,
                              borderRadius: 10,
                            ),
                          ),
                          Expanded(
                            child: RoundedButton(
                              title: Strings.en
                                  ? Strings.enCheckIns
                                  : Strings.cnCheckIns,
                              onPressed: () {
                                setState(() {
                                  page = 1;
                                  controller.jumpToPage(page);
                                });
                              },
                              color: page == 1
                                  ? Color.fromARGB(255, 89, 188, 203)
                                  : Color(0xFFEAECEF),
                              textColor:
                                  page == 1 ? Colors.white : Colors.black,
                              elevation: 0,
                              borderRadius: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Expanded(
                      child: Card(
                        shape: roundedRectangleBorder(radius: 10),
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PageView(
                            controller: controller,
                            onPageChanged: (value) {
                              setState(() {
                                page = value;
                              });
                            },
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                color: Colors.green,
                              ),
                              Container(
                                height: 100,
                                width: 100,
                                color: Colors.red,
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
