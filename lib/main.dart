import 'dart:ui';
import 'dart:async';
import 'dart:io';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter_test2/attribute.dart';
import 'package:flutter_test2/loadFromNEW.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
//import 'package:xml/xml.dart' as xml;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'package:flutter/material.dart';

import './second.dart';

import './items.dart';
import 'NewXml1.dart';
import 'loadFromXml.dart';
import "package:hovering/hovering.dart";

import 'package:file_picker/file_picker.dart';

import 'package:url_launcher/url_launcher.dart';

//import 'package:fluent_ui/fluent_ui.dart';
import 'package:firedart/firedart.dart';

//windows addons for sqlite
//import 'dart:ffi';
import 'dart:io';
import 'package:sqlite3/open.dart';
//import 'package:sqlite3/sqlite3.dart';

const apiKey = "AIzaSyBq53JubRCINsc-g6sKgA-fjUVE2l2ruTw";
const projectId = "atlantas-e5e5e";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  Firestore.initialize(projectId);
  FirebaseAuth.initialize(apiKey, VolatileStore());

  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 17, 21, 24)),
  ));
  doWhenWindowReady(() {
    var initialsize = Size(1200, 720);
    appWindow.minSize = initialsize;
    //appWindow.size = initialsize;
    appWindow.title = "Atlantas XML";
    appWindow.maximize();
    appWindow.show();
  });
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 17, 21, 24),
      //backgroundColor: Colors.black,
      body: WindowBorder(
        width: 1,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 16, 82, 249),
              child: WindowTitleBarBox(
                  child: Row(
                children: [
                  Expanded(child: MoveWindow()),
                  MinimizeWindowButton(),
                  MaximizeWindowButton(),
                  CloseWindowButton(),
                ],
              )),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, //Center Row contents horizontally,
                crossAxisAlignment:
                    CrossAxisAlignment.center, //Center Row contents vertically,
                children: [
                  Expanded(flex: 2, child: Container()),
                  Expanded(
                      flex: 3, child: Image.asset("assets/img/atlas1.png")),
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment
                          .center, //Center Column contents vertically,
                      crossAxisAlignment: CrossAxisAlignment
                          .center, //Center Column contents horizontally,
                      children: [
                        const Text(
                          "Chose:",
                          style: TextStyle(fontSize: 85, color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: HoverButton(
                              minWidth: 400,
                              onpressed: () async {
                                Navigator.pushReplacement(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder:
                                        (context, animation1, animation2) =>
                                            NewLoad(),
                                    transitionDuration: Duration.zero,
                                    reverseTransitionDuration: Duration.zero,
                                  ),
                                  // MaterialPageRoute(
                                  //   builder: (context) => Testing(
                                  //     xmlfile: file,
                                  //   ),
                                  // ),
                                );
                                // await products.add({'Values': 'testing'});
                                // final productsCollection =
                                //     await products.get();
                                // print(productsCollection.first.id);
                                //_pickfile();
                              },
                              color: const Color.fromARGB(255, 16, 82, 249),
                              hoverColor: Colors.white,
                              textColor: Colors.white,
                              shape: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 5.0),
                              ),
                              hoverShape: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 16, 82, 249),
                                    width: 5.0),
                              ),
                              hoverTextColor:
                                  const Color.fromARGB(255, 16, 82, 249),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "New XML file",
                                  style: TextStyle(fontSize: 60),
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: HoverButton(
                              minWidth: 400,
                              onpressed: () async {
                                Directory initPath =
                                    await getApplicationDocumentsDirectory();
                                String path =
                                    '${initPath.path}/Atlantas/DataBases/';
                                final checkPathExistence =
                                    await Directory(path).exists();
                                if (!checkPathExistence) {
                                  Directory dir = Directory(path);
                                  dir.create(recursive: true);
                                }
                                Navigator.pushReplacement(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder:
                                        (context, animation4, animation2) =>
                                            NewXML1(),
                                    transitionDuration: Duration.zero,
                                    reverseTransitionDuration: Duration.zero,
                                  ),
                                );
                                // Navigator.pushReplacement(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => NewXML1(),
                                //   ),
                                // );
                              },
                              color: const Color.fromARGB(255, 16, 82, 249),
                              hoverColor: Colors.white,
                              textColor: Colors.white,
                              shape: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 5.0),
                              ),
                              hoverShape: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 16, 82, 249),
                                    width: 5.0),
                              ),
                              hoverTextColor:
                                  const Color.fromARGB(255, 16, 82, 249),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Load XML file",
                                  style: TextStyle(fontSize: 60),
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: HoverButton(
                              minWidth: 400,
                              onpressed: () {
                                _launchURL();
                              },
                              color: const Color.fromARGB(255, 16, 82, 249),
                              hoverColor: Colors.white,
                              textColor: Colors.white,
                              shape: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 5.0),
                              ),
                              hoverShape: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 16, 82, 249),
                                    width: 5.0),
                              ),
                              hoverTextColor:
                                  const Color.fromARGB(255, 16, 82, 249),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Contact us",
                                  style: TextStyle(fontSize: 60),
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: HoverButton(
                              minWidth: 400,
                              onpressed: () {},
                              color: const Color.fromARGB(255, 16, 82, 249),
                              hoverColor: Colors.white,
                              textColor: Colors.white,
                              shape: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 5.0),
                              ),
                              hoverShape: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 16, 82, 249),
                                    width: 5.0),
                              ),
                              hoverTextColor:
                                  const Color.fromARGB(255, 16, 82, 249),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    "Settings",
                                    style: TextStyle(fontSize: 60),
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Expanded(flex: 2, child: Container()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _pickfile() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['xml']);

    if (result != null) {
      File file = File(result.files.single.path.toString());
      //print(file.toString());
      //print(result.names);

      //final newfile = await savefileTemp(file);

      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => Testing(
            xmlfile: file,
          ),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        ),
        // MaterialPageRoute(
        //   builder: (context) => Testing(
        //     xmlfile: file,
        //   ),
        // ),
      );
    }
  }

  Future<File> savefileTemp(File file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newfile = File('${appStorage.path}\\temp.xml');

    return File(file.path).copy(newfile.path);
  }

  void _launchURL() async {
    if (!await launch("https://www.iee.ihu.gr/")) {
      throw 'Could not launch , check your internet connection';
    }
  }
}
