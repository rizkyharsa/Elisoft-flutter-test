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
