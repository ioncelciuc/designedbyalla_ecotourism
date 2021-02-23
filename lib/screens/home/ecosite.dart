import 'package:designedbyalla_ecotourism/components/progress_bar_item.dart';
import 'package:designedbyalla_ecotourism/components/rounded_button.dart';
import 'package:designedbyalla_ecotourism/constants.dart';
import 'package:designedbyalla_ecotourism/models/user_info.dart';
import 'package:designedbyalla_ecotourism/services/helper.dart';
import 'package:designedbyalla_ecotourism/strings.dart';
import 'package:flutter/material.dart';

class Ecosite extends StatefulWidget {
  @override
  _EcositeState createState() => _EcositeState();
}

class _EcositeState extends State<Ecosite> with AutomaticKeepAliveClientMixin {
  UserInformation userInfo = UserInformation();
  double _sliderValue = 0;

  void initialize() async {
    UserInformation existingUserInfo =
        await Helper.instace.getCurrentUserInfo();
    setState(() {
      userInfo = existingUserInfo;
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
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
                      onTap: () {},
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
                    Expanded(
                      child: Card(
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
                                    thumbColor: Colors.grey,
                                    thumbShape: RoundSliderThumbShape(),
                                    activeTrackColor: _sliderValue > 4
                                        ? Colors.red
                                        : Colors.lightBlue[300],
                                    inactiveTrackColor: _sliderValue > 4
                                        ? Colors.red[100]
                                        : Colors.lightBlue[100],
                                  ),
                                  child: Slider(
                                    divisions: 6,
                                    min: 0,
                                    max: 7,
                                    value: _sliderValue,
                                    onChanged: (value) {
                                      setState(() {
                                        _sliderValue = value;
                                        print(_sliderValue);
                                      });
                                    },
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
                    InkWell(
                      onTap: () {},
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
                          Image.asset(
                            'images/avatar_${userInfo.avatar ?? '1'}.png',
                            height: 50,
                            width: 50,
                          ),
                          Expanded(
                            child: Card(
                              elevation: 5,
                              shape: roundedRectangleBorder(radius: 10),
                              child: Padding(
                                padding: EdgeInsets.all(4),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: Text(
                                          Strings.en
                                              ? Strings.enEcosite[0]
                                              : Strings.cnEcosite[0],
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            print('hi');
                                          },
                                          child: Image.asset(
                                            'images/next.png',
                                            height: 30,
                                          ),
                                        ),
                                      ],
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
                        children: [
                          Container(
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
