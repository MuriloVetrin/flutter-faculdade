import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _raController = TextEditingController();

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StudentInfoPage(
            name: _nameController.text,
            ra: _raController.text,
            imageUrl: 'https://www.alfaumuarama.edu.br/images/logo_novo.png',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Login',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Student Login'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Nome do aluno',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, digite o nome do aluno';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _raController,
                  decoration: InputDecoration(
                    labelText: 'RA do aluno',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, digite o RA do aluno';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: submitForm,
                    child: Text('Enviar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StudentInfoPage extends StatelessWidget {
  final String name;
  final String ra;
  final String imageUrl;

  const StudentInfoPage({
    Key? key,
    required this.name,
    required this.ra,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informações do Aluno'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            width: 200,
            height: 200,
          ),
          SizedBox(height: 16),
          Text(
            'Nome: $name',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            'RA: $ra',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
