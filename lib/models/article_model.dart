class ArticleModel{  
   int? userId;
   int? id;   
   String? title;
   String? body;
  ArticleModel(this.id,this.userId,this.title,this.body);

  factory ArticleModel.fromJson(dynamic json) {
    return ArticleModel(      
      json['userId'] as int?,
      json['id'] as int?,
      json['title'] as String?,
      json['body'] as String?
      );
  }

  @override
  String toString() {
    // ignore: unnecessary_this
    return '{ ${this.id},${this.userId},${this.title},${this.body}}';
  }
  Map<String, dynamic> toMap() => {    
        "userId": userId,
        "id": id,
        "title": title,
        "body": body
      };
}