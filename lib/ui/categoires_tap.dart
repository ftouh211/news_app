import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/ui/catigory_item.dart';

class CategoiresTap extends StatelessWidget {
  Function onClick;
  CategoiresTap({required this.onClick, super.key});


  var cateogires = CatogeryModel.getCategoires();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            "Pick your category of interest",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 12,crossAxisSpacing: 12),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    onClick(cateogires[index]);
                  },
                  child: CatigoryItem(catogeryModel: cateogires[index],
                  isOdd: index.isOdd,),
                );
              },
              itemCount: cateogires.length,
            ),
          )
        ],
      ),
    );
  }
}
