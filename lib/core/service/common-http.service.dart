import 'package:http/http.dart';

class CommonHttp {
  Map<String, String> createHeaders() {
    //aqui poderia chamar o token do firebase e injetar no header...
    Map<String, String> _header = {"Content-type": "aplication/json"};
    return _header;
  }

  Future<Response> httpGet(String url) async {
    final _headers = createHeaders();
    return await get(url, headers: _headers);
  }
}
