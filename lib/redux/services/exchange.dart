import 'dart:convert';
import 'dart:io';
import 'package:exchange/redux/models/rate.dart';
import 'package:http/http.dart' as http;

class ExchangeApiService {

  final String _baseURL = "api.exchangeratesapi.io";

  ExchangeApiService();

  
  // GET ALL RATES
  Future<Rate> getAll() async {
    Map<String, String> queryParameters = {'base': 'USD'};

    Uri uri = Uri.https(_baseURL,'/latest',queryParameters);
    
    Map<String, String> header = {HttpHeaders.contentTypeHeader: 'application/json'};

    var response = await http.get(uri,headers: header);
    
    Map<String, dynamic> body = json.decode(response.body);
    
    Rate rate = Rate.fromJson(body);
    // log(body.toString());
    return rate;
  }

  Future<Rate> changeBase(String base) async {

    Map<String, String> queryParameters = {'base': base};

    Uri uri = Uri.https(_baseURL,'/latest',queryParameters);
    
    Map<String, String> header = {HttpHeaders.contentTypeHeader: 'application/json'};

    var response = await http.get(uri,headers: header);
    
    Map<String, dynamic> body = json.decode(response.body);
    
    Rate rate = Rate.fromJson(body);
    return rate;
  }

  // CURRENT GET RATE BETWEEN 2 CURRENCIES

  // GET RATE BETWEEN 2 CURRENCIES ON A SPECIFIC DAY
}