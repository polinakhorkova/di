import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(
    myService: MyService(),
  ));
}

class MyApp extends StatelessWidget {
  final MyService myService;

  MyApp({required this.myService});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(
        myService: myService,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final MyService myService;

  MyHomePage({required this.myService});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dependency Injection Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            myService.doSomething();
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Example'),
                  content: Text('Primer dependency injection'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('OK'),
                    ),
                  ],
                );
              },
            );
          },
          child: Text('Do Something'),
        ),
      ),
    );
  }
}

class MyService {
  void doSomething() {
    print('Doing something');
  }
}
