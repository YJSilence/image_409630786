import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

final _scaffoldKey = GlobalKey<ScaffoldMessengerState>();

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
      const snackbar = SnackBar(duration: Duration(seconds: 1), content: Text('上一張'));
      _scaffoldKey.currentState?.showSnackBar(snackbar);
    });

  }

  void _nextimg(){
    setState(() {
      _counter>=3 ?_counter=0 :_counter++;
      _img = images[_counter];
    });
    const snackbar = SnackBar(duration: Duration(seconds: 1), content: Text('下一張'));
    _scaffoldKey.currentState?.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        scaffoldMessengerKey: _scaffoldKey,
        home: Scaffold(
            body: Center(
                child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 150),
                    // decoration: BoxDecoration(
                    //   border: Border.all()
                    // ),
                    child: Column(
                        children: [
                          Container(
                            height: 300,
                            child: Image.asset(_img, width: 300)
                          ),
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