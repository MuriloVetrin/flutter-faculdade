import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  final TextEditingController raController = TextEditingController();

  void login(BuildContext context) async {
    final String ra = raController.text;

    final response = await http.get(
      Uri.parse('           $ra'),
    );

    if (response.statusCode == 200) {
 
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage,
        ),
      );
    } else {

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Erro'),
          content: Text('RA inválido. Por favor, tente novamente.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: raController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'RA',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => login(context),
              child: Text('Entrar'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text('Bem-vindo!'),
      ),
    );
  }
}