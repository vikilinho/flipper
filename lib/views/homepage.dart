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

  @override
  void initState() {
    //initialise the animation controller
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = Tween(end: 1.0, begin: 0.0).animate(_controller)
      ..addListener(() {
        setState(() {});
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
                ..setEntry(2, 1, 0.0015)
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
                        height: 300,
                        color: Colors.white,
                        child: Center(
                          child: Transform(
                            alignment: FractionalOffset.center,
                            transform: Matrix4.identity()
                              ..setEntry(2, 1, 0.0015)
                              ..rotateY(pi * _animation.value),
                            child: const Text(
                              "Happy New Year",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 40, color: Colors.red),
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
