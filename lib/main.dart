import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    //quitar el banner del debug 

    return const MaterialApp(
       debugShowCheckedModeBanner: false,
      home: TextFieldDemoPage(),
    );
  }
}

// A StatefulWidget always has two parts (two classes), as you can see below. Names are
// important (they need to match).
class TextFieldDemoPage extends StatefulWidget {
  const TextFieldDemoPage({Key? key}) : super(key: key);

  @override
  _TextFieldDemoPageState createState() => _TextFieldDemoPageState();
}

class _TextFieldDemoPageState extends State<TextFieldDemoPage> {
  // State. This is a variable that will change its value at different moments. In a
  // StatelessWidget all variables must be const or final (so, they are not that variable
  // after all). In a StatefulWidget we can have real variables. We call them state.
  var whatUserSays = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextField Demo'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Ingrese sus nombre',
                ),
                onChanged: (value) {
                  setState(() {
                    whatUserSays = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Ingrese su contraseña',
                ),
                onChanged: (value) {
                  setState(() {
                    whatUserSays = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondRoute(whatUserSays),
                    ),
                  );
                },
                child: const Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
        
    
  }
  
  SecondRoute(String whatUserSays) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: Text(whatUserSays),
      ),
    );
  }
}



