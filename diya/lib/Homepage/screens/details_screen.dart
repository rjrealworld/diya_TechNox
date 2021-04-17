import 'package:flutter/material.dart';
import 'package:diya/Homepage/constants.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  Duration _duration = new Duration();
  Duration _position = new Duration();
  AudioPlayer advancedPlayer;
  AudioCache audioCache;
  // int count = 0;
  int count1 = 0;
  int count2 = 0, count3 = 0, count4 = 0, count5 = 0;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);

    advancedPlayer.durationHandler = (d) => setState(() {
          _duration = d;
        });

    advancedPlayer.positionHandler = (p) => setState(() {
          _position = p;
        });
  }

  String localFilePath;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC7B8F5),
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .25,
            decoration: BoxDecoration(
              color: kBlueLightColor,
              image: DecorationImage(
                image: AssetImage("assets/images/meditation_bg.png"),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Meditation",
                      style: Theme.of(context)
                          .textTheme
                          .display1
                          .copyWith(fontWeight: FontWeight.w900),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: size.width * .6, // it just take 60% of total width
                      child: Text(
                        "Live happier and healthier by learning the fundamentals of meditation and mindfulness",
                      ),
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              new BoxShadow(
                                color: Colors.grey,
                                blurRadius: 15.0,
                              ),
                            ],
                          ),
                          child: Card(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 50.0,
                                      height: 50.0,
                                      child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            count1 = count1 + 1;
                                            print(count1);
                                          });

                                          if (count1 % 2 == 0) {
                                            audioCache.play('audio/Campfire.mp3');
                                            //print(count1);
                                            // count1 = 0;
                                          } else {
                                            advancedPlayer.pause();
                                          }
                                        },
                                        icon: _getIcon(count1),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "CampFire",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              new BoxShadow(
                                color: Colors.grey,
                                blurRadius: 15.0,
                              ),
                            ],
                          ),
                          child: Card(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 50.0,
                                      height: 50.0,
                                      child: IconButton(
                                        icon: _getIcon(count2),
                                        onPressed: () {
                                          setState(() {
                                            if (count2 % 2 == 0) {
                                              audioCache
                                                  .play('audio/Birds.mp3');
                                              // count = 0;

                                            } else {
                                              advancedPlayer.pause();
                                            }
                                          });
                                          count2 = count2 + 1;
                                        },
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Birds Chirping",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              new BoxShadow(
                                color: Colors.grey,
                                blurRadius: 15.0,
                              ),
                            ],
                          ),
                          child: Card(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 50.0,
                                      height: 50.0,
                                      child: IconButton(
                                        icon: _getIcon(count3),
                                        onPressed: () {
                                          setState(() {
                                            if (count3 % 2 == 0) {
                                              audioCache
                                                  .play('audio/Power Down.mp3');
                                              // count = 0;

                                            } else {
                                              advancedPlayer.pause();
                                            }
                                            count3 = count3 + 1;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Power Down",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              new BoxShadow(
                                color: Colors.grey,
                                blurRadius: 15.0,
                              ),
                            ],
                          ),
                          child: Card(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        width: 50.0,
                                        height: 50.0,
                                        child: IconButton(
                                          icon: _getIcon(count4),
                                          onPressed: () {
                                            setState(() {
                                              if (count4 % 2 == 0) {
                                                audioCache
                                                    .play('audio/audio1.mp3');
                                                // count = 0;

                                              } else {
                                                advancedPlayer.pause();
                                              }
                                              count4 = count4 + 1;
                                            });
                                          },
                                        )),
                                  ),
                                  Text(
                                    "ABC",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              new BoxShadow(
                                color: Colors.grey,
                                blurRadius: 15.0,
                              ),
                            ],
                          ),
                          child: Card(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        width: 50.0,
                                        height: 50.0,
                                        child: IconButton(
                                          icon: _getIcon(count5),
                                          onPressed: () {
                                            setState(() {
                                              if (count5 % 2 == 0) {
                                                audioCache
                                                    .play('audio/audio1.mp3');
                                                // count = 0;

                                              } else {
                                                advancedPlayer.pause();
                                              }
                                              count5 = count5 + 1;
                                            });
                                          },
                                        )),
                                  ),
                                  Text(
                                    "ABC",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
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
    );
  }
}

Widget _getIcon(int count) {
  if (count % 2 == 0) {
    return Icon(Icons.play_arrow);
  } else {
    return Icon(Icons.pause);
  }
}

class SeassionCard extends StatelessWidget {
  final int seassionNum;
  final bool isDone;
  final Function press;
  const SeassionCard({
    Key key,
    this.seassionNum,
    this.isDone = false,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: constraint.maxWidth / 2 -
              10, // constraint.maxWidth provide us the available with for this widget
          // padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: kShadowColor,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 42,
                      width: 43,
                      decoration: BoxDecoration(
                        color: isDone ? kBlueColor : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: kBlueColor),
                      ),
                      //child: _getIcon(),

                      //color: isDone ? Colors.white : kBlueColor,
                      // ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Session $seassionNum",
                      style: Theme.of(context).textTheme.subtitle,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
