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
  List<String> photos=[
    "assets/mercury.jpg",
    "assets/venus.jpg",
    "assets/mars.jpg",
    "assets/earth.jpg"
  ];
  //PageController pageController;
  void _previmg(){
    setState(() {
      photoindex= photoindex > 0 ? photoindex-1 : 0;
    });
  }
  void _nextimg(){
    setState(() {
      photoindex= photoindex < photos.length -1 ? photoindex+1 : photoindex;
    });

  }
  // @override
  //void initState(){
  //super.initState();
  //pageController=PageController(initialPage: 1,viewportFraction: 0.8);
  // }
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
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child:new Center(
              child:new Stack(
                children: <Widget>[
                  new Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        image: DecorationImage(image: AssetImage(photos[photoindex]),fit: BoxFit.cover)
                    ),
                    height: 400.0,
                    width: 300.0,

                  ),
                  Positioned(
                    top: 375.0,left: 25.0,right: 25.0,
                    child: SelectedPhoto(nodots: photos.length,photoindex: photoindex,),
                  )
                ],

              ),


            ),
          ),
          new Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new RaisedButton(
                child: Text("prev",style: TextStyle(color: Colors.white),),
                onPressed: _previmg,color: Colors.black87,),
              new SizedBox(
                width: 100.0,
              ),
              new RaisedButton(
                child: Text("next",style: TextStyle(color: Colors.white)),
                onPressed: _nextimg,color: Colors.black87,)
            ],
          )

        ],
      ),
    );
  }
}
class SelectedPhoto extends StatelessWidget {
  final int nodots;
  final int photoindex;
  SelectedPhoto({
    this.nodots,
    this.photoindex
  });
  Widget _InactivePhoto(){
    return Container(
      child: new Padding(padding: EdgeInsets.only(left: 3.0,right: 3.0),
        child: Container(
          height: 8.0,
          width: 8.0,
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(4.0)
          ),
        ),
      ),
    );
  }
  Widget _ActivePhoto(){
    return Container(
      child: Padding(padding: EdgeInsets.only(left: 5.0,right: 5.0),
        child: Container(
          height: 10.0,
          width: 10.0,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 0.0,
                  blurRadius: 2.0
              )]
          ),
        ),),
    );
  }
  List<Widget> _buildDots(){
    List<Widget> dots=[];
    for(int i=0;i< nodots;++i)
    {
      dots.add(i==photoindex? _ActivePhoto():_InactivePhoto());
    }
    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildDots()
      ),
    );
  }
}



