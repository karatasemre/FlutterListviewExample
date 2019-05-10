import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new TabController(vsync: this, length: 4, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.blue));
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: TabBar(
        indicator: UnderlineTabIndicator(
            insets: EdgeInsets.symmetric(horizontal: 16.0)),
        controller: controller,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white,
        tabs: <Widget>[
          Tab(
            icon: Icon(Icons.home),
          ),
          Tab(
            icon: Icon(Icons.person_add),
          ),
          Tab(
            icon: Icon(Icons.notifications),
          ),
          Tab(
            icon: Icon(Icons.clear_all),
          ),
        ],
      )),
      body: TabBarView(controller: controller, children: [
        HomePage(),
        HomePage(),
        HomePage(),
        HomePage(),
      ]),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List names = [
    "Junai",
    "Ash",
    "Kimmy",
    "Karina",
    "Melina",
    "Ashakian",
    "Kunny",
    "Aguero",
    "Djalma",
    "Hakmms"
  ];
  List designations = [
    "Ruby",
    "Python",
    "Php",
    "C#",
    "Java",
    "Spring",
    "Android",
    "Ios",
    "C++",
    "Laravel"
  ];

  List images = [
    "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg",
    "https://content-static.upwork.com/uploads/2014/10/02123010/profilephoto_goodcrop.jpg",
    "https://content-static.upwork.com/uploads/2014/10/01073427/profilephoto1.jpg",
    "https://images.pexels.com/photos/555790/pexels-photo-555790.png?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://image.shutterstock.com/image-photo/side-profile-halffaced-view-photo-260nw-1034763190.jpg",
    "https://image.shutterstock.com/image-photo/half-face-profile-beautiful-young-260nw-1057063631.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTn2H479DHWSkqk7oPZrXJ3yupcX9pmZDppSpmL2N1vHi5hvIzn-Q",
    "https://www.eharmony.com/blog/wp-content/uploads/2010/04/eHarmony-Blog-profile-picture.jpg",
    "https://www.iti.org.uk/images/article-images/Profile-Interview-Photo---Fiona-Gray.jpg",
    "http://familyfirstmalaysia.com/wp-content/uploads/2016/08/profile-pics-18.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Container(
      color: Colors.blue[100],
      child: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) => Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          buildCircleImage(index),
                        ],
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          buildNameText(index),
                          SizedBox(
                            height: 5.0,
                          ),
                          buildDesignationsText(index),
                        ],
                      ),
                      buildButton(),
                    ],
                  ),
                ),
              ),
            ),
      ),
    ));
  }

  Container buildCircleImage(int index) {
    return Container(
      width: 55.0,
      height: 55.0,
      child: CircleAvatar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.blue,
        backgroundImage: NetworkImage(
            images[index]),
      ),
    );
  }

  Text buildDesignationsText(int index) {
    return Text(
      designations[index],
      style: TextStyle(color: Colors.grey),
    );
  }

  Text buildNameText(int index) {
    return Text(
      names[index],
      style: TextStyle(
          color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
    );
  }

  Container buildButton() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: FlatButton(
        onPressed: () {},
        child: Text(
          "Invite",
          style: TextStyle(color: Colors.white),
        ),
        color: Colors.deepOrangeAccent.shade400,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
