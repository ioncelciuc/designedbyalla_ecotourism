import 'package:designedbyalla_ecotourism/components/marker.dart';
import 'package:designedbyalla_ecotourism/components/progress_bar_item.dart';
import 'package:designedbyalla_ecotourism/constants.dart';
import 'package:designedbyalla_ecotourism/models/user_info.dart';
import 'package:designedbyalla_ecotourism/screens/adventure/adventure_screen.dart';
import 'package:designedbyalla_ecotourism/services/helper.dart';
import 'package:designedbyalla_ecotourism/strings.dart';
import 'package:flutter/material.dart';

double width = 0;
double height = 0;

class Adventure extends StatefulWidget {
  @override
  AdventureState createState() => AdventureState();
}

class AdventureState extends State<Adventure> {
  UserInformation userInfo = UserInformation();
  double _sliderValue = 0;
  int selectedMarker = 0;

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

  void selectMarkerIndex(int index) {
    setState(() {
      selectedMarker = index;
    });
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

          //REST OF ADVENTURE
          Expanded(
            child: Card(
              elevation: 5,
              shape: roundedRectangleBorder(radius: 10),
              margin: EdgeInsets.all(12),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      Strings.en
                          ? Strings.enChinaEcotourism
                          : Strings.cnChinaEcotourism,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      margin: EdgeInsets.all(8),
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          ChinaImage(),
                          GestureDetector(
                            child: Image.asset('images/china_map.png'),
                            onTap: () {
                              setState(() {
                                selectedMarker = 0;
                              });
                            },
                          ),
                          Marker(
                            markerIndex: 1,
                            text: 'Mt. Qoolongma, Tibet',
                            width: width,
                            bottomDivision: 2.2,
                            leftDivision: 12,
                          ),
                          Marker(
                            markerIndex: 4,
                            text: 'Hulunbuir, Inner Mongolia',
                            width: width,
                            bottomDivision: 1.48,
                            leftDivision: 1.43,
                          ),
                          Marker(
                            markerIndex: 5,
                            text: 'Yangcheng Wetlands, Jiangsu',
                            width: width,
                            bottomDivision: 2.8,
                            leftDivision: 1.3,
                          ),
                          Marker(
                            markerIndex: 2,
                            text: 'Tiger Leaping Gorge, Shangri La',
                            width: width,
                            bottomDivision: 4.6,
                            leftDivision: 2.6,
                          ),
                          Marker(
                            text: 'Gaoyao Field, Guizhou',
                            markerIndex: 3,
                            width: width,
                            bottomDivision: 5.7,
                            leftDivision: 1.85,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Card(
                        color: Color(0xFFEAECEF),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Text(
                                    Strings.en
                                        ? Strings
                                            .enAdventureInfoBox[selectedMarker]
                                        : Strings
                                            .cnAdventureInfoBox[selectedMarker],
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, AdventureScreen.id);
                                      },
                                      child: Text(
                                        'TAKE ME THERE',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.orange[300],
                                      ),
                                    ),
                                  ),
                                ],
                              )
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

class ChinaImage extends StatefulWidget {
  @override
  _ChinaImageState createState() => _ChinaImageState();
}

class _ChinaImageState extends State<ChinaImage> {
  GlobalKey _key = GlobalKey();

  double getWidth() {
    final RenderBox renderBox = _key.currentContext.findRenderObject();
    return renderBox.size.width;
  }

  double getHeight() {
    final RenderBox renderBox = _key.currentContext.findRenderObject();
    return renderBox.size.height;
  }

  void setData() {
    setState(() {
      width = getWidth();
      height = getHeight();
    });
    print("WIDTH ADVENTURE: $width");
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
            'images/china_map.png',
          ),
        ),
      ),
    );
  }
}
