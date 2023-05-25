import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:dyslexia_assessment/AboutDx.dart';
import 'package:dyslexia_assessment/Age.dart';
import 'package:dyslexia_assessment/App.dart';
import 'package:dyslexia_assessment/FinalTips.dart';


class FinalHomePage extends StatefulWidget {
  const FinalHomePage({super.key});

  @override
  State<FinalHomePage> createState() => _FinalHomePageState();
}

class _FinalHomePageState extends State<FinalHomePage> {
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
                              child:  Column(
                          children: [
                            const SizedBox(height: 45,),
                            const Text(
                              "Home Page",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(height: 10,),
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
                                              color: const Color.fromARGB(255, 218, 85, 85)
                                                  .withOpacity(0.4),
                                              image: const DecorationImage(
                                                alignment: Alignment.centerLeft,
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
                                                fontWeight: FontWeight.normal),
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
                                                color: const Color.fromARGB(255, 43, 148, 186)
                                                    .withOpacity(0.4),
                                                image: const DecorationImage(
                                                  alignment:
                                                      Alignment.centerLeft,
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
                                          padding: const EdgeInsets.only(right: 13),
                                          child: Container(
                                            height: 95,
                                            width: 95,
                                            decoration: BoxDecoration(
                                              color: const Color.fromRGBO(12, 123, 95, 1)
                                                  .withOpacity(0.3),
                                              image: const DecorationImage(
                                                alignment: Alignment.centerLeft,
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
                                          padding: EdgeInsets.only(right: 13),
                                          child: Text(
                                            "Tips",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.normal),
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
                                                padding: const EdgeInsets.only(right: 13),
                                                child: Container(
                                                  height: 95,
                                                  width: 95,
                                                  decoration: BoxDecoration(
                                                    color: const Color.fromARGB(255, 226, 159, 59)
                                                        .withOpacity(0.4),
                                                    image: const DecorationImage(
                                                      alignment:
                                                          Alignment.centerLeft,
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
                                                padding: EdgeInsets.only(right: 13),
                                                child: Text(
                                                  "Tutorial",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.normal),
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
                top: 83,
                left: 85,
                child: Hero(
                  tag: "person",
                  child: Image.asset(
                    "assets/images/user.png",
                    height: 220,
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
