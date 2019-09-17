import 'package:flutter/material.dart';

void main(){
  runApp(new PlanetApp());

}
class PlanetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Planetpage(),


    );
  }
}
class Planetpage extends StatefulWidget {


  @override
  _PlanetpageState createState() => _PlanetpageState();
}

class _PlanetpageState extends State<Planetpage> {
  int photoindex=0;
  List<String> photos=["assets/mercury.jpg","assets/mercury.jpg","assets/mercury.jpg","assets/mercury.jpg"];
  PageController pageController;
  void previmg(){
    setState(() {
      photoindex= photoindex > 0? photoindex-1:0;
    });
  }
  void nextimg(){
    photoindex= photoindex < photos.length-1? photoindex+1:photoindex;
  }
  @override
  void initState(){
    super.initState();
    pageController=PageController(initialPage: 1,viewportFraction: 0.8);
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20.0,right: 0.0,top: 30.0),
                child: new Text("Planets" , style: TextStyle(fontSize: 35.0,color: Colors.black)),
              ),
              new SizedBox(
                width: 150.0,
              ),
              Padding(padding: const EdgeInsets.only(left: 20.0,right: 0.0,top: 30.0),
                  child: new Icon(Icons.search,size: 35.0,)
              )
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 25.0,top: 2.5),
                child: new Text("Solar System",style: TextStyle(fontSize: 13.0,color: Colors.grey),),
              )
            ],
          ),
          new Center(
            child: new Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  image: DecorationImage(image: AssetImage(photos[photoindex]),fit: BoxFit.cover)
              ),
              height: 300.0,
              width: 300.0,
            ),
          )

        ],
      ),
    );
  }
}



