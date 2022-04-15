import 'dart:io';
import 'dart:convert' as convert;
import 'package:dio/dio.dart';

class ReportUI {
  static Future<String> predictBreed(File imagePicker) async {
    File image = File(imagePicker.path);
    var formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(image.path)
    });
    var response = await Dio().post('https://breedpredictor-qvdglufpcq-as.a.run.app/predict', data: formData);
    if (response.statusCode == 200){
      var jsonResponse = convert.jsonDecode(response.toString()) as Map<String, dynamic>;
      var breed = jsonResponse['result'];
      return breed;
    } else {
      throw "Request failed with status: ${response.statusCode}.";
    }
  }
  
}