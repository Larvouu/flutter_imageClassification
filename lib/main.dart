import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_classification/utils/utilsMethods.dart';
import 'package:image_classification/widgets/aquadex.dart';
import 'package:image_classification/widgets/speciesDetail.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);
  runApp(new App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        dividerTheme: DividerThemeData(
          space: 50,
          thickness: 1,
          color: Colors.white,
          indent: 0,
          endIndent: 0
        ),
      ),
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  File _image;
  List _results;

  String _speciesName = 'unknown';

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0C1641),
      appBar: AppBar(
        title: Text('Image classification'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (_image != null)
              Container(
                  margin: EdgeInsets.all(10),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(context, new MaterialPageRoute(builder: (BuildContext buildContext) {
                        return new SpeciesDetail(UtilsMethods.getSpeciesFromName(_speciesName));
                      }));
                    },
                    onLongPress: () {
                      Navigator.push(context, new MaterialPageRoute(builder: (BuildContext buildContext) {
                        return new Aquadex();
                      }));
                    },
                    child: Image.file(_image),
                  )
              )
            else
              Container(
                margin: EdgeInsets.all(40),
                child: Opacity(
                  opacity: 0.6,
                  child: Center(
                    child: Text('No Image Selected!'),
                  ),
                ),
              ),
            SingleChildScrollView(
              child: Column(
                children: _results != null
                    ? _results.map((result) {
                  return Card(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        "${result["label"]} -  ${result["confidence"].toStringAsFixed(2)}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                }).toList()
                    : [],
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: pickAnImage,
        tooltip: 'Select Image',
        child: Icon(Icons.image),
      ),
    );
  }

  Future loadModel() async {
    Tflite.close();
    String res;
    res = await Tflite.loadModel(
      //model: "assets/mobilenet_v1_1.0_224.tflite",
      //labels: "assets/mobilenet_v1_1.0_224.txt",
      model: "assets/TheRealmodel.tflite",
      labels: "assets/label_tiko.txt",
    );
    print(res);
  }

  Future pickAnImage() async {
    // pick image and...
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    // Perform image classification on the selected image.
    imageClassification(image);
  }

  Future imageClassification(File image) async {
    // Run tensorflowlite image classification model on the image
    final List results = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 1,
      //threshold: 0.40,
      imageMean: 0,
      //imageStd: 127.5,
    );
    print("RESULTATS : $results");
    setState(() {
      _results = results;
      _image = image;
      _speciesName = _results[0]["label"];
    });
    print("ESPECE : $_speciesName");
  }
  

}
