import 'dart:typed_data';
import 'dart:ui';
import 'package:dyslexia_assessment/Age.dart';
import 'package:dyslexia_assessment/FinalHome.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class Question {
  String question;
  String Instruction;
  bool answer;

  Question(this.question, this.Instruction, this.answer);
}

int questionIndex = 0;
int score = 0;

List<Map<String, dynamic>> questions = [
  {
    'question':
        'Does your child has difficulty in distinguishing between words that sound similar? \n \n',
    'instruction':
        'Let your child read the words loud. \n1. Mana - Nama - Mama \n2. Dapat - Padat \n3. Gula - Lagu \n \n \n \n',
    'answer': true,
  }, //1

  {
    'question':
        'Does your child has difficulty identifying words that start with the same letter? \n \n',
    'instruction':
        'Let your child read the words loud. \n1. Buku - Buka \n2. Kuku - Kaki \n3. Ayam - Ayah \n \n \n \n',
    'answer': true,
  }, //2
  {
    'question':
        'Does your child unable to read unfamiliar or made-up words, and tends to guess or make up words based on some familiarity?',
    'instruction':
        'Let your child read the words loud. \n1. Pilau = Pulau \n2. Karusi = Kerusi \n3. Maja = Meja \n \n \n \n',
    'answer': true,
  }, //3

  {
    'question':
        'Does your child capable of reading at the appropriate level for their age? \n \n',
    'instruction':
        'Observe the child reading out loud from their reader that suits their age. \n \n \n \n \n \n',
    'answer': true,
  }, //4
  {
    'question':
        'Does the child become visibly tired after reading for only a short time? \n \n',
    'instruction':
        'Observe the child reading out loud from their reader that suits their age. \n \n \n \n \n \n',
    'answer': true,
  }, //5
  {
    'question':
        'Does your child has difficulty identifying the word that would remain if a particular sound were removed from it? \n',
    'instruction':
        'Let your child read the full word, then the word next to it. \n1. Cat = At \n2. Paku = Aku \n3. Mata = Ta \n \n \n \n',
    'answer': true,
  }, //6

  {
    'question': 'Does your child has difficulty naming the letters? \n \n \n',
    'instruction':
        'While pointing to the letters, ask your child read it aloud. \nA, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, K, R, S, T, V, W, X, Y, Z \n \n \n \n',
    'answer': true,
  },

  {
    'question':
        'Will the reading be slow and inaccurate, even when reading individual words, and without any visual cues? \n',
    'instruction':
        'Show the following word, one after another, and ask your child to read (make sure that there is no visual cues while doing this). \n1. Buku \n2. Meja \n3. Bola \n4.Kerusi',
    'answer': true,
  },
  {
    'question':
        'Does your child has difficulty remembering a sentence or story that was just told? \n \n',
    'instruction':
        'Read this story to your child. “Ali ada seekor kuching bernama Tompok. Tompok suka makan ikan.”           \nAsk your child the following questions: \n1. Apa nama kuching Ali? \n2. Tompok suka makan apa? \n',
    'answer': true,
  },
];

class FinalQuestion extends StatefulWidget {

  const FinalQuestion({super.key});

  @override
  State<FinalQuestion> createState() => _FinalQuestionState();
}

class _FinalQuestionState extends State<FinalQuestion> {
  void goToHomePage() {
    setState(() {
      questionIndex = 0;
      score = 0;
      // Add any additional state variables you want to reset
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const FinalHomePage(),
        ),
      );
    });
  }

  void goToChaneAge() {
    setState(() {
      questionIndex = 0;
      score = 0;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const ChildAge(),
        ),
      );
    });
  }

  void repeatInstruction() {
    setState(() {
      questionIndex = 0;
      score = 0;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const FinalQuestion(),
        ),
      );
    });
  }

  double calculateProgress() {
    int totalQuestionsAndInstructions =
        questions.length * 2; // Each question has an instruction
    int currentProgress = questionIndex * 2 +
        1; // Multiply by 2 for each question and add 1 for each instruction
    double progress = currentProgress / totalQuestionsAndInstructions;
    return progress;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          height: 500,
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
                                    Icon(Icons.date_range),
                                    SizedBox(width: 10),
                                    Text('Child Age'),
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                value: 'item3',
                                child: Row(
                                  children: const <Widget>[
                                    Icon(Icons.refresh),
                                    SizedBox(width: 10),
                                    Text('Repeat'),
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                value: 'item3',
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
                              goToHomePage();
                            } else if (value == 'item2') {
                              goToChaneAge();
                            } else if (value == 'item3') {
                              repeatInstruction();
                            } else {
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
                          height: 190,
                        ),
                        Container(
                          height: 400,
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
                                    
                                    Padding(
                                      padding: const EdgeInsets.only(top: 60),
                                      child: Text(
                                        'Instruction ${questionIndex + 1}',
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 33, right: 33, top: 5,bottom: 0),
                                          child: Text(
                                            questions[questionIndex]
                                                ['instruction'],
                                            style: const TextStyle(
                                              fontSize: 19,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 60,),
                                   
                                    Container(
                                      width: 260,
                                      height:
                                          16.0, // Adjust the height as desired
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(
                                            8.0), // Adjust the border radius as desired
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: (calculateProgress() * 100)
                                                .toInt(),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                gradient: const LinearGradient(
                                                  colors: [
                                                    Color(0xffB0DAB9),
                                                    Color(0xffDAD299),
                                                  ],
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                ),
                                                borderRadius: BorderRadius.circular(
                                                    8.0), // Adjust the border radius as desired
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 100 -
                                                (calculateProgress() * 100)
                                                    .toInt(),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.grey[300],
                                                borderRadius: BorderRadius.circular(
                                                    8.0), // Adjust the border radius as desired
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        InkWell(
                          onTap: () async {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => QuestionPage(score),
                              ),
                            );
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
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                "Next",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 44, 39, 2),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
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
                  left: 105,
                  child: Hero(
                    tag: "person",
                    child: Image.asset(
                      "assets/images/user.png",
                      height: 180,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}

class QuestionPage extends StatefulWidget {
  final int score;
  //late String text;
  const QuestionPage(this.score, {super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  double calculateProgress() {
    int totalQuestionsAndInstructions =
        questions.length * 2; // Each question has an instruction
    int currentProgress = questionIndex * 2 +
        1; // Multiply by 2 for each question and add 1 for each instruction
    double progress = currentProgress / totalQuestionsAndInstructions;
    return progress;
  }

  void repeatInstruction() {
    setState(() {
      questionIndex = 0;
      score = 0;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const FinalQuestion(),
        ),
      );
    });
  }

  void checkAnswer(bool answer) {
    setState(() {
      if (questions[questionIndex]['answer'] == answer) {
        score++;
      }
      if (questionIndex == questions.length - 1) {
        // If this is the last question, navigate to the score page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => FinalResultPage(score),
          ),
        );
      } else {
        questionIndex++;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const FinalQuestion(),
          ),
        );
      }
      // Reset the questionIndex to 0 if the user wants to repeat the instruction
      if (questionIndex == questions.length) {
        questionIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          height: 500,
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
                      padding: const EdgeInsets.only(bottom: 120),
                      child: IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const FinalQuestion()));
                          }),
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
                          height: 300,
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
                                      height: 60,
                                    ),
                                    Text(
                                      "Question ${questionIndex + 1}",
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 35, right: 33, top: 5),
                                          child: Text(
                                            questions[questionIndex]
                                                ['question'],
                                            style: const TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                       
                                        Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top: 55),
                                              child: Container(
                                                width: 260,
                                                height:
                                                    16.0, // Adjust the height as desired
                                                decoration: BoxDecoration(
                                                  color: Colors.grey[300],
                                                  borderRadius: BorderRadius.circular(
                                                      8.0), // Adjust the border radius as desired
                                                ),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      flex:
                                                          (calculateProgress() * 100)
                                                              .toInt(),
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          gradient: const LinearGradient(
                                                            colors: [
                                                              Color(0xffB0DAB9),
                                                              Color(0xffDAD299),
                                                            ],
                                                            begin:
                                                                Alignment.topCenter,
                                                            end: Alignment
                                                                .bottomCenter,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  8.0), // Adjust the border radius as desired
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 100 -
                                                          (calculateProgress() * 100)
                                                              .toInt(),
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          color: Colors.grey[300],
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  8.0), // Adjust the border radius as desired
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
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
                  top: 125,
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
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 95),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      checkAnswer(true);
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
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "Yes",
                          style: TextStyle(
                            color: Color.fromARGB(255, 44, 39, 2),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      checkAnswer(false);
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
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "No",
                          style: TextStyle(
                            color: Color.fromARGB(255, 44, 39, 2),
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
            Row(),
          ],
        ),
      ]),
    );
  }
}

class ScorePage extends StatelessWidget {
  final int score;
  ScorePage(this.score, {super.key});
  ScreenshotController screenshotController = ScreenshotController();

  void _captureAndShowToast() async {
    // Capture the screenshot
    final imageBytes = await screenshotController.capture();

    // Save the image to the gallery
    final result = await ImageGallerySaver.saveImage(
      Uint8List.fromList(imageBytes as List<int>),
      quality: 100,
    );

    if (result['isSuccess']) {
      // Show a toast with the save success message
      Fluttertoast.showToast(
        msg: 'Image saved successfully!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black.withOpacity(0.8),
        textColor: Colors.white,
      );
    } else {
      // Show a toast with the save failure message
      Fluttertoast.showToast(
        msg: 'Failed to save image!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black.withOpacity(0.8),
        textColor: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String displayText = '';

    String message;
    if (score == 9) {
      message =
          'Your child have severe dyslexia. You can visit specific doctor to make your child better.';
    } else if (score >= 7) {
      message =
          'Your child have moderate dyslexia. You can do some practices with your child to get improve.';
    } else if (score >= 5) {
      message =
          'Your child have mild dyslexia. You can do some practices with your child to get improve.';
    } else if (score >= 3) {
      message =
          'Your child have ew signs of dyslexia. You can do some practices with your child to get improve.';
    } else {
      message = 'Your child have No signs of dyslexia.';
    }
    final controller = ScreenshotController();
    return Screenshot(
        controller: controller,
        child: Scaffold(
            body: Stack(children: <Widget>[
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
                      height: 260,
                    ),
                    Container(
                      height: 300,
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
                                  height: 70,
                                ),
                                const Text(
                                  "Your Result is",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      '$score / ${questions.length}',
                                      style: const TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 35, right: 30),
                                      child: Text(
                                        '$message',
                                        style: const TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18),
                      child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const FinalHomePage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(15),
                              primary: Colors.grey[200],
                            ),
                            child: const CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.home,
                                color: Color.fromARGB(255, 227, 208, 71),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            onPressed: _captureAndShowToast,
                            child: const Text('Save Image'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              String text =
                                  'Your result is $score / ${questions.length} \n$message'; //result
                              Share.share(text);
                            },
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(15),
                              primary: Colors.grey[200],
                            ),
                            child: const CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.share,
                                color: Color.fromARGB(255, 227, 208, 71),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              String text =
                                  'Your result is $score / ${questions.length} \n$message'; //result
                              Share.share(text);
                            },
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(15),
                              primary: Colors.grey[200],
                            ),
                            child: const CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.share,
                                color: Color.fromARGB(255, 227, 208, 71),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
              Positioned(
                top: 130,
                left: 110,
                child: Hero(
                  tag: "person",
                  child: Image.asset(
                    "assets/images/user.png",
                    height: 190,
                  ),
                ),
              ),
            ]),
          ])
        ])));
  }

  Future<String> saveImage(Uint8List bytes) async {
    await [Permission.storage].request();
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');
    final name = 'screenshot_$time';
    final result = await ImageGallerySaver.saveImage(bytes, name: name);

    return result['filePath'];
  }
}

class FinalResultPage extends StatefulWidget {
  final int score;
  const FinalResultPage(this.score, {super.key});

  @override
  State<FinalResultPage> createState() => _FinalResultPageState();
}

class _FinalResultPageState extends State<FinalResultPage> {
  ScreenshotController screenshotController = ScreenshotController();

  void _captureAndShowToast() async {
    // Capture the screenshot
    final imageBytes = await screenshotController.capture();

    // Save the image to the gallery
    final result = await ImageGallerySaver.saveImage(
      Uint8List.fromList(imageBytes!),
      quality: 100,
    );

    if (result['isSuccess']) {
      // Show a toast with the save success message
      Fluttertoast.showToast(
        msg: 'Image saved successfully!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black.withOpacity(0.8),
        textColor: Colors.white,
      );
    } else {
      // Show a toast with the save failure message
      Fluttertoast.showToast(
        msg: 'Failed to save image!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black.withOpacity(0.8),
        textColor: Colors.white,
      );
    }
  }

   void goToHomePage() {
    setState(() {
      questionIndex = 0;
      score = 0;
      // Add any additional state variables you want to reset
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const FinalHomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    String message;
    if (widget.score == 9) {
      message =
          'Your child have severe dyslexia. You can visit specific doctor to make your child better.';
    } else if (widget.score >= 7) {
      message =
          'Your child have moderate dyslexia. You can do some practices with your child to get improve.';
    } else if (widget.score >= 5) {
      message =
          'Your child have mild dyslexia. You can do some practices with your child to get improve.';
    } else if (widget.score >= 3) {
      message =
          'Your child have ew signs of dyslexia. You can do some practices with your child to get improve.';
    } else {
      message = 'Your child have No signs of dyslexia.';
    }

    return Scaffold(
      body: Screenshot(
        controller: screenshotController,
        child: Center(
          child: Column(
            children: [
              Stack(children: <Widget>[
                Container(
                  height: 550,
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
                            height: 290,
                          ),
                          Container(
                            height: 300,
                            width: 320,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 170, 99, 99)
                                  .withOpacity(0.2),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color.fromARGB(255, 197, 178, 178)
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
                                        "Your Result is",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          Text(
                                            '${widget.score} / ${questions.length}',
                                            style: const TextStyle(
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 7,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 33, right: 30),
                                            child: Text(
                                              '$message',
                                              style: const TextStyle(
                                                fontSize: 19,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                 goToHomePage();
                                },
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.home,
                                    color: Color.fromARGB(255, 227, 208, 71),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  padding: const EdgeInsets.all(15),
                                  primary: Colors.grey[200],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                onPressed: _captureAndShowToast,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Color.fromARGB(255, 227, 208, 71),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  padding: const EdgeInsets.all(15),
                                  primary: Colors.grey[200],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  String text =
                                      'Your result is ${widget.score} / ${questions.length} \n$message'; //result
                                  Share.share(text);
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  padding: const EdgeInsets.all(15),
                                  primary: Colors.grey[200],
                                ),
                                child: const CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.share,
                                    color: Color.fromARGB(255, 227, 208, 71),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ]),
                    Positioned(
                      top: 150,
                      left: 110,
                      child: Hero(
                        tag: "person",
                        child: Image.asset(
                          "assets/images/user.png",
                          height: 190,
                        ),
                      ),
                    ),
                  ]),
                ])
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
