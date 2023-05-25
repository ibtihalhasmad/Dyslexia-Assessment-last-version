import 'dart:ui';

import 'package:dyslexia_assessment/FinalHome.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AppT extends StatefulWidget {
  const AppT({super.key});

  @override
  State<AppT> createState() => _AppTState();
}

class _AppTState extends State<AppT> {
  late VideoPlayerController controller;

  @override
  void initState() {
    loadVideoPlayer();
    super.initState();
  }

  loadVideoPlayer() {
    controller = VideoPlayerController.asset('assets/videos/tips2.mp4');
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
        height: 490,
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
      Column(children: [
        
        Stack(children: [
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
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(
              children: [
                const SizedBox(
                  height: 160,
                ),
                Container(
                  height: 500,
                  width: 320,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 170, 99, 99).withOpacity(0.2),
                    boxShadow: [
                      BoxShadow(
                        color:
                            const Color.fromARGB(255, 197, 178, 178).withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
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
                              "App Tutorial",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400),
                            ),
                            Column(
                              children: [
                                const SizedBox(
                                  height: 17,
                                ),
                                AspectRatio(
                                  aspectRatio: controller.value.aspectRatio,
                                  child: VideoPlayer(controller),
                                ),
                                VideoProgressIndicator(controller,
                                    allowScrubbing: true,
                                    colors: const VideoProgressColors(
                                      backgroundColor: Colors.redAccent,
                                      playedColor: Colors.green,
                                      bufferedColor: Colors.yellow,
                                    )),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          if (controller.value.isPlaying) {
                                            controller.pause();
                                          } else {
                                            controller.play();
                                          }

                                          setState(() {});
                                        },
                                        icon: Icon(controller.value.isPlaying
                                            ? Icons.pause
                                            : Icons.play_arrow)),
                                    IconButton(
                                        onPressed: () {
                                          controller.seekTo(
                                              const Duration(seconds: 0));

                                          setState(() {});
                                        },
                                        icon: const Icon(
                                          Icons.stop,
                                          color: Colors.red,
                                        )),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text("Duration:${controller.value.duration}"),
                                    const SizedBox(
                                      width: 10,
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
          ]),
           Positioned(
            top: 50,
                    left: 115,
                    child: Hero(
                      tag: "person",
                      child: Image.asset(
                        "assets/images/Click1.png",
                        height: 165,
                      ),
                    ),
                  ),
        ]),
      ])
    ])));
  }

}
