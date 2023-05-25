
import 'dart:ui';
import 'package:dyslexia_assessment/AboutDx.dart';
import 'package:dyslexia_assessment/Age.dart';
import 'package:dyslexia_assessment/App.dart';
import 'package:dyslexia_assessment/FinalTips.dart';
import 'package:dyslexia_assessment/app2.dart';
import 'package:dyslexia_assessment/custom_container.dart';
import 'package:flutter/material.dart';

class UserPage2 extends StatefulWidget {
  const UserPage2({super.key});

  @override
  State<UserPage2> createState() => _UserPage2State();
}

class _UserPage2State extends State<UserPage2> {
  TextEditingController Username = TextEditingController();
  final _userKey = GlobalKey<FormState>();
 


  TextEditingController _controller = TextEditingController();
  bool _showError = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submitForm() {
    setState(() {
      if (_controller.text.isEmpty) {
        _showError = true;
      } else {
        _showError = false;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FinalHomePage(text: _controller.text),
          ),
        );
      }
    });
  }



  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
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
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 80),
                        child: Text(
                          "HELLO",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 190,
                      ),
                      GlassmorphismContainer(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                                child: Form(
                              key: _userKey,
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 35,
                                  ),
                                  SizedBox(
                                    width: 255,
                                    child: Column(
                                      children: [
                                       TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: ' Please Enter your name',
                prefixIcon: const Icon(Icons.person),
                errorText: _showError ? 'Please fill out this field!' : null,
              ),
            ),
                                        const SizedBox(height: 25.0),
                                        Container(
                                          height: 40,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            gradient: const LinearGradient(
                                              colors: [
                                                Color(0xffB0DAB9),
                                                Color(0xffDAD299),
                                              ],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: ElevatedButton(
                                            onPressed: () {
                                               _submitForm();
                                            },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.transparent,
                                                shadowColor:
                                                    Colors.transparent),
                                            child: const Center(
                                              child: Text(
                                                "Start",
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 44, 39, 2),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 16.0),
                                       
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 120,
                                    height: 15,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),
                      const SizedBox(height: 23),
                      GestureDetector(
                        onTap: () {goToUserName();},
                        child: const Text(
                          "Watch Tutorial App?",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 17,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                top: 162,
                left: 80,
                child: Hero(
                  tag: "person",
                  child: Image.asset(
                    "assets/images/user.png",
                    height: 240,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
    void goToUserName() {
   
      Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                         const App2()),
                              );
    }
}

class FinalHomePage extends StatefulWidget {
  final String text;

  const FinalHomePage({required this.text});

  @override
  _FinalHomePageState createState() => _FinalHomePageState();
}

class _FinalHomePageState extends State<FinalHomePage> {
  String _displayText = '';

  @override
  void initState() {
    super.initState();
    _displayText = widget.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
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
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 23, top: 38),
                child: Text(
                  'Hi, $_displayText',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 23, top: 64),
                child: Text(
                  'to Dyslexia Assessment, ',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
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
                        height: 260,
                      ),
                      Container(
                        height: 400,
                        width: 330,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(0.2),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.1),
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
                                color: Colors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: Colors.white.withOpacity(0.2)),
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 45,
                                  ),
                                  const Text(
                                    "Home Page",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const ChildAge()));
                                            },
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 95,
                                                  width: 95,
                                                  decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                            255, 218, 85, 85)
                                                        .withOpacity(0.4),
                                                    image:
                                                        const DecorationImage(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      image: AssetImage(
                                                        'assets/images/11.png',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                const Text(
                                                  "Assessment",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                                const SizedBox(
                                                  height: 9,
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(),
                                          Column(children: [
                                            const SizedBox(
                                              height: 10,
                                              width: 5,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const AboutDX()));
                                              },
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 95,
                                                    width: 95,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          const Color.fromARGB(
                                                                  255,
                                                                  43,
                                                                  148,
                                                                  186)
                                                              .withOpacity(0.4),
                                                      image:
                                                          const DecorationImage(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        image: AssetImage(
                                                          'assets/images/33.png',
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  const Text(
                                                    "About Dyslexia",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                  const SizedBox(
                                                    height: 9,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ]),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      Column(children: [
                                        const SizedBox(
                                          height: 20,
                                          width: 10,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const FinalTips()));
                                          },
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 13),
                                                child: Container(
                                                  height: 95,
                                                  width: 95,
                                                  decoration: BoxDecoration(
                                                    color: const Color.fromRGBO(
                                                            12, 123, 95, 1)
                                                        .withOpacity(0.3),
                                                    image:
                                                        const DecorationImage(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      image: AssetImage(
                                                        'assets/images/44.png',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(right: 13),
                                                child: Text(
                                                  "Tips",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 9,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                                width: 5,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const AppT()));
                                                },
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 13),
                                                      child: Container(
                                                        height: 95,
                                                        width: 95,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  226,
                                                                  159,
                                                                  59)
                                                              .withOpacity(0.4),
                                                          image:
                                                              const DecorationImage(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            image: AssetImage(
                                                              'assets/images/22.png',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 13),
                                                      child: Text(
                                                        "Tutorial",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 9,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ]),
                                    ],
                                  )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Positioned(
                top: 113,
                left: 100,
                child: Hero(
                  tag: "person",
                  child: Image.asset(
                    "assets/images/user.png",
                    height: 190,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
