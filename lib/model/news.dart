class News{
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String content;
  Source source;

  News({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.content,
    this.source
  });

  factory News.fromJson(Map<String, dynamic> json){
    return News(
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      content: json['content'],
      source: Source.fromJson(json['source'])
    );
  }
}

class Source{
  String id;
  String name;

  Source({
    this.id,
    this.name
  });

  factory Source.fromJson(Map<String, dynamic> json){
    return Source(
      id:json['id'],
      name: json['name']
    );
  }
}