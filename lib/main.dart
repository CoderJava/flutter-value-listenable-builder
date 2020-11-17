import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Value Listenable Builder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Value Listenable Builder'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;
  ValueNotifier valueNotifierCounter;

  @override
  void initState() {
    valueNotifierCounter = ValueNotifier(counter);
    super.initState();
  }

  @override
  void dispose() {
    valueNotifierCounter.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    counter++;
    valueNotifierCounter.value = counter;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      /*body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            ValueListenableBuilder(
              valueListenable: valueNotifierCounter,
              builder: (context, value, child) {
                return Text(
                  '$value',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),*/
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: valueNotifierCounter,
          builder: (context, value, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                child,
                Text('$value', style: Theme.of(context).textTheme.headline4),
              ],
            );
          },
          child: Text('You have pushed the button this many times:'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
