class PostModel{  
   int? userId;
   int? id;   
   String? title;
   String? body;
  PostModel(this.id,this.userId,this.title,this.body);

  factory PostModel.fromJson(dynamic json) {
    return PostModel(      
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