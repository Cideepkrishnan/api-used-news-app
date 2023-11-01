import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news/model/model.dart';
import 'package:http/http.dart' as http;

class Homescreen_provider with ChangeNotifier {
  bool is_loading = false;
  bool iscategoryloading = false;
  Publicapiresponse? datamodel;

  Fetchnews({String searchQuery = "trending"}) async {
    is_loading = true;
    notifyListeners();

    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$searchQuery&apiKey=171c6e369bdf4b229dc8c92bb3a87f4c");
    final response = await http.get(url);
    var decodedData = jsonDecode(response.body);

    datamodel = Publicapiresponse.fromJson(decodedData);
    is_loading = false;
    notifyListeners();
  }

//sports
  fetchCategorySports({String category = "sports"}) async {
    iscategoryloading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$category&apiKey=171c6e369bdf4b229dc8c92bb3a87f4c");
    final response = await http.get(url);
    var decpdedData = jsonDecode(response.body);
    datamodel = Publicapiresponse.fromJson(decpdedData);
    iscategoryloading = false;
    notifyListeners();
  }

//health
  fetchCategoryHealth({String category = "Health"}) async {
    iscategoryloading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$category&apiKey=171c6e369bdf4b229dc8c92bb3a87f4c");
    final response = await http.get(url);
    var decpdedData = jsonDecode(response.body);
    datamodel = Publicapiresponse.fromJson(decpdedData);
    iscategoryloading = false;
    notifyListeners();
  }


//technology
  fetchCategoryTechnology({String category = "Technology"}) async {
    iscategoryloading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$category&apiKey=171c6e369bdf4b229dc8c92bb3a87f4c");
    final response = await http.get(url);
    var decpdedData = jsonDecode(response.body);
    datamodel = Publicapiresponse.fromJson(decpdedData);
    iscategoryloading = false;
    notifyListeners();
  }


//business
  fetchCategoryBussines({String category = "Bussiness"}) async {
    iscategoryloading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$category&apiKey=171c6e369bdf4b229dc8c92bb3a87f4c");
    final response = await http.get(url);
    var decpdedData = jsonDecode(response.body);
    datamodel = Publicapiresponse.fromJson(decpdedData);
    iscategoryloading = false;
    notifyListeners();
  }


//science
   fetchCategoryScience({String category = "Science"}) async {
    iscategoryloading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$category&apiKey=171c6e369bdf4b229dc8c92bb3a87f4c");
    final response = await http.get(url);
    var decpdedData = jsonDecode(response.body);
    datamodel = Publicapiresponse.fromJson(decpdedData);
    iscategoryloading = false;
    notifyListeners();
  }


//general
  fetchCategoryGeneral({String category = "General"}) async {
    iscategoryloading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$category&apiKey=171c6e369bdf4b229dc8c92bb3a87f4c");
    final response = await http.get(url);
    var decpdedData = jsonDecode(response.body);
    datamodel = Publicapiresponse.fromJson(decpdedData);
    iscategoryloading = false;
    notifyListeners();
  }
}
