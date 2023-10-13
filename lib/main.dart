import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  // final videoUrl = "https://youtu.be/2JBYnvUlAEc?si=A4vRkBXEDTLfWOIS";
  var videourl = ["https://youtu.be/2JBYnvUlAEc?si=A4vRkBXEDTLfWOIS","https://youtu.be/6-n_szx2XRE?si=NlDsKKYudmF3zewE"];
  late YoutubePlayerController _controller;
  @override
  void initState() {
 final videoId = YoutubePlayer.convertUrlToId(videourl[1]);
 _controller = YoutubePlayerController(
     initialVideoId: videoId!,
   flags: const YoutubePlayerFlags(
     hideControls : false,
     controlsVisibleAtStart: false,
      autoPlay : true,
     mute : false,
     // isLive :true,
     hideThumbnail : false,
      disableDragSeek : false,
      loop : true,
   ),


 );


  }
 @override
  Widget build(BuildContext context) {
   final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
   if (isLandscape) {
     SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
   } else {
     SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
   }
    return Scaffold(
        appBar: isLandscape ? null : AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body:content(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  Widget content(){
   return Center(
     child: Container(
       child: YoutubePlayer(
         controller: _controller,
         showVideoProgressIndicator: true,
         controlsTimeOut: Duration(seconds: 3),
         aspectRatio: 16/10,
       ),
     ),
   );
  }
}
