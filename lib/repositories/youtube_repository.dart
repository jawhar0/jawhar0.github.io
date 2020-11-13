import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class IYoutubeRepository {
  getData();
}

class YoutubeRepository implements IYoutubeRepository {
  final _baseURL =
      "https://www.googleapis.com/youtube/v3/search?key=AIzaSyDegc8zGm4V7VEDBa8R8acpfHWbBhV_Q_4&channelId=UCdnbsZZlHKGivUXaVo4EP1Q&part=snippet,id&order=date&maxResults=30";

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
