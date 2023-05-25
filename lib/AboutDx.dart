import 'dart:ui';

import 'package:dyslexia_assessment/FinalHome.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AboutDX extends StatefulWidget {
  const AboutDX({super.key});

  @override
  State<AboutDX> createState() => _AboutDXState();
}

class _AboutDXState extends State<AboutDX> {
  late VideoPlayerController controller;

  @override
  void initState() {
    loadVideoPlayer();
    super.initState();
  }

  loadVideoPlayer() {
    controller = VideoPlayerController.asset('assets/videos/Dyslexia.mp4');
    controller.addListener(() {
      setState(() {});
    });
    controller.initialize().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: <Widget>[
          Container(
            height: 535,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xffB0DAB9),
                  Color(0xffDAD299),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Column(
            children: [
              
              Stack(
                children: [
                   Padding(
                  padding: const EdgeInsets.only(left: 180, top: 0),
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.centerLeft,
                        image: AssetImage(
                          'assets/images/L.png',
                        ),
                      ),
                    ),
                  ),
                ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 170,
                          ),
                          Container(
                            height: 497,
                            width: 320,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 170, 99, 99)
                                  .withOpacity(0.2),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromARGB(255, 197, 178, 178)
                                      .withOpacity(0.1),
                                  blurRadius: 10,
                                  spreadRadius: 5,
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.white),
                                  ),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 60,
                                      ),
                                      const Text(
                                        "About Dyslexia",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Column(
                                        children: [
                                          const SizedBox(
                                            height: 17,
                                          ),
                                          AspectRatio(
                                            aspectRatio:
                                                controller.value.aspectRatio,
                                            child: VideoPlayer(controller),
                                          ),
                                          VideoProgressIndicator(controller,
                                              allowScrubbing: true,
                                              colors: const VideoProgressColors(
                                                backgroundColor:
                                                    Colors.redAccent,
                                                playedColor: Colors.green,
                                                bufferedColor: Colors.yellow,
                                              )),
                                          Row(
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    if (controller
                                                        .value.isPlaying) {
                                                      controller.pause();
                                                    } else {
                                                      controller.play();
                                                    }

                                                    setState(() {});
                                                  },
                                                  icon: Icon(
                                                      controller.value.isPlaying
                                                          ? Icons.pause
                                                          : Icons.play_arrow)),
                                              IconButton(
                                                  onPressed: () {
                                                    controller.seekTo(
                                                        const Duration(
                                                            seconds: 0));

                                                    setState(() {});
                                                  },
                                                  icon: const Icon(
                                                    Icons.stop,
                                                    color: Colors.red,
                                                  )),
                                                  const SizedBox(width: 10,),
                                              Text(controller.value.duration
                                                  .toString()),
                                                   const SizedBox(width: 10,),
                                              IconButton(
                                                icon: const Icon(Icons.info),
                                                onPressed: () {
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        title: const Text(
                                                            'About Dyslexia?'),
                                                        content:
                                                            SingleChildScrollView(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: const [
                                                              Text(
                                                                'What is Dyslexia?',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        19),
                                                              ),
                                                             
                                                              Text(
                                                                'Dyslexia is a type of learning disability. A child with a learning disability has trouble processing words or numbers. There are several kinds of learning disabilities — dyslexia is the term used when people have trouble learning to read, even though they are smart enough and want to learn.',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16),
                                                              ),
                                                              SizedBox(height: 9,),
                                                              Text(
                                                                'What Causes Dyslexia?',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        19),
                                                              ),
                                                              Text(
                                                                'Dyslexia is not a disease. It is a condition someone is born with, and it often runs in families. People with dyslexia are not stupid or lazy. Most have average or above-average intelligence, and they work very hard to overcome their reading problems.',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16),
                                                                        
                                                              ),
                                                              SizedBox(height: 9,),
                                                              Text(
                                                                'What Are the Signs of Dyslexia?',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        19),
                                                              ),
                                                              Text(
                                                                'In preschool and elementary school kids, some signs of dyslexia can include problems with: \n1- learning to talk \n2- pronouncing longer words \n3-learning the alphabet sequence, days of the week, colors, shapes, and numbers \n4-learning letter names and sounds \n5-learning to read and write his or her name \n6-learning to identify syllables (cow–boy in cowboy) and speech sounds (phonemes: b-a-t in bat) in words \n7-sounding out simple words \n8-reading and spelling words with the correct letter sequence ("top" rather than "pot") \n9-handwriting and fine-motor coordination',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        17),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: const Text(
                                                              'OK',
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          68,
                                                                          154,
                                                                          176),
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const FinalHomePage()),
                                                    );
                                                  },
                                                  icon: const Icon(
                                                    Icons.home,
                                                  )),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    top: 60,
                    left: 120,
                    child: Hero(
                      tag: "person",
                      child: Image.asset(
                        "assets/images/Help1.png",
                        height: 170,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(),
            ],
          ),
        ]),
      ),
    );
  }
}
