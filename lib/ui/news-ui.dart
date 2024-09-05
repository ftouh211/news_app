import 'package:flutter/material.dart';
import 'package:news_app/ui/news_item.dart';
import 'package:news_app/utils/api_manager.dart';
import 'package:news_app/models/sorces_response.dart';
import 'package:news_app/ui/tab_item.dart';

class News_ui extends StatefulWidget {
  String id;
  News_ui({required this.id, super.key});

  @override
  State<News_ui> createState() => _News_uiState();
}

class _News_uiState extends State<News_ui> {
  int selectedTabIndex = 0;
  List<Sources> sources = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(widget.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text("something went wrong");
        }

        sources = snapshot.data?.sources ?? [];

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              DefaultTabController(
                  length: sources.length,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TabBar(
                        onTap: (value) {
                          selectedTabIndex = value;
                          setState(() {});
                        },
                        dividerColor: Colors.transparent,
                        indicator: UnderlineTabIndicator(
                            borderSide: BorderSide(color: Colors.transparent)),
                        // labelColor: Colors.white,
                        // unselectedLabelColor: Colors.transparent,
                        // indicator: BoxDecoration(
                        //     border: Border.all(
                        //       color: Colors.green,
                        //       width: 1,
                        //     ),
                        //     borderRadius: BorderRadius.all(Radius.circular(20)),
                        //     color: Colors.green),
                        isScrollable: true,
                        tabs: sources
                            .map((e) => TabItem(
                                  sources: e,
                                  isSelected:
                                      sources.elementAt(selectedTabIndex) == e,
                                ))
                            .toList()),
                  )),
              FutureBuilder(
                  future: ApiManager.getNewsData(sources[selectedTabIndex].id??""),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Text("something went wrong");
                    }

                    var articals = snapshot.data?.articles ?? [];
                    return Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                        itemBuilder: (context, index) {
                          return NewsItem(article: articals[index],);
                        },
                        itemCount: articals.length,
                      ),
                    );
                  }),

            ],
          ),
        );
      },
    );
  }
}
