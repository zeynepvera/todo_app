class Quotes {
  String? text;
  String? author;

  Quotes({
    required this.text, required this.author});

  Quotes.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    author = json['author'];
  }

  /*Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['text'] = text;
    data['author'] = author;
    return data;
  }*/
}
