class Article {
  int? code;
  bool? status;
  String? message;
  List<ArticleElement>? articles;

  Article({
    this.code,
    this.status,
    this.message,
    this.articles,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        articles: json["articles"] == null
            ? []
            : List<ArticleElement>.from(json["articles"]!.map((x) => ArticleElement.fromJson(x))),
      );
}

class ArticleElement {
  String? uuid;
  String? title;
  String? content;
  String? image;
  int? views;
  Created? created;
  User? user;

  ArticleElement({
    this.uuid,
    this.title,
    this.content,
    this.image,
    this.views,
    this.created,
    this.user,
  });

  factory ArticleElement.fromJson(Map<String, dynamic> json) => ArticleElement(
        uuid: json["uuid"],
        title: json["title"],
        content: json["content"],
        image: json["image"],
        views: json["views"],
        created: json["created"] == null ? null : Created.fromJson(json["created"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );
}

class Created {
  DateTime? date;
  int? timezoneType;
  String? timezone;

  Created({
    this.date,
    this.timezoneType,
    this.timezone,
  });

  factory Created.fromJson(Map<String, dynamic> json) => Created(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        timezoneType: json["timezone_type"],
        timezone: json["timezone"],
      );
}

class User {
  String? name;
  String? email;
  String? phoneNumber;
  Created? created;
  String? uuid;

  User({
    this.name,
    this.email,
    this.phoneNumber,
    this.created,
    this.uuid,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        created: json["created"] == null ? null : Created.fromJson(json["created"]),
        uuid: json["uuid"],
      );
}
