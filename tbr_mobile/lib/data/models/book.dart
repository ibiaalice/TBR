class Book {
  int id;
  String title;
  String gender;
  bool isRaffle;

  Book({this.id, this.title, this.gender, this.isRaffle});

  factory Book.fromMap(Map<String, dynamic> json) => new Book(
        id: json['id'],
        title: json['title'],
        gender: json['description'],
        isRaffle: json['isRaffle'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'gender': gender,
        'isRaffle': isRaffle,
      };
}
