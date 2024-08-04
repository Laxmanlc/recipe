import 'dart:convert';

// ignore: library_prefixes
import 'package:flutter/services.dart' as rootBundle;
import 'package:recipe/recipe_screen/recipemodel.dart';

Future<List<RecipeModel>> readJsonData() async {
  final jsondata =
      await rootBundle.rootBundle.loadString('json/allrecpie.json');
  final list = json.decode(jsondata) as List<dynamic>;
  return list.map((e) => RecipeModel.fromJson(e)).toList();
}

// ! for sweets screen
Future<List<SrecipeModel>> readJsonDatasweet() async {
  final jsondata = await rootBundle.rootBundle.loadString('json/sweets.json');
  final slist = json.decode(jsondata) as List<dynamic>;
  return slist.map((e) => SrecipeModel.fromJson(e)).toList();
}
// ! this is for the festival special

Future<List<FrecipeModel>> readJsonDatafestival() async {
  final jsondata = await rootBundle.rootBundle.loadString('json/festival.json');
  final flist = json.decode(jsondata) as List<dynamic>;
  return flist.map((e) => FrecipeModel.fromJson(e)).toList();
}
