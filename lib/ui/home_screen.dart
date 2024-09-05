import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/ui/categoires_tap.dart';
import 'package:news_app/utils/api_manager.dart';
import 'package:news_app/ui/news-ui.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image:
              DecorationImage(image: AssetImage("assets/images/pattern.png"))),
      child: Scaffold(
        drawer: Drawer(),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          // backgroundColor: Colors.transparent,
          // leading: IconButton(
          //     onPressed: () {},
          //     icon: Icon(
          //       Icons.menu,
          //       color: Colors.white,
          //     )),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 40,
                  ),
                ))
          ],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(35),
            bottomRight: Radius.circular(35),
          )),
          iconTheme: IconThemeData(
            color: Colors.white,
            size: 30,
          ),
          title: Text(
            "News App",
            style: GoogleFonts.exo(
                fontSize: 22, fontWeight: FontWeight.w300, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Color(0xff39A552),
        ),
        body: catogeryModel == null
            ? CategoiresTap(
                onClick: onCategorySelected,
              )
            : News_ui(id: catogeryModel!.id),
      ),
    );
  }

  CatogeryModel? catogeryModel = null;

  onCategorySelected(cat) {
    catogeryModel = cat;
    setState(() {});
  }
}
