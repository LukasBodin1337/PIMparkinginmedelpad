//import 'dart:js_util';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';
import 'dart:convert';
import 'dart:io';

final Uri _url = Uri.parse('https://flutter.dev');

String dateString = "2021-07-13T13:15:54.000000Z";
final date = DateTime.parse(dateString);
final format = DateFormat('yyyy-MM-dd H:m:s');

bool evenDay = DateTime.now().day % 2 == 0;
bool oddDay = DateTime.now().day % 2 == 1;

bool oddDaybefore16 = (oddDay && before16);
bool evenDaybefore16 = (evenDay && before16);
bool evenDayafter16 = (evenDay && !before16);

bool oddDaybefore09 = (oddDay && before29);
bool evenDaybefore09 = (evenDay && before29);
bool evenDayafter09 = (evenDay && !before29);

bool oddDaybefore08 = (oddDay && before28);
bool evenDaybefore08 = (evenDay && before28);
bool evenDayafter08 = (evenDay && !before28);

bool oddDaybefore07 = (oddDay && before07);
bool evenDaybefore07 = (evenDay && before07);
bool evenDayafter07 = (evenDay && !before07);

bool before07 = DateTime.now().hour <= 7;
bool before28 = DateTime.now().hour <= 8 && DateTime.now().hour >= 2;

bool before29 = DateTime.now().hour <= 9 && DateTime.now().hour >= 2;

bool before16 = DateTime.now().hour <= 15;

int minutesToMidnight = (24 - DateTime.now().hour) * 60 - DateTime.now().minute;
bool kalle = evenDay && before16;

void main() => runApp(const MaterialApp(home: Home()));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Settings2()));
              },
            ),
          ],

          //leading: const Icon(Icons.settings, color: Colors.white),
          title: Text('PIM',
              style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 4.0,
                  color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.black87,
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                child: IconButton(
                    icon: const Icon(Icons.camera_alt_rounded),
                    iconSize: 75,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ParkCamera()),
                      );
                    })),
            SizedBox(
              height: 275,
                child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton.icon(
                onPressed: () {
                  _findParkingBottomSheet(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.blueGrey;
                      }
                      return Colors.black87;
                    },
                  ),
                ),
                icon: const Icon(
                  Icons.location_on_outlined,
                  size: 50,
                ),
                label: Text(
                  'Här datumparkerar jag',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
            )),
          ],
        )));
  }

  void _findParkingBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: MediaQuery.of(context).size.height * 10.0,
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: <Widget>[
                Container(
                  child: const Center(
                    child: Text(
                      'Välj Stad',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Harnosand()));
                    },
                    child: const Text('Härnosand',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Kramfors()));
                    },
                    child: const Text('Kramfors',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Solleftea()));
                    },
                    child: const Text('Sollefteå',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Sundsvall()));
                    },
                    child: const Text('Sundsvall',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Timra()));
                    },
                    child: const Text('Timrå',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Ange()));
                    },
                    child: const Text('Ånge',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Ornskoldvik()));
                    },
                    child: const Text('Örnsköldvik',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class Settings2 extends StatelessWidget {
  const Settings2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Inställningar",
          style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 4.0,
              color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 60,
              width: 400,
              child: ElevatedButton(
                onPressed: () {
                  launchUrlString(
                      "https://www.youtube.com/watch?v=y98De45A94Y");
                },
                child: Text(
                  "Policy",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.grey;
                    }
                    return Colors.black87;
                  }),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 60,
              width: 400,
              child: ElevatedButton(
                onPressed: () {
                  launchUrlString(
                      "https://www.youtube.com/watch?v=y98De45A94Y");
                },
                child: Text(
                  "Sekretess",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.grey;
                    }
                    return Colors.black87;
                  }),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 60,
              width: 400,
              child: ElevatedButton(
                onPressed: () {
                  launchUrlString(
                      "https://www.youtube.com/watch?v=y98De45A94Y");
                },
                child: Text(
                  "Cookies",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.grey;
                    }
                    return Colors.black87;
                  }),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 60,
              width: 400,
              child: ElevatedButton(
                onPressed: () {
                  launchUrlString(
                      "https://www.youtube.com/watch?v=y98De45A94Y");
                },
                child: Text(
                  "Donera",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.grey;
                    }
                    return Colors.black87;
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          launchUrlString(
              "https://mail.google.com/mail/u/0/#inbox?compose=CllgCJTJFvRDVFLHWhqVCXQQPRFjTRfLPdNXhCrwNHHvznxKTsbgSWsRmDmxgjJcQQTktnlzbDB");
        },
        icon: const Icon(Icons.email),
        label: Text(
          "Kontakta Oss",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white),
        ),
        backgroundColor: Colors.black87,
      ),
    );
  }
}

class Sundsvall extends StatelessWidget {
  const Sundsvall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "PIM",
          style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 4.0,
              color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black87,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Settings2()));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 400,
            width: 300,
            child: FittedBox(
                fit: BoxFit.contain,
                child: evenDaybefore16
                    ? const Image(
                        image: AssetImage("assets/images/jämntdatum.png"),
                      )
                    : oddDaybefore16
                        ? const Image(
                            image: AssetImage("assets/images/uddadatum.png"),
                          )
                        : evenDayafter16
                            ? const Text(
                                "Sida spelar ej roll men byt till jämn sida 00.00 imorgon")
                            : const Text(
                                "Sida spelar ej roll men byt till udda sida 00.00 imorgon")),
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: ElevatedButton.icon(
                onPressed: () {
                  _findParkingBottomSheet(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.blueGrey;
                      }
                      return Colors.black87;
                    },
                  ),
                ),
                icon: const Icon(
                  Icons.location_on_outlined,
                  size: 50,
                ),
                label: Text(
                  'Sundsvall',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _findParkingBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: MediaQuery.of(context).size.height * 10.0,
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: <Widget>[
                Container(
                  child: const Center(
                    child: Text(
                      'Välj Stad',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Harnosand()));
                    },
                    child: const Text('Härnosand',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Kramfors()));
                    },
                    child: const Text('Kramfors',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Solleftea()));
                    },
                    child: const Text('Sollefteå',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Timra()));
                    },
                    child: const Text('Timrå',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Ange()));
                    },
                    child: const Text('Ånge',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Ornskoldvik()));
                    },
                    child: const Text('Örnsköldvik',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class Harnosand extends StatelessWidget {
  const Harnosand({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "PIM",
          style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 4.0,
              color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black87,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Settings2()));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 400,
            width: 300,
            child: FittedBox(
                fit: BoxFit.contain,
                child: evenDaybefore09
                    ? const Image(
                        image: AssetImage("assets/images/HaKrEvenDay.PNG"),
                      )
                    : oddDaybefore09
                        ? const Image(
                            image: AssetImage("assets/images/HakrOddDay.PNG"),
                          )
                        : evenDayafter09
                            ? const Text(
                                "Sida spelar ej roll men byt till jämn sida 09.00 imorgon")
                            : const Text(
                                "Sida spelar ej roll men byt till udda sida 09.00 imorgon")),
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: ElevatedButton.icon(
                onPressed: () {
                  _findParkingBottomSheet(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.blueGrey;
                      }
                      return Colors.black87;
                    },
                  ),
                ),
                icon: const Icon(
                  Icons.location_on_outlined,
                  size: 50,
                ),
                label: Text(
                  'Härnösand',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _findParkingBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: MediaQuery.of(context).size.height * 10.0,
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: <Widget>[
                Container(
                  child: const Center(
                    child: Text(
                      'Välj Stad',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Kramfors()));
                    },
                    child: const Text('Kramfors',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Solleftea()));
                    },
                    child: const Text('Sollefteå',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Sundsvall()));
                    },
                    child: const Text('Sundsvall',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Timra()));
                    },
                    child: const Text('Timrå',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Ange()));
                    },
                    child: const Text('Ånge',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Ornskoldvik()));
                    },
                    child: const Text('Örnsköldvik',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class Kramfors extends StatelessWidget {
  const Kramfors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "PIM",
          style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 4.0,
              color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black87,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Settings2()));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 400,
            width: 300,
            child: FittedBox(
                fit: BoxFit.contain,
                child: evenDaybefore09
                    ? const Image(
                        image: AssetImage("assets/images/HaKrEvenDay.PNG"),
                      )
                    : oddDaybefore09
                        ? const Image(
                            image: AssetImage("assets/images/HakrOddDay.PNG"),
                          )
                        : evenDayafter09
                            ? const Text(
                                "Sida spelar ej roll men byt till udda sida 09.00")
                            : const Text(
                                "Sida spelar ej roll men byt till jämn sida 09.00")),
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: ElevatedButton.icon(
                onPressed: () {
                  _findParkingBottomSheet(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.blueGrey;
                      }
                      return Colors.black87;
                    },
                  ),
                ),
                icon: const Icon(
                  Icons.location_on_outlined,
                  size: 50,
                ),
                label: Text(
                  'Kramfors',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _findParkingBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: MediaQuery.of(context).size.height * 10.0,
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: <Widget>[
                Container(
                  child: const Center(
                    child: Text(
                      'Välj Stad',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Harnosand()));
                    },
                    child: const Text('Härnosand',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Solleftea()));
                    },
                    child: const Text('Sollefteå',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Sundsvall()));
                    },
                    child: const Text('Sundsvall',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Timra()));
                    },
                    child: const Text('Timrå',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Ange()));
                    },
                    child: const Text('Ånge',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Ornskoldvik()));
                    },
                    child: const Text('Örnsköldvik',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class Solleftea extends StatelessWidget {
  const Solleftea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "PIM",
          style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 4.0,
              color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black87,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Settings2()));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 400,
            width: 300,
            child: FittedBox(
                fit: BoxFit.contain,
                child: evenDaybefore07
                    ? const Image(
                        image: AssetImage("assets/images/SollEvenDay.PNG"),
                      )
                    : oddDaybefore07
                        ? const Image(
                            image: AssetImage("assets/images/SollOddDay.PNG"),
                          )
                        : evenDayafter07
                            ? const Text(
                                "Sida spelar ej roll men byt till udda sida 07.00")
                            : const Text(
                                "Sida spelar ej roll men byt till jämn sida 07.00")),
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: ElevatedButton.icon(
                onPressed: () {
                  _findParkingBottomSheet(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.blueGrey;
                      }
                      return Colors.black87;
                    },
                  ),
                ),
                icon: const Icon(
                  Icons.location_on_outlined,
                  size: 50,
                ),
                label: Text(
                  'Sollefteå',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _findParkingBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: MediaQuery.of(context).size.height * 10.0,
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: <Widget>[
                Container(
                  child: const Center(
                    child: Text(
                      'Välj Stad',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Harnosand()));
                    },
                    child: const Text('Härnosand',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Kramfors()));
                    },
                    child: const Text('Kramfors',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Sundsvall()));
                    },
                    child: const Text('Sundsvall',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Timra()));
                    },
                    child: const Text('Timrå',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Ange()));
                    },
                    child: const Text('Ånge',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Ornskoldvik()));
                    },
                    child: const Text('Örnsköldvik',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class Timra extends StatelessWidget {
  const Timra({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "PIM",
          style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 4.0,
              color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black87,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Settings2()));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 400,
            width: 300,
            child: FittedBox(
                fit: BoxFit.contain,
                child: evenDaybefore16
                    ? const Image(
                        image: AssetImage("assets/images/jämntdatum.png"),
                      )
                    : oddDaybefore16
                        ? const Image(
                            image: AssetImage("assets/images/uddadatum.png"),
                          )
                        : evenDayafter16
                            ? const Text(
                                "Sida spelar ej roll men byt till udda sida 00.00")
                            : const Text(
                                "Sida spelar ej roll men byt till jämn sida 00.00")),
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: ElevatedButton.icon(
                onPressed: () {
                  _findParkingBottomSheet(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.blueGrey;
                      }
                      return Colors.black87;
                    },
                  ),
                ),
                icon: const Icon(
                  Icons.location_on_outlined,
                  size: 50,
                ),
                label: Text(
                  'Timrå',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _findParkingBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: MediaQuery.of(context).size.height * 10.0,
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: <Widget>[
                Container(
                  child: const Center(
                    child: Text(
                      'Välj Stad',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Harnosand()));
                    },
                    child: const Text('Härnosand',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Kramfors()));
                    },
                    child: const Text('Kramfors',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Solleftea()));
                    },
                    child: const Text('Sollefteå',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Sundsvall()));
                    },
                    child: const Text('Sundsvall',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Ange()));
                    },
                    child: const Text('Ånge',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Ornskoldvik()));
                    },
                    child: const Text('Örnsköldvik',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class Ange extends StatelessWidget {
  const Ange({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "PIM",
          style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 4.0,
              color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black87,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Settings2()));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            width: 300,
            child: const FittedBox(
                fit: BoxFit.contain,
                child: Text(
                    "Datumparkering gäller ej, se hemsida för att läsa vidare om regler")),
          ),
          const SizedBox(
            height: 80,
          ),
          SizedBox(
            height: 30,
            width: 150,
            child: ElevatedButton(
              onPressed: () {
                launchUrlString(
                    "https://www.ange.se/bo-bygga-miljo-trafik/gata-parkering-och-park/parkeringstillstand.html");
              },
              child: Text(
                "Läs mer här",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.grey;
                  }
                  return Colors.black87;
                }),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: ElevatedButton.icon(
                onPressed: () {
                  _findParkingBottomSheet(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.blueGrey;
                      }
                      return Colors.black87;
                    },
                  ),
                ),
                icon: const Icon(
                  Icons.location_on_outlined,
                  size: 50,
                ),
                label: Text(
                  'Ånge',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _findParkingBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: MediaQuery.of(context).size.height * 10.0,
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: <Widget>[
                Container(
                  child: const Center(
                    child: Text(
                      'Välj Stad',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Harnosand()));
                    },
                    child: const Text('Härnosand',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Kramfors()));
                    },
                    child: const Text('Kramfors',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Solleftea()));
                    },
                    child: const Text('Sollefteå',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Sundsvall()));
                    },
                    child: const Text('Sundsvall',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Timra()));
                    },
                    child: const Text('Timrå',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Ornskoldvik()));
                    },
                    child: const Text('Örnsköldvik',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class Ornskoldvik extends StatelessWidget {
  const Ornskoldvik({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "PIM",
          style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 4.0,
              color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black87,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Settings2()));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 400,
            width: 300,
            child: FittedBox(
                fit: BoxFit.contain,
                child: evenDaybefore08
                    ? const Image(
                        image: AssetImage("assets/images/OrnEvenDay.PNG"),
                      )
                    : oddDaybefore08
                        ? const Image(
                            image: AssetImage("assets/images/OrnOddDay.PNG"),
                          )
                        : evenDayafter08
                            ? const Text(
                                "Sida spelar ej roll men byt till udda sida 00.00 imorgon")
                            : const Text(
                                "Sida spelar ej roll men byt till jämn sida 00.00 imorgon")),
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: ElevatedButton.icon(
                onPressed: () {
                  _findParkingBottomSheet(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.blueGrey;
                      }
                      return Colors.black87;
                    },
                  ),
                ),
                icon: const Icon(
                  Icons.location_on_outlined,
                  size: 50,
                ),
                label: Text(
                  'Örnsköldsvik',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _findParkingBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: MediaQuery.of(context).size.height * 10.0,
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: <Widget>[
                Container(
                  child: const Center(
                    child: Text(
                      'Välj Stad',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Harnosand()));
                    },
                    child: const Text('Härnosand',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Kramfors()));
                    },
                    child: const Text('Kramfors',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Solleftea()));
                    },
                    child: const Text('Sollefteå',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Sundsvall()));
                    },
                    child: const Text('Sundsvall',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Timra()));
                    },
                    child: const Text('Timrå',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Ange()));
                    },
                    child: const Text('Ånge',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class ParkCamera extends StatefulWidget {
  const ParkCamera({super.key});

  @override
  State<ParkCamera> createState() => _ParkCameraState();
}

class _ParkCameraState extends State<ParkCamera> {
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Park Scanner'),
        ),
        body: Center(
          child: Column(
            children: [
              if (imageFile != null)
                (Image.file(imageFile!,
                    fit: BoxFit.contain, height: 580, width: 1080))
              else
                (Container(
                  width: 300,
                  height: 480,
                  alignment: Alignment.center,
                  child: const Text('Image will appear here'),
                )),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 100,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () => fetchImage(source: ImageSource.camera),
                        style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 15)),
                        child: const Text('Capture Picture'),
                      )),
                  SizedBox(
                      width: 150,
                      height: 50,
                      child: IconButton(
                        icon: const Icon(Icons.navigate_next_rounded),
                        iconSize: 75,
                        onPressed: () {
                          if (imageFile != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SignTranslater(imageFile: imageFile!)),
                            );
                          } else {
                            setState(() {
                              _showMyDialog();
                            });
                            debugPrint("No Image");
                          }
                        },
                      )),
                  SizedBox(
                      width: 100,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () =>
                            fetchImage(source: ImageSource.gallery),
                        style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 15)),
                        child: const Text('Select Picture'),
                      )),
                ],
              )
            ],
          ),
        ));
  }

  void fetchImage({required ImageSource source}) async {
    debugPrint("entering fetchimage");
    final imageFile = await ImagePicker().pickImage(source: source);

    if (imageFile == null) return;
    final imageTemp = File(imageFile.path);
    setState(() => this.imageFile = imageTemp);
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('No Image'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('There is no image selected or captured'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

// ignore: must_be_immutable
class SignTranslater extends StatefulWidget {
  File imageFile;

  SignTranslater({super.key, required this.imageFile});

  @override
  State<SignTranslater> createState() =>
      // ignore: no_logic_in_create_state
      _SignTranslaterState(imageFile: imageFile);
}

class _SignTranslaterState extends State<SignTranslater> {
  File imageFile;

  _SignTranslaterState({required this.imageFile});

  String imageText = ('');

  @override
  Widget build(Object context) {
    if (imageText == ('')) {
      translateMethod(imageFile, imageText);
      return const Center(
        child: SizedBox(
          height: 200.0,
          width: 200.0,
          child: CircularProgressIndicator(
            strokeWidth: 5,
          ),
        ),
      );
    } else {
      int numberOfLines = 0;
      final imageTextLines = interpretText(imageText);
      for (var i = 0; i < imageTextLines.length; i++) {
        numberOfLines = i;
        debugPrint("Line: $numberOfLines ${imageTextLines[i]}");
      }
      var datetime = DateTime.now();
      return Scaffold(
          appBar: AppBar(title: const Text('Translated')),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  child: Text(
                ("Du får parkera mellan:\n ${imageTextLines[0]} \n"),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 30,
                    fontFamily: "Kantic",
                    fontWeight: FontWeight.bold),
              )),
              SizedBox(
                  child: Text(
                ("Parkering gäller mellan kl:\n ${imageTextLines[1]} på vardagar.\n"),
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )),
              SizedBox(
                child: Text(
                    ("Parkering gäller mellan kl:\n ${imageTextLines[2]} på helger.\n"),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 30,
                        color: Color.fromARGB(255, 231, 25, 25),
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                child: Text(("Klockan är ${datetime.hour}:${datetime.minute}"),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold)),
              ),
            ],
          )));
    }
  }

  void translateMethod(imageFile, String imageText) async {
    debugPrint('entering translateMethod');
    imageText = await FlutterTesseractOcr.extractText(imageFile.path);
    debugPrint(imageText);
    setState(() => this.imageText = imageText);
  }

  List<String> interpretText(String imageText) {
    const splitter = LineSplitter();
    final imageTextLines = splitter.convert(imageText);
    //when = imageTextLines[0];
    //weekday = imageTextLines[1];
    //weekend = imageTextLines[2];
    //redday = imageTextLines[3];
    return imageTextLines;
  }
}
