
  
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:todo_app/model/quotes.dart';

class QuoteService {
  final String url = "https://type.fit/api/quotes";

  Future<List<Quotes>> getQuotes() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> resp = jsonDecode(response.body);

      List<Quotes> quotes = resp.map((dynamic item) => Quotes.fromJson(item)).toList();

      return quotes;
    } else {
      throw Exception('Failed to load quotes');
    }
  }

  Future<Quotes?> getRandomQuote() async {
    final quotes = await getQuotes();
    if (quotes.isNotEmpty) {
      // Listeden rastgele bir alıntı seç
      final randomIndex = Random().nextInt(quotes.length);
      return quotes[randomIndex];
    }
    return null;
  }
}
