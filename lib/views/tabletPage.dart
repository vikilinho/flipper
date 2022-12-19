// ignore_for_file: file_names

import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flipper/model/cardmodel.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TabletPage extends StatefulWidget {
  const TabletPage({super.key});

  @override
  State<TabletPage> createState() => _TabletPageState();
}

class _TabletPageState extends State<TabletPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  final audioPlayer = AudioPlayer();
  AnimationStatus _status = AnimationStatus.dismissed;
  var randomMessage =
      "Best wishes for a joyous Christmas filled with love, happiness and prosperity!";
  var randomImages = "images/c2.jpeg";
  // ignore: prefer_final_fields
  List<CardModel> _cards = [
    CardModel(
      "This holiday season, let’s make it a point to cherish what’s truly important in our lives: cookies",
      "images/c1.jpeg",
    ),
    CardModel(
        "Best wishes for a joyous Christmas filled with love, happiness and prosperity!",
        "images/c2.jpeg"),
    CardModel(
      "Wishing you a season full of light and laughter for you and your family.",
      "images/c3.jpeg",
    ),
    CardModel(
      "The gift of love. The gift of peace. The gift of happiness. May all these be yours at Christmas.",
      "images/c4.jpeg",
    ),
    CardModel(
        "Merry Christmas! I put so much thought into your gift that now it's too late to get it.",
        "images/c5.jpeg"),
    CardModel("Is it just me, or does Santa look younger every year?",
        "images/c6.jpeg"),
    CardModel(
        "Eat. Drink. Be Merry. Have a wonderful Christmas!", "images/c7.jpeg"),
    CardModel(
        "Christmas is the only time of year in which one can sit in front of a dead tree and eat candy out of socks. Enjoy!",
        "images/c8.jpeg"),
    CardModel(
        "May the Christmas Season bring only happiness and joy to you and your family.",
        "images/c9.jpeg"),
    CardModel(
        "The gift of love. The gift of peace. The gift of happiness. May all these be yours at Christmas.",
        "images/c10.jpeg"),
    CardModel(
        "May all that is beautiful, meaningful and brings you joy be yours this holiday season and throughout the coming year!",
        "images/c11.jpeg"),
    CardModel(
        "Merry Christmas! Wishing you all the happiness your holiday can hold!",
        "images/c12.jpeg"),
    CardModel(
        "May your holidays sparkle with joy and laughter.", "images/c13.jpeg"),
    CardModel(
        "I hope the magic of Christmas fills every corner of your heart and home with joy — now and always.",
        "images/c14.jpeg"),
    CardModel(
        "Our family wishes you love, joy and peace … today, tomorrow and always.",
        "images/c15.jpeg"),
    CardModel(
        "May your family have a holiday season that is full of wonderful surprises, treats and nonstop laughter.",
        "images/c16.jpeg"),
  ];
  var messages = [
    "Merry Christmas! I put so much thought into your gift that now it's too late to get it.",
    "Eat. Drink. Be Merry. Have a wonderful Christmas!",
    "May the Christmas Season bring only happiness and joy to you and your family.",
    "The gift of love. The gift of peace. The gift of happiness. May all these be yours at Christmas.",
    "Wishing you a season full of light and laughter for you and your family.",
    "Best wishes for a joyous Christmas filled with love, happiness and prosperity!",
    "May your family have a holiday season that is full of wonderful surprises, treats and nonstop laughter.",
    "Our family wishes you love, joy and peace … today, tomorrow and always.",
    "I hope the magic of Christmas fills every corner of your heart and home with joy — now and always.",
    "May your holidays sparkle with joy and laughter.",
    "Wishing you a Christmas that's merry and bright!",
    "I hope you have a safe and relaxing holiday season.",
    "I hope your holiday season is full of peace, joy and happiness.",
    "Merry Christmas with lots of love.",
    "I hope your Christmas is filled with joy this year!",
    "Happy Holidays! I hope all of your Christmas wishes come true.",
    "Jesus is the reason for the season. Merry Christmas!",
    "May God fill your Yuletide season and all your days with immeasurable prosperity and joy! Merry Christmas!",
    "May you have the gift of faith, the blessing of hope and the peace of His love at Christmas and always!",
    "Merry Christmas! I hope you receive one blessing after another this coming year.",
    "May the Lord grant you and all your loved ones peace, joy and goodwill.",
    "Wishing you a season that’s merry and bright with the light of God’s love.",
    "May God’s blessings be yours this Christmas.",
    "May the true spirit of Christmas shine in your heart and light your path.",
    "May God bless your life with love and joy this holiday season."
  ];
  var images = [
    "images/c4.jpeg",
    "images/m1.jpeg",
    "images/m2.jpeg",
    "images/m3.jpeg",
    "images/c11.jpeg",
    "images/c12.jpeg",
    "images/d15.jpeg",
    "images/d17.jpeg",
    "images/d18.jpeg",
    "images/d19.jpeg",
    "images/d20.jpeg",
    "images/d21.jpeg",
    "images/d22.jpeg",
    "images/d14.jpeg",
    "images/d13.jpeg",
    "images/d12.jpeg",
    "images/d11.jpeg",
    "images/d7.jpeg",
    "images/d6.jpeg",
    "images/d10.jpeg",
    "images/d2.jpeg",
    "images/d1.jpeg",
    "images/d9.jpeg",
    "images/tree2.png",
    "images/tree.png",
  ];

  @override
  void initState() {
    //initialise the animation controller

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = Tween(end: 1.0, begin: 0.0).animate(_controller)
      ..addListener(() {
        setState(() {
// Get the item at the random index
        });
      })
      ..addStatusListener((status) {
        _status = status;
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 100,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Seasons Greetings",
            style: GoogleFonts.poppins(
                textStyle: TextStyle(color: Colors.black, fontSize: 20.sp)),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Center(
            //   child: Container(
            //     // color: Colors.teal,
            //     child: Lottie.network(
            //         "https://assets4.lottiefiles.com/packages/lf20_Qu68m487iG.json",
            //         width: 300.w,
            //         height: 100.h),
            //   ),
            // ),
            SizedBox(
              height: 10.h,
            ),
            Transform(
                alignment: FractionalOffset.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.0015)
                  ..rotateY(pi * _animation.value),
                child: Center(
                  child: Card(
                    elevation: 5.0,
                    child: _animation.value <= 0.5
                        ? Container(
                            color: Colors.white,
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.75,
                            child: Column(
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      "images/d1.jpeg",
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.6,
                                    ),
                                  ),
                                ),
                                // Lottie.network(
                                //   "https://assets4.lottiefiles.com/packages/lf20_ojYQlpe8pq.json",
                                // ),

                                Center(
                                  child: Text(
                                    "Merry Christmas",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontSize: 20.sp,
                                            color: Colors.red)),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.75,
                            color: Colors.white,
                            child: Center(
                              child: Transform(
                                alignment: FractionalOffset.center,
                                transform: Matrix4.identity()
                                  ..setEntry(2, 1, 0.0013)
                                  ..rotateY(pi * _animation.value),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      flex: 2,
                                      child: Image.asset(
                                        randomImages,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.65,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.65,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        randomMessage,
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.03,
                                                color: Colors.red)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                var url =
                    "https://www.chosic.com/wp-content/uploads/2020/06/United_States_Marine_Band_-_We_Wish_You_a_Merry_Christmas.mp3";
                print('play');
                print(" the lenght is ${messages.length.toString()}");
                print(" the lenght is ${images.length.toString()}");

                if (_status == AnimationStatus.dismissed) {
                  _controller.forward();
                  await audioPlayer.play(UrlSource(url));
                } else {
                  _controller.reverse();
                  await audioPlayer.pause();
                }
                setState(() {
                  var rng = new Random();

                  // Generate a random index
                  // int index = rng.nextInt(_cards.length);
                  // int sindex = rng.nextInt(messages.length);

                  // Get the item at the random index
                  // randomImages = _cards[index].image;
                  // // randomMessage = _cards[index].text;

                  randomMessage = (messages..shuffle()).first;

                  randomImages = (images..shuffle()).first;
                });
              },
              child: const Text("Flip Card"),
            )
          ],
        ),
      ),
    );
  }
}
