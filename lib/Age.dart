import 'dart:ui';

import 'package:dyslexia_assessment/FinalHome.dart';
import 'package:dyslexia_assessment/FinalQuestions.dart';
import 'package:flutter/material.dart';

class ChildAge extends StatefulWidget {
  const ChildAge({super.key});

  @override
  State<ChildAge> createState() => _ChildAgeState();
}

class _ChildAgeState extends State<ChildAge> {
  int _selectedOption = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          height: 610,
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
              Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 115),
                      child: IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () {
                          showMenu(
                            context: context,
                            position: const RelativeRect.fromLTRB(0, 50, 0, 0),
                            items: <PopupMenuEntry>[
                              PopupMenuItem(
                                value: 'item1',
                                child: Row(
                                  children: const <Widget>[
                                    Icon(Icons.home),
                                    SizedBox(width: 10),
                                    Text('Home Page'),
                                  ],
                                ),
                              ),
                             
                              PopupMenuItem(
                                value: 'item2',
                                child: Row(
                                  children: const <Widget>[
                                    Icon(Icons.close),
                                    SizedBox(width: 10),
                                    Text('Close'),
                                  ],
                                ),
                              ),
                            ],
                          ).then((value) {
                            if (value == 'item1') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const FinalHomePage(),
                                ),
                              );
                            }  else {
                              onPressed:
                              () => Navigator.pop(context);
                            }
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 120, top: 0),
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
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 280,
                        ),
                        Container(
                          height: 385,
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
                                      height: 65,
                                    ),
                                    Column(
                                      children: [
                                        const Text(
                                          "Please select child age",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 30),
                                          child: RadioListTile(
                                            value: 0,
                                            groupValue: _selectedOption,
                                            onChanged: (value) {
                                              setState(() {
                                                _selectedOption = value as int;
                                              });
                                            },
                                            title: const Text('1-3 years old'),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 30),
                                          child: RadioListTile(
                                            value: 1,
                                            groupValue: _selectedOption,
                                            onChanged: (value) {
                                              setState(() {
                                                _selectedOption = value as int;
                                              });
                                            },
                                            title: const Text('4-5 years old'),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 30),
                                          child: RadioListTile(
                                            value: 2,
                                            groupValue: _selectedOption,
                                            onChanged: (value) {
                                              setState(() {
                                                _selectedOption = value as int;
                                              });
                                            },
                                            title: const Text('6-7 years old'),
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {
                                        if (_selectedOption != -1) {
                                          {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return Dialog(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    child: Container(
                                                      height: 250.0,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        gradient:
                                                            const LinearGradient(
                                                          colors: [
                                                            Color(0xffB0DAB9),
                                                            Color(0xffDAD299),
                                                          ],
                                                          begin:
                                                              Alignment.topLeft,
                                                          end: Alignment
                                                              .bottomRight,
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          const Icon(
                                                            Icons.check_circle,
                                                            color: Colors.white,
                                                            size: 50.0,
                                                          ),
                                                          const SizedBox(
                                                              height: 10.0),
                                                          const Text(
                                                            'Attention!',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 22.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              height: 12.0),
                                                          const Padding(
                                                            padding: EdgeInsets.only(left: 20, right: 20),
                                                            child: Text(
                                                              'Follow the instructions and \nanswer all 9 questions correctly for \naccurate results.',
                                                              style: TextStyle(
                                                                color:
                                                                    Colors.white,
                                                                fontSize: 17.0,
                                                              ),
                                                              textAlign: TextAlign
                                                                  .center,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              height: 20.0),
                                                          TextButton(
                                                            child: const Text(
                                                              'OK',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 18.0,
                                                              ),
                                                            ),
                                                            onPressed: () {
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              const FinalQuestion()));
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                });
                                          }
                                          ;
                                        } else {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Dialog(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  child: Container(
                                                    height: 230.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      gradient: const LinearGradient(
                                                        colors: [
                                                          Color(0xffB0DAB9),
                                                          Color(0xffDAD299),
                                                        ],
                                                        begin:
                                                            Alignment.topLeft,
                                                        end: Alignment
                                                            .bottomRight,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        const Icon(
                                                          Icons.warning,
                                                          color: Colors.white,
                                                          size: 50.0,
                                                        ),
                                                        const SizedBox(height: 10.0),
                                                        const Text(
                                                          'Warning!',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 22.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        const SizedBox(height: 12.0),
                                                        const Text(
                                                          'Please select one choice',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 17.0,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        const SizedBox(height: 20.0),
                                                        TextButton(
                                                          child: const Text(
                                                            'OK',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 18.0,
                                                            ),
                                                          ),
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  context),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              });
                                        }
                                        ;
                                      },
                                      child: Container(
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
                                        child: const Center(
                                          child: Text(
                                            "Next",
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
                  top: 130,
                  left: 93,
                  child: Hero(
                    tag: "person",
                    child: Image.asset(
                      "assets/images/user.png",
                      height: 210,
                    ),
                  ),
                ),
              ],
            ),
            Row(),
          ],
        ),
      ]),
    );
  }
}
