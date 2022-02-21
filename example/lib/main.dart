import 'package:flutter/material.dart';
import 'package:fijkplayer/fijkplayer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

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

class _MyHomePageState extends State<MyHomePage> {
  final FijkPlayer player = FijkPlayer();

  @override
  void initState() {
    super.initState();
    FijkLog.setLevel(FijkLogLevel.All);

    player.setOption(FijkOption.playerCategory, "packet-buffering", "0");
    // player.setOption(FijkOption.formatCategory, "protocol_whitelist", "udp");
    // player.setOption(FijkOption.formatCategory, "format_whitelist", "h264");
    // player.setOption(FijkOption.formatCategory, "analyzeduration", 2000000);
    player.setOption(FijkOption.formatCategory, "fflags", "nobuffer");
    // player.setOption(FijkOption.formatCategory, "psrobsize", 262144);
    // player.setOption(FijkOption.playerCategory, "mediacodec", 1);

    // player.setOption(FijkOption.codecCategory, "codec_name", "h264");
    // player.setOption(FijkOption.playerCategory, "codec", "h264");
    // player.setOption(FijkOption.formatCategory, "codec_whitelist", "h264");
    player.setOption(FijkOption.playerCategory, "iformat", "h264");
    player.setDataSource(
        // "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
        // "formats",
        "udp://@:6666",
        autoPlay: true);
  }

  @override
  void dispose() {
    super.dispose();
    player.release();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: FijkView(player: player),
      ),
    );
  }
}
