import 'package:flutter/material.dart';
import 'package:todo_app/model/quotes.dart';
import 'package:todo_app/service/quote_service.dart';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({super.key});

  @override
  _QuotesScreenState createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  final QuoteService quoteService = QuoteService();
  Quotes? currentQuote;

  Future<void> randomQuote() async {
  
      final quote = await quoteService.getRandomQuote();
      setState(() {
        currentQuote = quote;
      });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[300],
      
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[300],
        title: const Text('Random Quote'),
      ),
      body: Center(
        
        child: Column( 
          
        
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (currentQuote != null) 
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      currentQuote!.text ?? 'No text',
                      style:  TextStyle(fontSize: 24, fontWeight: FontWeight.bold,
                      color: Colors.lightGreen[500]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    currentQuote!.author ?? 'No author',
                    style:  TextStyle(fontSize: 15, fontStyle: FontStyle.italic,
                    
                     fontWeight:FontWeight.w100,
                     color: Colors.grey[900],
                     
                      ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
           const  SizedBox(height: 40),
            ElevatedButton(

              style: ElevatedButton.styleFrom(

                backgroundColor: Colors.lightGreen[500],
                padding: const EdgeInsets.all(20),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
              ),



              onPressed: randomQuote,
              child: const Text(' Daily Quote', style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
