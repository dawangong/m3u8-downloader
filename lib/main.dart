import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'm3u8-downloader',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'm3u8 downloader'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const FirstTab(),
    const SecondTab(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(
            widget.title,
            style:
                const TextStyle(color: Colors.white, fontSize: 28), // 设置标题颜色为白色
          )),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              size: 30,
            ),
            label: '添加任务',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.download,
              size: 30,
            ),
            label: '下载列表',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class FirstTab extends StatelessWidget {
  const FirstTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.red,
            ),
          ),
          Container(
            height: 30.0,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}

class SecondTab extends StatelessWidget {
  const SecondTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.red,
            ),
          ),
          Container(
            height: 30.0,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
