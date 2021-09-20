import 'package:flutter/material.dart';
import 'package:minecraftweather/single_weather.dart';
import 'package:minecraftweather/src/slider.dart';
import 'package:minecraftweather/src/weather_locations.dart';
import 'package:video_player/video_player.dart';

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
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

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
  late VideoPlayerController _controller;
  int _currentPage = 0;

  _onPageChanged(int index) {
    _startVideoPlayer();
    setState(() {
      _currentPage = index;
    });
  }

  @override
  void initState() {
    _controller =
        VideoPlayerController.asset(locations[_currentPage].background);
    _controller.initialize().then((_) {
      _controller.play();
      _controller.setLooping(true);
      setState(() {});
    });
  }

  void _initController() {
    _controller =
        VideoPlayerController.asset(locations[_currentPage].background);
    _controller.initialize().then((_) {
      _controller.play();
      _controller.setLooping(true);
      setState(() {});
    });
  }

  Future<void> _startVideoPlayer() async {
    if (_controller == VideoPlayerController.asset('assets/lake-sunny.mp4')) {
      // If there was no controller, just create a new one
      _initController();
    } else {
      final oldController = _controller;
      WidgetsBinding.instance!.addPostFrameCallback((_) async {
        await oldController.dispose();
        _initController();
      });

      setState(() {
        _controller = VideoPlayerController.asset('assets/lake-sunny.mp4');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SizedBox.expand(
          child: FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              height: _controller.value.size.height,
              width: _controller.value.size.width,
              child: VideoPlayer(_controller),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(color: Colors.black12),
        ),
        Container(
          margin: EdgeInsets.only(top: 75, left: 15),
          child: Row(
            children: [
              for (int i = 0; i < locations.length; i++)
                if (i == _currentPage)
                  PageSlider(isActive: true)
                else
                  PageSlider(isActive: false)
            ],
          ),
        ),
        PageView.builder(
            onPageChanged: _onPageChanged,
            scrollDirection: Axis.horizontal,
            itemCount: locations.length,
            itemBuilder: (ctx, i) => SingleWeather(
                  index: i,
                )),
      ]),
    );
  }
}
