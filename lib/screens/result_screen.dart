import 'package:flutter/material.dart';
import 'package:home_work_8/components/reuseable_card.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({
    super.key,
    required this.bmi,
    required this.feedback,
    required this.result,
  });

  final String bmi;
  final String result;
  final String feedback;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 35,
          elevation: 2,
          backgroundColor: const Color(0xFF848386),
          title: const Text(
            'Ден соолук индекси (BMI)',
            style: TextStyle(fontSize: 15),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Center(
                child: Text(
                  'Жыйынтык',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ReuseableCard(
                color: const Color(0xff1d1e33),
                myChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.result,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: Colors.green),
                    ),
                    Text(
                      widget.bmi,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 80),
                    ),
                    Text(widget.feedback,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18))
                  ],
                ),
                onPress: () {}),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  minimumSize: const Size(double.infinity, 45)),
              child: const Text(
                'Кайра эсептеңиз',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
