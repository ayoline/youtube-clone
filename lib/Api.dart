import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:youtube_clone/model/Video.dart';

// confirguração passada no arquivo launch.json para mascarar a chave no repositório
const CHAVE_YOUTUBE_API = String.fromEnvironment('APIKEY');
const ID_CANAL = 'UC2bZgihqibFD_vhaYEXQZFg';
const URL_BASE = 'https://www.googleapis.com/youtube/v3/';

class Api {
  Future<List<Video>> pesquisar(String pesquisa) async {
    var url = Uri.parse(URL_BASE +
        'search'
            '?part=snippet'
            '&type=video'
            '&maxResults=20'
            '&key=$CHAVE_YOUTUBE_API'
            '&channelId=$ID_CANAL'
            '&q=$pesquisa');
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);

      List<Video> videos = dadosJson['items'].map<Video>((map) {
        return Video.fromJson(map);
        //return Video.coverterJson(map);
      }).toList();

      return videos;

      //print('resultado: ' + dadosJson['pageInfo'].toString());
    }
    throw ('');
  }
}
