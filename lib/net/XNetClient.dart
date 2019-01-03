import 'package:http/http.dart' as http;
import 'dart:convert';

class _XNetClient {
  XNetClientBuilder _builder;

  _XNetClient(builder) : _builder = builder;

  void request() async {
    if (_builder._url.isEmpty) {
      throw ArgumentError("url is empty");
    }
    try {
      http.Response response;
      if (_builder._method == XNetClientBuilder.POST) {
        dynamic body = _builder._paramBody != null ? _builder._paramBody : _builder._params;
        response = await http.post(_builder._url, body: body, headers: _builder._headers);
      } else if (_builder._method == XNetClientBuilder.PUT) {
        dynamic body = _builder._paramBody != null ? _builder._paramBody : _builder._params;
        response = await http.put(_builder._url, body: body, headers: _builder._headers);
      } else {
        String url = _builder._url;
        if (_builder._params.isNotEmpty) {
          StringBuffer sb = new StringBuffer("?");
          _builder._params.forEach((key, value) {
            sb.write("$key" + "=$value" + "&");
          });
          url = sb.toString().substring(0, sb.length - 1);
        }
        response = await http.get(url, headers: _builder._headers);
      }

      if (response.statusCode == 200 && _builder._onSuccess != null) {
        _builder._onSuccess(
            response.statusCode, json.decode(response.body), "");
      } else {
        _builder._onFailure(response.statusCode, response.body);
      }
    } catch (e) {
      if (_builder._onFailure != null) {
        _builder._onFailure(9999, e.toString());
      }
    }
  }
}

typedef void OnSuccess<T>(int code, T data, String msg);
typedef void OnFailure(int code, String error);

class XNetClientBuilder {
  static const String GET = "get";
  static const String POST = "post";
  static const String PUT = "put";

  var _url = "";
  var _method = GET;
  var _params = Map<String, Object>();
  var _headers = Map<String, String>();
  dynamic _paramBody;
  OnSuccess _onSuccess;
  OnFailure _onFailure;

  XNetClientBuilder url(String url) {
    this._url = url;
    return this;
  }

  XNetClientBuilder method(String method) {
    this._method = method;
    return this;
  }

  XNetClientBuilder onSuccess(OnSuccess onSuccess) {
    this._onSuccess = onSuccess;
    return this;
  }

  XNetClientBuilder onFailure(OnFailure onFailure) {
    this._onFailure = onFailure;
    return this;
  }

  XNetClientBuilder param(String key, Object value) {
    this._params[key] = value;
    return this;
  }

  XNetClientBuilder paramBody(dynamic body) {
    this._paramBody = body;
    return this;
  }

  XNetClientBuilder params(Map<String, Object> params) {
    this._params.addAll(params);
    return this;
  }

  XNetClientBuilder header(String key, String value) {
    this._headers[key] = value;
    return this;
  }

  XNetClientBuilder headers(Map<String, String> headers) {
    this._headers.addAll(headers);
    return this;
  }

  _XNetClient build() {
    return _XNetClient(this);
  }

  void request() {
    _XNetClient(this).request();
  }
}
