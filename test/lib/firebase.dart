import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:requests/requests.dart';
import 'package:flutter/material.dart';
import 'api/firebase_api.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:firebase_core/firebase_core.dart';


Future Skin_server() async{
  var url = Uri.parse('https://skin-test.herokuapp.com/skin-classifier/');
  Map<String,String> headers = {'Content-Type': 'application/json', 'Accept': 'text/plain'};
  final msg = jsonEncode({'image': 'https://i.imgur.com/IiUAtBZ.jpg', 'format': "url"});
  var response = await http.post(url,
      headers:headers,
      body:msg
  );
  print("${response.statusCode}");
  print("${response.body}");
  Map<String, dynamic> outcome = jsonDecode(response.body);
  print(outcome['prediction']);
  List<String> strarray = response.body.split(":");
  print(strarray[0]);
  print('end');
  return 'ok';
}
