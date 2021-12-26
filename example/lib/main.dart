import 'package:findo/findo.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),
      ),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<String> _samples = ['you', 'need', 'to', 'backend', 'service'];
  void _fetchSearch(String value) {
    // It'll be called every 300 seconds
    _samples.where((element) => element.contains(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FindoField(
          duration: Duration(seconds: 100),
          onChanged: (value) {
            _fetchSearch(value);
          },
        ),
      ),
    );
  }
}
