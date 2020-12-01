import 'package:flutter/material.dart';
import 'package:fluttertest/Counter1Screen.dart';
import 'package:fluttertest/Counter2Screen.dart';
import 'package:fluttertest/Counter3Screen.dart';
import 'package:fluttertest/CounterScreenState.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  List<Widget> screens = List<Widget>();
  List<GlobalKey> keys = List();

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    GlobalKey<CounterScreenState> counter1key = GlobalKey();
    GlobalKey<CounterScreenState> counter2key = GlobalKey();
    GlobalKey<CounterScreenState> counter3key = GlobalKey();
    screens.add(Counter1Screen(
      key: counter1key,
    ));
    screens.add(Counter2Screen(key: counter2key));
    screens.add(Counter3Screen(key: counter3key));
    keys.clear();
    keys.add(counter1key);
    keys.add(counter2key);
    keys.add(counter3key);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GlobalKey<CounterScreenState> counterKey = keys[selectedIndex];
          counterKey.currentState.updateFromParent();
        },
        child: Icon(Icons.add),
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.timer), label: "Counter 1"),
          BottomNavigationBarItem(icon: Icon(Icons.timer), label: "Counter 2"),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: "Counter 3",
          ),
        ],
        currentIndex: selectedIndex,
        fixedColor: Colors.red,
        onTap: onItemTapped,
      ),
    );
  }
}
