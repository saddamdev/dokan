import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

String userToken;

Future<int> registerUser(String name, String mail, String pass) async {
  try {
    final response = await http.post(
      "https://apptest.dokandemo.com/wp-json/wp/v2/users/register",
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
        {
          'username': name,
          'email': mail,
          'password': pass,
        },
      ),
    );
    return response.statusCode;
  } catch (e) {
    print(e);
    return 0;
  }
}

Future<int> loginUser(String name, String pass) async {
  try {
    final response = await http.post(
      'https://apptest.dokandemo.com/wp-json/jwt-auth/v1/token',
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {'username': name, 'password': pass},
    );
    final user = jsonDecode(response.body);
    userToken = user['token'];
    return response.statusCode;
  } catch (e) {
    print(e);
    return 0;
  }
}

Future<dynamic> getData() async {
  try {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/users');
    final data = jsonDecode(response.body);
    return data;
  } catch (e) {
    print(e);
  }
}

Future<String> updateUser(String fName, String lName) async {
  final decodedToken = JwtDecoder.decode(userToken);
  final userId = decodedToken['data']['user']['id'];

  final res = await http.post(
    "https://apptest.dokandemo.com/wp-json/wp/v2/users/$userId",
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $userToken'
    },
    body: jsonEncode(
      {'first_name': fName, 'last_name': lName},
    ),
  );

  final myInfo = jsonDecode(res.body);
  final fullName = myInfo['first_name'] + ' ' + myInfo['last_name'];
  return fullName;
}
