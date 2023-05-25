import 'dart:ui';
import 'package:dyslexia_assessment/FinalHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
}

class FinalTips extends StatefulWidget {
  const FinalTips({super.key});

  @override
  State<FinalTips> createState() => _FinalTipsState();
}

class _FinalTipsState extends State<FinalTips> {
  late VideoPlayerController controller;

  @override
  void initState() {
    loadVideoPlayer();
    super.initState();
  }

  

  loadVideoPlayer() {
    controller = VideoPlayerController.asset('assets/videos/tips.mp4');
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
                            height: 160,
                          ),
                          Container(
                            height: 500,
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
                                        "Supporting dyslexic child at home?",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 18,
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
                                                            'How can I help my dyslexic child at home?'),
                                                        content:
                                                            SingleChildScrollView(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: const [
                                                              Text(
                                                                '1- Read together!',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        17),
                                                              ),
                                                              Text(
                                                                '2- Focus on sight words.',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        17),
                                                              ),
                                                              Text(
                                                                '3- Create a calendar to help them track progress or tasks.',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        17),
                                                              ),
                                                              Text(
                                                                '4- Praise their success and effort.',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        17),
                                                              ),
                                                              Text(
                                                                '5- Use mnemonic devices.',
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
                    top: 50,
                    left: 120,
                    child: Hero(
                      tag: "person",
                      child: Image.asset(
                        "assets/images/here.png",
                        height: 175,
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
