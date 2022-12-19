import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flipper/model/cardmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

//Extends state with SingleTinker provider state mixin
class MobilePage extends StatefulWidget {
  const MobilePage({super.key});

  @override
  State<MobilePage> createState() => _MobilePageState();
}

class _MobilePageState extends State<MobilePage> with TickerProviderStateMixin {
  //set up controllers
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
    "This holiday season, let’s make it a point to cherish what’s truly important in our lives: cookies.",
    "I told Santa you were good this year and sent him a link to your Pinterest board. Merry Christmas to you!",
    "This Christmas, may your family be functional and all your batteries be included.",
    "Merry Christmas! I put so much thought into your gift that now it's too late to get it.",
    "Please note: Christmas is canceled. Apparently, you told Santa you have been good this year … he died laughing.",
    "Is it just me, or does Santa look younger every year?",
    "Eat. Drink. Be Merry. Have a wonderful Christmas!",
    "Christmas is the only time of year in which one can sit in front of a dead tree and eat candy out of socks. Enjoy!",
    "May the Christmas Season bring only happiness and joy to you and your family.",
    "The gift of love. The gift of peace. The gift of happiness. May all these be yours at Christmas.",
    "Wishing you a season full of light and laughter for you and your family.",
    "Best wishes for a joyous Christmas filled with love, happiness and prosperity!",
    "May your family have a holiday season that is full of wonderful surprises, treats and nonstop laughter.",
    "Our family wishes you love, joy and peace … today, tomorrow and always.",
    "I hope the magic of Christmas fills every corner of your heart and home with joy — now and always.",
    "May your holidays sparkle with joy and laughter.",
  ];
  var images = [
    "images/c1.jpeg",
    "images/c2.jpeg",
    "images/c3.jpeg",
    "images/c4.jpeg",
    "images/c5.jpeg",
    "images/c6.jpeg",
    "images/c7.jpeg",
    "images/c8.jpeg",
    "images/c9.jpeg",
    "images/c10.jpeg",
    "images/c11.jpeg",
    "images/c12.jpeg",
    "images/c13.jpeg",
    "images/c14.jpeg",
    "images/c15.jpeg",
    "images/c16.jpeg",
    "images/tree2.png",
    'images/tree.png',
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
        title: Text(
          "Seasons Greetings",
          style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.black)),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                // color: Colors.teal,
                child: Lottie.network(
                    "https://assets4.lottiefiles.com/packages/lf20_Qu68m487iG.json",
                    width: 300.w,
                    height: 100.h),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Transform(
                alignment: FractionalOffset.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.0015)
                  ..rotateY(pi * _animation.value),
                child: Card(
                  elevation: 5.0,
                  child: _animation.value <= 0.5
                      ? Container(
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: Column(
                            children: [
                              Image.asset("images/tree.png"),
                              Lottie.network(
                                "https://assets4.lottiefiles.com/packages/lf20_ojYQlpe8pq.json",
                              ),
                              Center(
                                child: Text(
                                  "Merry Christmas",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 20.sp, color: Colors.red)),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: MediaQuery.of(context).size.height * 0.5,
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
                                  Image.asset(
                                    randomImages,
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
                )),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                var url =
                    "https://www.chosic.com/wp-content/uploads/2020/06/United_States_Marine_Band_-_We_Wish_You_a_Merry_Christmas.mp3";
                print('play');

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
//TODO: build for web; mobile display, replace long messages with short messages and 10 more messages and images