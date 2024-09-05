import 'package:flutter/material.dart';

class CatogeryModel {
  String id;
  String name;
  String image;
  Color color;

  CatogeryModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.color});

  static List<CatogeryModel> getCategoires() {
    return [
      CatogeryModel(
          id: "business",
          name: "Business",
          image: "assets/images/bussines.png",
          color: Color(0xffCF7E48)),
      CatogeryModel(
          id: "entertainment",
          name: "Entertainment",
          image: "assets/images/environment.png",
          color: Color(0xff4882CF)),
      CatogeryModel(
          id: "general",
          name: "General",
          image: "assets/images/Politics.png",
          color: Color(0xff003E90)),
      CatogeryModel(
          id: "health",
          name: "Health",
          image: "assets/images/health.png",
          color: Color(0xffED1E79)),
      CatogeryModel(
          id: "science",
          name: "Science",
          image: "assets/images/science.png",
          color: Color(0xffF2D352)),
      CatogeryModel(
          id: "sports",
          name: "Sports",
          image: "assets/images/sports.png",
          color: Color(0xffC91C22)),
      CatogeryModel(
          id: "technology",
          name: "Technology",
          image: "assets/images/pattern.png",
          color: Color(0xff)),
    ];
  }
}
