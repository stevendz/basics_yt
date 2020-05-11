import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

Color mainColor = Colors.deepPurple;
Color secColor = Colors.orange;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen(), debugShowCheckedModeBanner: false);
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: CustomBackground(
        content: ContentContainer(),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}

class ContentContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(50)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SleekCircularSlider(
            appearance: CircularSliderAppearance(
              size: MediaQuery.of(context).size.width * 0.85,
              startAngle: -90,
              angleRange: 360,
              customWidths: CustomSliderWidths(
                handlerSize: 10,
                progressBarWidth: 3,
              ),
              customColors: CustomSliderColors(
                progressBarColor: mainColor,
                dotColor: mainColor,
              ),
            ),
            min: 0,
            max: 360,
            initialValue: 90,
            innerWidget: (val) {
              return Center(
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width*0.35,
                  backgroundColor: secColor.withAlpha(50),
                ),
              );
            },
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Inner Space',
              style: TextStyle(color: mainColor),
              children: <TextSpan>[
                TextSpan(
                  text: '\nLife Gratitude',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.arrow_back_ios,
                      color: mainColor.withAlpha(100)),
                  onPressed: () {}),
              CircleAvatar(
                radius: 25,
                backgroundColor: secColor.withAlpha(150),
                child: Icon(Icons.pause, color: Colors.white),
              ),
              IconButton(
                  icon: Icon(Icons.arrow_forward_ios,
                      color: mainColor.withAlpha(100)),
                  onPressed: () {}),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                  icon:
                      Icon(Icons.volume_mute, color: mainColor.withAlpha(100)),
                  onPressed: () {}),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                    activeTrackColor: mainColor,
                    thumbColor: mainColor,
                    inactiveTrackColor: mainColor.withAlpha(100)),
                child: Slider(
                  value: 100,
                  min: 10,
                  max: 200,
                  onChanged: (val) {},
                ),
              ),
              IconButton(
                  icon: Icon(Icons.volume_up, color: mainColor.withAlpha(100)),
                  onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomBackground extends StatelessWidget {
  final Widget content;
  const CustomBackground({this.content});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            secColor.withAlpha(100),
            mainColor,
          ],
        ),
      ),
      child: content,
    );
  }
}

class CustomAppBar extends AppBar {
  CustomAppBar()
      : super(
          elevation: 0,
          backgroundColor: secColor.withAlpha(100),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {},
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                size: 32,
              ),
              onPressed: () {},
            ),
          ],
        );
}

class CustomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      iconSize: 32,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white38,
      backgroundColor: mainColor,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.favorite), title: Text('f')),
        BottomNavigationBarItem(icon: Icon(Icons.shuffle), title: Text('s')),
        BottomNavigationBarItem(
            icon: Icon(Icons.queue_music), title: Text('q')),
      ],
    );
  }
}
