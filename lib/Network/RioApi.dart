import 'package:http/http.dart' as http;
import 'dart:convert';

class RioApi {
  final String name;
  final String realm;
  final String region;

  RioApi({
    required this.name,
    required this.region,
    required this.realm,
  });

  Future getData() async {
    String fields = '&fields=mythic_plus_scores%2Cgear%2Craid_progression';
    String api =
        'https://raider.io/api/v1/characters/profile?region=$region&realm=$realm&name=$name$fields';
    http.Response response = await http.get(Uri.parse(api));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return 404;
    }
  }
}
