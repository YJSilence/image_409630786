import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App>{
  List<String> images = ['img/shit.jpg', 'img/bird.jpg', 'img/coffeebean.jpg', 'img/beer.jpg'];
  var _img = 'img/shit.jpg',
      _counter = 0;

  void _previmg(){
    setState(() {
      _counter<=0 ?_counter=3 :_counter--;
      _img = images[_counter];
    });
  }

  void _nextimg(){
    setState(() {
      _counter>=3 ?_counter=0 :_counter++;
      _img = images[_counter];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Center(
                child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 150, bottom: 200),
                    // decoration: BoxDecoration(
                    //   border: Border.all()
                    // ),
                    child: Column(
                        children: [
                          Image.asset('$_img', width: 300),
                          Padding(
                              padding: const EdgeInsets.only(top: 60),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly,
                                children: [
                                  ElevatedButton(onPressed: _previmg, child: const Text('上一張')),
                                  ElevatedButton(onPressed: _nextimg, child: const Text('下一張'))
                                ],
                              )
                          )
                        ]
                    )
                )
            )
        )
    );
  }
}