import 'package:flutter/material.dart';
import 'package:news_app/models/sorces_response.dart';

class TabItem extends StatelessWidget {
  Sources sources;
  bool isSelected;
  TabItem({required this.sources, required this.isSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.green),
        ),
        child: Text(
          sources.name ?? "",
          style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 18,
              color: isSelected ? Colors.white : Colors.green),
        ));
  }
}
