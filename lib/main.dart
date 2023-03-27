import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {//context contains the app info
    return MaterialApp( //return of build must return a widget
      title: 'Flutter Extra Class',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Concatenator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> { //THis class is the whole app class
  String concatenated = "";
  String input1="";
  String input2="";
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();
  final myController2 = TextEditingController();

  void concatenateStrings() { //this function is called by the button
    setState(() {
      input1=myController.text;
      input2=myController2.text;//saves the text in both variables
      // This updated the widget objects so the new text is displayed
      concatenated=input1+input2;
      
    });
  }

  

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    myController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // SetState reruns this as many times as the method is called
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column arranges the widget elements vertically, its responsive.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[ //herer all widger elements are set up
            const Text(
              'Your concatenated text is:',
            ),
            Text(
              concatenated,
              style: Theme.of(context).textTheme.headlineMedium, //yjos defines a block of text
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: 
              TextField(controller:myController, decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'Enter input 1', //text that goes as watermark in field
              ),
              ),
              ),
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),child: TextField(
                controller:myController2,
                decoration: const InputDecoration(
                  border:  OutlineInputBorder(),
                  hintText: 'Enter input 2', //text that goes as watermark in field
            ),
          ),
        ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: concatenateStrings, //when button is pressed, the function is called
        tooltip: 'Concatenate Strings', //when pressed, will show this text
        child: const Icon(Icons.add),
      ), 
    );
  }
}
