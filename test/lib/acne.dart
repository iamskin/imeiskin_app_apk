import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:test01/result.dart';
import 'result.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api/firebase_api.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'customShape.dart';

class acne extends StatefulWidget {
  const acne({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<acne> createState() => acneState();
}

class acneState extends State<acne> {

  String? _imageFile;
  var _width;
  String result_value = 'Test Failed';
///////////////////////////////////////////////////////////////
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  File? _photo;
  UploadTask? task;
  final ImagePicker _picker = ImagePicker();

  Future uploadFile() async {
    SmartDialog.showLoading();
    await Future.delayed(Duration(seconds: 2));

    if (_photo == null) return;
    final fileName = basename(_photo!.path);
    final destination = 'files/$fileName';
    task = FirebaseApi.uploadFile(destination, _photo!);
    setState(() {});
    if (task == null) return;
    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    print('start');
    var url = Uri.parse('https://86a0-140-116-191-194.jp.ngrok.io/acne-classifier/');
    Map<String,String> headers = {'Content-Type': 'application/json', 'Accept': 'text/plain'};
    final msg = jsonEncode({'image': urlDownload, 'format': "url"});
    var response = await http.post(url,
        headers:headers,
        body:msg
    );
    print("${response.statusCode}");
    print("${response.body}");
    Map<String, dynamic> outcome = jsonDecode(response.body);
    print(outcome['prediction']);

    if (outcome['prediction'] == 'Mild'){
      print('Mild');
      result_value = 'Mild';
    }
    else if (outcome['prediction'] == 'Moderate'){
      print('Moderate');
      result_value = 'Moderate';
    }
    else if (outcome['prediction'] == 'Severe'){
      print('Severe');
      result_value = 'Severe';
    }
    else if (outcome['prediction'] == 'Very-Severe'){
      print('Very-Severe');
      result_value = 'Very-Severe';
    }
    print('end');
    SmartDialog.dismiss();
    return 'ok';
  }

  Future<Null> _cropImage(filePath) async {
    CroppedFile croppedImage = (await ImageCropper().cropImage(
        sourcePath: filePath,
        maxWidth: 1080,
        maxHeight: 1080,
        aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0)
    )) as CroppedFile;
    _photo = File(croppedImage.path);
    _imageFile = _photo!.path;
    uploadFile();

  }

  @override
  Widget build(BuildContext context) {

    _width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/image/bg6.png"),
                  fit: BoxFit.cover
              )
          ),
          child: ListView(
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                          '\n痘痘檢測 Acne Care\n',
                          style: TextStyle(fontSize: 25.0, color: Colors.black,),
                          textAlign: TextAlign.center
                      ),
                      const Text(
                          '\n運用人工智慧評估痘痘嚴重程度，\n取得痘痘嚴重程度結果圖，\n以及痘痘照護衛教資訊。\n\n',
                          style: TextStyle(fontSize: 15.0, color: Colors.black),
                          textAlign: TextAlign.center
                      ),
                      const Text(
                        '請選擇照片上傳方式\n',
                        style: TextStyle(fontSize: 20.0, color: Colors.black),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: _previewImage(context),
                        ),
                      ),
                      const Text(
                        '\n',
                        style: TextStyle(fontSize: 25.0, color: Colors.black),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),

                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                backgroundColor: Color(0xffb89a79),
                              ),
                              onPressed: ()
                              async {
                                final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
                                _cropImage(pickedFile!.path);
                              },
                              //padding: const EdgeInsets.all(20),
                              child: const Text(
                                  '     上傳照片     ', style: TextStyle(color: Colors
                                  .white, fontSize: 20)),
                            ),
                          ),
                          const Text(
                            '   ',
                            style: TextStyle(fontSize: 25.0, color: Colors.black),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                backgroundColor: Color(0xffb89a79),
                              ),
                              onPressed: ()
                              async {
                                final pickedFile = await _picker.pickImage(source: ImageSource.camera);
                                _cropImage(pickedFile!.path);
                              },
                              //padding: const EdgeInsets.all(20),
                              child: const Text('        拍  照        ',
                                  style: TextStyle(color: Colors.white,
                                      fontSize: 20)),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),

                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            backgroundColor: Color(0xffb89a79),
                          ),
                          onPressed: ()
                          {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => result(title: result_value)),
                            );
                          },
                          //padding: const EdgeInsets.all(20),
                          child: const Text(
                              '     查看檢測結果     ', style: TextStyle(color: Colors
                              .white, fontSize: 20)),
                        ),
                      ),
                    ]
                )
              ]
          ),
        )
    );

  }

  Widget _previewImage(
      BuildContext context,
      ) {
    _width = MediaQuery.of(context).size.width;
    if (_imageFile != null) {
      return Container(
        height: _width * 0.34,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: Colors.grey,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.file(
            _photo!,
            height: _width * 0.34,
            width: _width,
            alignment: Alignment.center,
            fit: BoxFit.fitWidth,
          ),
        ),
      );
    } else {
      return Container(
        height: _width * 0.34,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/image/uploadbg.png"),
              fit: BoxFit.cover
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: Colors.grey,
        ),
        child: Center(
          child: Image.asset(
            'assets/image/upload.png',
            width: 50,
            height: 50,
          ),
        ),
      );
    }
  }

}