import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer show log;

class HomeController extends GetxController {
  @override
  onInit() {
    getDataFromPhotoMath();
    super.onInit();
  }

  getDataFromPhotoMath() async {
    http.MultipartRequest request = http.MultipartRequest(
      'POST',
      Uri.parse('https://photomath1.p.rapidapi.com/maths/solve-problem'),
    );
    request.headers.addAll({
      'X-RapidAPI-Key': '4007e7082bmsh46bff49b82fe990p1fbc57jsna6468573c702',
      'X-RapidAPI-Host': 'photomath1.p.rapidapi.com',
    });

    request.fields['locale'] = 'en';
    request.files.add(
      await http.MultipartFile.fromPath(
        'image',
        'assets/images/image1.jpeg',
      ),
    );
    var response = await request.send();
    final data = await response.stream.bytesToString();
    developer.log(data.toString());
  }
}

/*
  const FormData = require("form-data");
const fs = require("fs");
const axios = require("axios");

const data = new FormData();
data.append("locale", "en");
data.append("image", fs.createReadStream("/PATH/TO/image1.jpeg"));

const options = {
  method: 'POST',
  url: 'https://photomath1.p.rapidapi.com/maths/solve-problem',
  headers: {
    'X-RapidAPI-Key': '4007e7082bmsh46bff49b82fe990p1fbc57jsna6468573c702',
    'X-RapidAPI-Host': 'photomath1.p.rapidapi.com',
    ...data.getHeaders()
  },
  data: data
};

axios.request(options).then(function (response) {
	console.log(response.data);
}).catch(function (error) {
	console.error(error);
});
*/
