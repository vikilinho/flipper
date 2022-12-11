import 'dart:math';

import 'package:flutter/material.dart';

//Extends state with SingleTinker provider state mixin
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  //set up controllers
  late AnimationController _controller;
  late Animation _animation;
  AnimationStatus _status = AnimationStatus.dismissed;
  var randomMessage = "";
  var messages = [
    "This holiday season, let’s make it a point to cherish what’s truly important in our lives: cookies.",
    "I told Santa you were good this year and sent him a link to your Pinterest board. Merry Christmas to you!"
        "This Christmas, may your family be functional and all your batteries be included.",
    "Merry Christmas! I put so much thought into your gift that now it's too late to get it."
        "Please note: Christmas is canceled. Apparently, you told Santa you have been good this year … he died laughing.",
    "Is it just me, or does Santa look younger every year?",
    "Eat. Drink. Be Merry. Have a wonderful Christmas!",
    "Christmas is the only time of year in which one can sit in front of a dead tree and eat candy out of socks. Enjoy!",
    "May the Christmas Season bring only happiness and joy to you and your family.",
    "The gift of love. The gift of peace. The gift of happiness. May all these be yours at Christmas.",
    "Wishing you a season full of light and laughter for you and your family.",
    "Best wishes for a joyous Christmas filled with love, happiness and prosperity!",
  ];
  var rng = Random();

  @override
  void initState() {
    //initialise the animation controller

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = Tween(end: 1.0, begin: 0.0).animate(_controller)
      ..addListener(() {
        setState(() {
          int index = rng.nextInt(messages.length);

// Get the item at the random index

          randomMessage = (messages..shuffle()).first;
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
        title: const Text(
          "Seasons Greetings",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.0015)
                ..rotateY(pi * _animation.value),
              child: Card(
                child: _animation.value <= 0.5
                    ? Container(
                        color: Colors.white,
                        width: 300,
                        height: 500,
                        child: Column(
                          children: [
                            Image.asset("images/tree.png"),
                            const Center(
                              child: Text(
                                "Merry Christmas",
                                textAlign: TextAlign.center,
                                style:
                                    TextStyle(fontSize: 40, color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(
                        width: 300,
                        height: 500,
                        color: Colors.white,
                        child: Center(
                          child: Transform(
                            alignment: FractionalOffset.center,
                            transform: Matrix4.identity()
                              ..setEntry(2, 1, 0.0015)
                              ..rotateY(pi * _animation.value),
                            child: Column(
                              children: [
                                Image.asset("images/tree2.png"),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    randomMessage,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.red),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
              )),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              if (_status == AnimationStatus.dismissed) {
                _controller.forward();
              } else {
                _controller.reverse();
              }
            },
            child: const Text("Flip Card"),
          )
        ],
      )),
    );
  }
}
