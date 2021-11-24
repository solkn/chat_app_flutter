import 'dart:convert';
import 'dart:async';
import 'dart:io';
import '../models/http_exception.dart';
import '../models/user.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class UserDataProvider {
  final http.Client httpClient;
  final baseUrl = "http://192.168.56.1:8080";

  UserDataProvider({@required this.httpClient}) : assert(httpClient != null);

  Future<List<User>> getUsers() async {
    final url = '$baseUrl/v1/user';
    List<User> users;
    try {

      final response = await httpClient.get(
        Uri.parse(url),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
      );

      if (response.statusCode == 200) {
        final extractedData = json.decode(response.body) as List<dynamic>;
        if (extractedData == null) {
          return null;
        }
        users = extractedData.map<User>((json) => User.fromJson(json)).toList();


      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw e;
    }
    return users;
  }

  Future<User> login(User user) async {
    User user1;
    final url = '$baseUrl/v1/user/login';
    try {
      final response = await http.post(
        Uri.parse(url),
        // body:json.encode(value{});
        body: jsonEncode(<String,dynamic>{
          'id': user.id,
          'first_name': user.firstName,
          "last_name":user.lastName,
          'email': user.email,
          'password': user.password,
        }),
      );
      print("the status code of logging state is:");
      print(response.statusCode);
      if (response.statusCode == 422) {
        throw HttpException('Invalid Input');
      } else if (response.statusCode == 404) {
        throw HttpException('Incorrect username or password');
      } else {
        user1 = User.fromJson(jsonDecode(response.body));
        //print('$user1.fullName');


      }
    } catch (e) {
      throw e;
    }
    return user1;
  }

  Future<User> signUp(User user) async {
    final urlEmailCheck = '$baseUrl/v1/user/email/${user.email}';
    final urlPostUser = '$baseUrl/v1/user/signup';
    User user1;
    try {
      var response = await httpClient.get(
        Uri.parse(urlEmailCheck),
      );
      if (response.statusCode == 200) {
        final isEmailExist = json.decode(response.body) as bool;
        if (isEmailExist) {
          throw HttpException('Email already exists!');
        } else {
          response = await httpClient.post(
            Uri.parse(urlPostUser),
            body: json.encode({
              'id': user.id,
              "first_name": user.firstName,
              "last_name": user.lastName,
              "email": user.email,
              "password": user.password,
            }),
            headers: {
              HttpHeaders.contentTypeHeader: "application/json",
            },
          );
          print("status code is:");
          print(response.statusCode);
          if (response.statusCode == 200) {
            final extractedData =
            json.decode(response.body) as Map<String, dynamic>;
            user1 = User.fromJson(extractedData);
            print(user1.firstName);
          } else {
            throw HttpException('Error occurred');
          }
        }
      } else {
        throw HttpException('Error occurred !');
      }
    } catch (e) {
      throw e;
    }
    return user1;
  }

  Future<User> updateUser(User user) async {
    User updated;
    final url = '$baseUrl/user/${user.id}';
    try {
      final response = await httpClient.put(
        Uri.parse(url),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: json.encode({
          'id': user.id,
          'first_name':user.firstName,
          'last_name':user.lastName,
          'email':user.email,
          'password':user.password,
        }),
      );
      if (response.statusCode == 200) {
        final extractedData = json.decode(response.body);
        updated = User.fromJson(extractedData);
      } else {
        throw HttpException('Error Occurred');
      }
    } catch (e) {
      print(e.toString());
      throw e;
    }
    return updated;
  }

  Future<User> updateUserPassword(User user, String oldPassword) async {
    User updated;
    final url = '$baseUrl/v1/user/${user.id}';
    final urlCheckPassword = '$baseUrl/v1/user/password/${user.id}';
    try {
      final response = await httpClient.post(
        Uri.parse(urlCheckPassword),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",

        },
        body: json.encode({
          'id': user.id,
          'first_name':user.firstName,
          'last_name':user.lastName,
          'email':user.email,
          'password':user.password,
        }),
      );
      if (response.statusCode == 200) {
        final response2 = await httpClient.put(
          Uri.parse(url),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",

          },
          body: json.encode({
            'id': user.id,
            'first_name':user.firstName,
            'last_name':user.lastName,
            'email':user.lastName,
            'password':user.password,
          }),
        );
        if (response2.statusCode == 200) {
          final extractedData =
          json.decode(response2.body) as Map<String, dynamic>;
          updated = User.fromJson(extractedData);
        } else {
          throw HttpException('Error Occurred');
        }
      } else if (response.statusCode == 404) {
        throw HttpException('Incorrect Old Password');
      } else {
        throw HttpException('Error Occurred');
      }
    } catch (e) {
      print(e.toString());
      throw e;
    }
    return updated;
  }
}