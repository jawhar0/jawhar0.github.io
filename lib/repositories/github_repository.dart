import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class IGithubDataRepository {
  getData();
}

class GithubDataRepository implements IGithubDataRepository {
  final _baseURL = "https://api.github.com/users/maherjaafar/repos";

  @override
  getData() async {
    try {
      final response = await http.get(_baseURL);
      if (response.statusCode == 200) {
        print("data is ${response.body}");
        return json.decode(response.body);
      } else
        return "error occured";
    } catch (e) {
      throw e.toString();
    }
  }
}
