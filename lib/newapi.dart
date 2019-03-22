import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'package:workshop_newsapi/DetailBerita.dart';

import 'API.dart';

class NewsAPIIndonesia extends StatefulWidget{

   @override
  _NewsAPIState createState() => _NewsAPIState();
}

class _NewsAPIState extends State<NewsAPIIndonesia>{
  Future<List> _future = API().getTopHeadlines();

  @override
  Widget build (BuildContext context){
    return Scaffold(
      body: new FutureBuilder(
        future: _future,
        builder: (BuildContext context, AsyncSnapshot<List> snapshot){
          if(!snapshot.hasData){
            return new Container(
              child: new Center(
                child: new CircularProgressIndicator(),
              ),
            );
          }
          
          return ListView.builder(
            itemCount: snapshot.data.length == 0 ? 0 : snapshot.data.length,
            itemBuilder: (BuildContext context, int index){
              
              return new ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  new Padding(padding: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0)),
                  new Card(
                      elevation: 3.0,
                      child: new ListTile(
                        onTap: (){
                          Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => DetailBerita(
                                          newsModel: snapshot.data[index],
                                        )
                            ));
                          },
                        leading: new CircleAvatar(
                          backgroundImage: NetworkImage(snapshot.data[index].urlToImage == null ? snapshot.data[index].author.toString().substring(0,1) : snapshot.data[index].urlToImage),
                          ),

                        title: new Text(snapshot.data[index].title,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontWeight: FontWeight.bold),
                          ),

                        subtitle: new Text(
                          snapshot.data[index].description ?? '' ,
                          textAlign: TextAlign.justify,),
                      ),
                    ),
                ],
              );
            },
          );
        },
      )
    );
  }
}

_launchURL(String urlTarget) async {
  String url = urlTarget;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
