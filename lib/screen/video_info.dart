import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'colors.dart' as color;

class VideoInfo extends StatefulWidget {
  final QueryDocumentSnapshot? subject;
  const VideoInfo({
    Key? key,
    @required this.subject,
  }) : super(key: key);

  @override
  _VideoInfoState createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List videoInfo = [];
  List video = [];
  bool _playarea = false;
  bool _isPlaying = false;
  bool _disposed = false;
  int _isPlayingIndex = -1;
  VideoPlayerController? _controller;
  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/videoinfo.json")
        .then((value) {
      setState(() {
        videoInfo = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  void dispose() {
    _disposed = true;
    _controller?.pause();
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String subjectName = widget.subject!['name'];
    String teacher = widget.subject!['teacher'];
    int num = widget.subject!['files'].length;
    videoInfo = widget.subject!['files'];
    var final_min = 0, min = 0, sec = 0;

    for (final e in videoInfo) {
      final_min = e['time']![0] + final_min;
      sec = e['time']![1] + sec;
    }
    min = (sec / 60).ceil();
    final_min = min + final_min;

    return Scaffold(
        body: Container(
      decoration: _playarea == false
          ? BoxDecoration(
              gradient: LinearGradient(
              colors: [
                color.AppColor.gradientFirst.withOpacity(0.9),
                color.AppColor.gradientSecond
              ],
              begin: const FractionalOffset(0.0, 0.4),
              end: Alignment.topRight,
            ))
          : BoxDecoration(
              color: color.AppColor.gradientSecond,
            ),
      child: Column(
        children: [
          _playarea == false
              ? Container(
                  padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(Icons.arrow_back_ios,
                                size: 20,
                                color: color.AppColor.secondPageIconColor),
                          ),
                          Expanded(child: Container()),
                          Icon(Icons.info_outline,
                              size: 20,
                              color: color.AppColor.secondPageIconColor),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        subjectName,
                        style: TextStyle(
                          fontSize: 25,
                          color: color.AppColor.secondPageTitleColor,
                        ),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: [
                                    color.AppColor
                                        .secondPageContainerGradient1stColor,
                                    color.AppColor
                                        .secondPageContainerGradient2ndColor,
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.timer,
                                  size: 20,
                                  color: color.AppColor.secondPageIconColor,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  final_min.toString() + " mins",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color:
                                          color.AppColor.secondPageIconColor),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            // width: 240,
                            // height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: [
                                    color.AppColor
                                        .secondPageContainerGradient1stColor,
                                    color.AppColor
                                        .secondPageContainerGradient2ndColor,
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.handyman_outlined,
                                  size: 20,
                                  color: color.AppColor.secondPageIconColor,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  teacher,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color:
                                          color.AppColor.secondPageIconColor),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              : Container(
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        padding:
                            const EdgeInsets.only(top: 50, left: 30, right: 30),
                        child: Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Icon(Icons.arrow_back_ios,
                                    size: 20,
                                    color:
                                        color.AppColor.secondPageTopIconColor)),
                            Expanded(child: Container()),
                            Icon(Icons.info_outline,
                                size: 20,
                                color: color.AppColor.secondPageTopIconColor)
                          ],
                        ),
                      ),
                      _playView(context),
                      _controlView(context),
                    ],
                  ),
                ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(70))),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text("Week 1: Basics",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: color.AppColor.circuitsColor)),
                    Expanded(child: Container()),
                    Row(
                      children: [
                        Icon(Icons.format_list_numbered,
                            size: 30, color: color.AppColor.loopColor),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          num.toString() + " videos",
                          style: TextStyle(
                            fontSize: 15,
                            color: color.AppColor.setsColor,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(child: _listView()),
              ],
            ),
          ))
        ],
      ),
    ));
  }

  String convertTwo(int value) {
    return value < 10 ? "0$value" : "$value";
  }

  Widget _controlView(BuildContext context) {
    final noMute = (_controller?.value?.volume ?? 0) > 0;
    final duration = _duration?.inSeconds ?? 0;
    final head = _position?.inSeconds ?? 0;
    final remained = max(0, duration - head);
    final mins = convertTwo(remained ~/ 60.0);
    final secs = convertTwo(remained % 60);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.red[700],
              inactiveTrackColor: Colors.red[100],
              trackShape: RoundedRectSliderTrackShape(),
              trackHeight: 2.0,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
              thumbColor: Colors.redAccent,
              overlayColor: Colors.red.withAlpha(32),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
              tickMarkShape: RoundSliderTickMarkShape(),
              activeTickMarkColor: Colors.red[700],
              inactiveTickMarkColor: Colors.red[100],
              valueIndicatorShape: PaddleSliderValueIndicatorShape(),
              valueIndicatorColor: Colors.redAccent,
              valueIndicatorTextStyle: TextStyle(
                color: Colors.white,
              ),
            ),
            child: Slider(
              value: max(0, min(_progress * 100, 100)),
              min: 0,
              max: 100,
              divisions: 100,
              label: _position?.toString().split(".")[0],
              onChanged: (value) {
                setState(() {
                  _progress = value * 0.01;
                });
              },
              onChangeStart: (value) {
                _controller?.pause();
              },
              onChangeEnd: (value) {
                final duration = _controller?.value?.duration;
                if (duration != null) {
                  var newValue = max(0, min(value, 99)) * 0.01;
                  var millis = (duration.inMilliseconds * newValue).toInt();
                  _controller?.seekTo(Duration(milliseconds: millis));
                  _controller?.play();
                }
              },
            )),
        Container(
            height: 40,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(bottom: 5),
            color: color.AppColor.gradientSecond,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Container(
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, boxShadow: [
                        BoxShadow(
                          offset: Offset(0.0, 0.0),
                          blurRadius: 4.0,
                          color: Color.fromARGB(50, 0, 0, 0),
                        )
                      ]),
                      child: Icon(
                        noMute ? Icons.volume_up : Icons.volume_off,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onTap: () {
                    if (noMute) {
                      _controller?.setVolume(0);
                    } else {
                      _controller?.setVolume(1.0);
                    }
                    setState(() {});
                  },
                ),
                FlatButton(
                    onPressed: () async {
                      final index = _isPlayingIndex - 1;
                      if (index >= 0 && videoInfo.length >= 0) {
                        _initializeVideo(index);
                      } else {
                        Get.snackbar("Video List", "",
                            snackPosition: SnackPosition.BOTTOM,
                            icon: Icon(
                              Icons.face,
                              size: 30,
                              color: Colors.white,
                            ),
                            backgroundColor: color.AppColor.gradientSecond,
                            colorText: Colors.white,
                            messageText: Text(
                              "No videos ahead !",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ));
                      }
                    },
                    child: Icon(
                      Icons.fast_rewind,
                      size: 36,
                      color: Colors.white,
                    )),
                FlatButton(
                    onPressed: () async {
                      if (_isPlaying) {
                        setState(() {
                          _isPlaying = false;
                        });
                        _controller?.pause();
                      } else {
                        setState(() {
                          _isPlaying = true;
                        });
                        _controller?.play();
                      }
                    },
                    child: Icon(
                      _isPlaying ? Icons.pause : Icons.play_arrow,
                      size: 36,
                      color: Colors.white,
                    )),
                FlatButton(
                    onPressed: () async {
                      final index = _isPlayingIndex + 1;
                      if (index <= videoInfo.length - 1) {
                        _initializeVideo(index);
                      } else {
                        Get.snackbar("Video List", "",
                            snackPosition: SnackPosition.BOTTOM,
                            icon: Icon(
                              Icons.face,
                              size: 30,
                              color: Colors.white,
                            ),
                            backgroundColor: color.AppColor.gradientSecond,
                            colorText: Colors.white,
                            messageText: Text(
                              "You have finished watching all the videos. Congrats !",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ));
                      }
                    },
                    child: Icon(
                      Icons.fast_forward,
                      size: 36,
                      color: Colors.white,
                    )),
                Text(
                  "$mins:$secs",
                  style: TextStyle(color: Colors.white, shadows: <Shadow>[
                    Shadow(
                      offset: Offset(0.0, 1.0),
                      blurRadius: 4.0,
                      color: Color.fromARGB(150, 0, 0, 0),
                    )
                  ]),
                )
              ],
            ))
      ],
    );
  }

  Widget _playView(BuildContext context) {
    final controller = _controller;
    if (controller != null && controller.value.isInitialized) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: VideoPlayer(controller),
      );
    } else {
      return AspectRatio(
          aspectRatio: 16 / 9,
          child: Center(
              child: Text(
            "Preparing...",
            style: TextStyle(fontSize: 20, color: Colors.white60),
          )));
    }
  }

  var _onUpdateControllerTime;
  Duration? _duration;
  Duration? _position;
  var _progress = 0.0;
  void _onControllerUpdate() async {
    if (_disposed) {
      return;
    }
    _onUpdateControllerTime = 0;
    final now = DateTime.now().millisecondsSinceEpoch;
    if (_onUpdateControllerTime > now) {
      return;
    }
    _onUpdateControllerTime = now + 500;
    final controller = _controller;
    if (controller == null) {
      return;
    }
    if (!controller.value.isInitialized) {
      return;
    }

    // if (_duration == null) {
    _duration = _controller?.value.duration;
    // }

    var duration = _duration;
    if (duration == null) return;

    var position = await controller.position;
    _position = position;
    final playing = controller.value.isPlaying;
    if (playing) {
      // handle progress indicator
      if (_disposed) return;
      setState(() {
        _progress = position!.inMilliseconds.ceilToDouble() /
            duration.inMilliseconds.ceilToDouble();
      });
    }
    _isPlaying = playing;
  }

  _initializeVideo(int index) async {
    final controller =
        VideoPlayerController.network(videoInfo[index]["videoUrl"]);
    final old = _controller;
    _controller = controller;
    if (old != null) {
      old.removeListener(_onControllerUpdate);
      old.pause();
    }
    setState(() {});
    controller
      ..initialize().then((_) {
        old?.dispose();
        _isPlayingIndex = index;
        controller.addListener(_onControllerUpdate);
        controller.play();
        setState(() {});
      });
  }

  _onTapVideo(int index) {
    _initializeVideo(index);
  }

  _listView() {
    return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        itemCount: videoInfo.length,
        itemBuilder: (_, int index) {
          return GestureDetector(
            onTap: () {
              _onTapVideo(index);
              setState(() {
                if (_playarea == false) {
                  _playarea = true;
                }
              });
            },
            child: _buildCard(index),
          );
        });
  }

  _buildCard(int index) {
    return Container(
      height: 135,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(videoInfo[index]["thumbnail"]),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      videoInfo[index]["title"],
                      // overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 3),
                      child: Text(
                        videoInfo[index]['time'][0].toString() +
                            ":" +
                            ((videoInfo[index]['time'][1] < 10)
                                ? '0' + videoInfo[index]['time'][1].toString()
                                : videoInfo[index]['time'][1].toString()),
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 18,
          ),
          Row(
            children: [
              Container(
                width: 80,
                height: 20,
                decoration: BoxDecoration(
                    color: Color(0xFFeaeefc),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    "30s break",
                    style: TextStyle(color: Color(0xFF839fed)),
                  ),
                ),
              ),
              Row(
                children: [
                  for (int i = 0; i < 70; i++)
                    i.isEven
                        ? Container(
                            width: 3,
                            height: 1,
                            decoration: BoxDecoration(
                                color: Color(0xFF839fed),
                                borderRadius: BorderRadius.circular(2)),
                          )
                        : Container(
                            width: 3,
                            height: 1,
                            color: Colors.white,
                          )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
