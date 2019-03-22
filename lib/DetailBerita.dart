import 'package:flutter/material.dart';
import 'package:workshop_newsapi/model/news.dart';

class DetailBerita extends StatelessWidget{
  final News newsModel;

  DetailBerita({
    Key key, @required this.newsModel
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          newsModel.source.name
        ),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Card(
                  elevation: 8,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          newsModel.title,
                          maxLines: 4,
                          textAlign: TextAlign.justify,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          newsModel.author == null ? '' : 'Penulis: ' + newsModel.author,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.grey[800]
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Image.network(
                          newsModel.urlToImage,
                          width: 320,),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          newsModel.content,
                          maxLines: 50,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}