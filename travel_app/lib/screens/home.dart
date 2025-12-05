import 'package:flutter/material.dart';
import 'package:travel_app/components/button.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(210, 232, 246, 1),
        title: Text(
          "JWT Tokens"
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Text(
              "Access Token",
              style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(210, 232, 246, 1),
                borderRadius: BorderRadius.circular(15)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: SelectableText('accessToken'),
              )),
            const SizedBox(height: 30),
            Text(
              "Refresh Token",
              style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(210, 232, 246, 1),
                borderRadius: BorderRadius.circular(15)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: SelectableText('refreshToken'),
              )),
            const SizedBox(height: 30),          
            Button(
              title: 'Log Out',
              onPressed: () {
                  Navigator.pushNamed(context, 'login');         
              },            
              disable: false,
            ),
          ],
        ),
      ),
    );
  }
}
