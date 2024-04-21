import 'package:dio/dio.dart';

import '../model/user.dart';

class SignUpService{
  final dio = Dio();

  Future<void> signUpUser(User user) async {
    try {
      final response = await dio.post(
        'https://fxrl0qhxl9.execute-api.ap-south-1.amazonaws.com/Prod/user/signup',
        data: {
          "phoneNumber": "98914814312",
          "fullName": "Taz Men2",
          "age": 97,
          "height": 140,
          "weight": 178,
          "gender": "MALE",
          "hairType": "STRAIGHT",
          "skin": "LIGHT",
          "introduction": "",
          "nationality": "",
          "pronouns": "",
          "languages" : ""
        }
        ,
        options: Options(
          contentType: Headers.jsonContentType,
        ),
      );

      if (response.statusCode == 200) {
        // Handle successful response
        print('User signed up successfully');
      } else {
        // Handle other status codes
        print('Error: ${response.statusCode}');
      }
    } catch (error) {
      // Handle error
      print('Error: $error');
    }
  }
}
