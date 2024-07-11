import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';

// 全局store
class CounterModel extends Model {
  int _selectedIndex = 0;
  final String _downloadDir = "m3u8-download/";

  int get selectedIndex => _selectedIndex;
  String get downloadDir => _downloadDir;

  void onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScopedModel<CounterModel>(
        model: CounterModel(),
        child: MaterialApp(
          title: 'm3u8-downloader',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const MyHomePage(title: 'm3u8 downloader'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static final List<Widget> _widgetOptions = <Widget>[
    const FirstTab(),
    const SecondTab(),
  ];

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
      body: ScopedModelDescendant<CounterModel>(
        builder: (context, child, model) {
          return _widgetOptions.elementAt(model.selectedIndex);
        },
      ),
      bottomNavigationBar: ScopedModelDescendant<CounterModel>(
        builder: (context, child, model) {
          return BottomNavigationBar(
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
            currentIndex: model.selectedIndex,
            onTap: ScopedModel.of<CounterModel>(context).onItemTapped,
          );
        },
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
      padding: const EdgeInsets.all(10),
      child: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Expanded(
            child: Column(
              children: [
                Container(
                    color: Colors.white,
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(top: 14),
                    child: ScopedModelDescendant<CounterModel>(
                      builder: (context, child, model) {
                        return Column(children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              "m3u8链接",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 19),
                            ),
                          ),
                          const TextField(
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              labelText: "",
                              labelStyle: TextStyle(height: 0),
                              hintText: "请输入.m3u8结尾的链接 必填",
                            ),
                          )
                        ]);
                      },
                    )),
                Container(
                    color: Colors.white,
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(top: 14),
                    child: ScopedModelDescendant<CounterModel>(
                      builder: (context, child, model) {
                        return Column(children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              "文件重命名",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          const TextField(
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              labelText: "",
                              labelStyle: TextStyle(height: 0),
                              hintText: "请输入新的文件名称 选填",
                            ),
                          )
                        ]);
                      },
                    )),
                Container(
                    color: Colors.white,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 40),
                    child: ScopedModelDescendant<CounterModel>(
                      builder: (context, child, model) {
                        return ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.primaryContainer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            shadowColor: Colors.transparent, // 移除阴影
                            elevation: 0,
                          ), // 移除阴影的另一个方法),
                          child: Text(
                            "下载文件",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                // fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        );
                      },
                    ))
              ],
            ),
          ),
          Container(
              height: 30.0,
              alignment: Alignment.centerLeft,
              child: ScopedModelDescendant<CounterModel>(
                builder: (context, child, model) {
                  return Text(
                    '保存至: ${model.downloadDir}',
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontSize: 20),
                  );
                },
              )),
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

void main() {
  runApp(const MyApp());
}
