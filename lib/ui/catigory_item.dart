import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';

class CatigoryItem extends StatelessWidget {
  CatogeryModel catogeryModel;
  bool isOdd;
   CatigoryItem({required this.isOdd, required this.catogeryModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: catogeryModel.color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
          bottomLeft: !isOdd ? Radius.circular(25) : Radius.zero,
          bottomRight: isOdd ? Radius.circular(25) : Radius.zero,
        ),
      ),
      child: Column(
        children: [
          Expanded(child: Image.asset(catogeryModel.image)),
          Text(catogeryModel.name,style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400,color: Colors.white),),
        ],
      ),
    );
  }
}
