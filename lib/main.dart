import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String sum = '';

  TextEditingController value1 = TextEditingController();
  TextEditingController value2 = TextEditingController();
  FocusNode fn = FocusNode();

  final List _buttonList = ['더하기', '빼기', '곱하기', '나누기'];
  final List<DropdownMenuItem<String>> _dropDownMenuItems = [];
  String _buttonText = '';

  onPress() {
    setState(() {
      int result = int.parse(value1.value.text) + int.parse(value2.value.text);
      sum = '$result';

      value1.text = '';
      value2.text = '';
      fn.requestFocus();
    });
  }

  @override
  void initState() {
    super.initState();
    for (var item in _buttonList) {
      _dropDownMenuItems.add(DropdownMenuItem(
        child: Text(item),
        value: item,
      ));
    }
    _buttonText = _dropDownMenuItems[0].value!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text('Flutter'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: value1,
                focusNode: fn,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: value2,
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(15),
                child: DropdownButton(
                  items: _dropDownMenuItems,
                  value: _buttonText,
                  onChanged: (value) {
                    setState(() {
                      _buttonText = '$value';
                    });
                  },
                )),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text('결과 : $sum'),
            )
          ],
        ),
      ),
    );
  }
}
