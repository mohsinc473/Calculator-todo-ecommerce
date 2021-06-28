import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'calculator.dart';
import 'todo.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E-Commerce"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[600],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: Container(
              child: Image.network(
                  "https://www.softwebsolutions.com/wp-content/uploads/2020/10/flutter-app-developer.jpg",
                  fit: BoxFit.cover),
            )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Calculator()));
                  },
                  child: Text("Calculator", style: TextStyle(fontSize: 20)),
                  style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.all(10.0),
                      minimumSize: Size(280.0, 60.0),
                      primary: Colors.teal[900],
                      side: BorderSide(color: Colors.green)),
                ),
                SizedBox(
                  height: 20,
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Todo()));
                  },
                  child: Text("Todo List", style: TextStyle(fontSize: 20)),
                  style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.all(10.0),
                      minimumSize: Size(280.0, 60.0),
                      primary: Colors.lime[800],
                      side: BorderSide(color: Colors.lime)),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              carousel(),
              cards(),
              gridView(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget gridView() {
  List<dynamic> products = [
    {
      "name": "iPhone 12 Pro",
      "img":
          "https://cdn.idropnews.com/wp-content/uploads/2020/10/29153326/iPhone-12-Pro-Max-Giveaway.jpg"
    },
    {
      "name": "Red Komodo",
      "img":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtQR4sFvqkzrN____LttviC8IL3e3VQSbEXQ&usqp=CAU"
    },
    {
      "name": "MacBook Pro",
      "img": "https://cdn.mos.cms.futurecdn.net/LiVX8YMR7b5m2ix6NGJjUh.jpg"
    },
    {
      "name": "M1 iMac",
      "img":
          "https://9to5mac.com/wp-content/uploads/sites/6/2021/04/imac-colors-2.jpeg?quality=82&strip=all"
    },
    {
      "name": "Falcon 9",
      "img":
          "https://www.cnet.com/a/img/4tbZfNP5SF8rXVWTCeqIUKGiuRg=/940x0/2020/01/04/319d2f62-9c7e-489b-9639-96b4efd24213/starlink1.jpg"
    },
    {
      "name": "iPad Pro",
      "img":
          "https://media.wired.com/photos/60a7edc7a44d38b5b31ca92b/master/w_2560%2Cc_limit/Gear-Review-iPad-Pro-Top.jpg"
    },
    {
      "name": "Pro Display XDR",
      "img":
          "https://www.cnet.com/a/img/JczEbSRaK5FhKYANExUbBidsQMk=/940x0/2020/02/09/9574fe2c-4162-45af-82c7-d25be9f10b62/15-mac-pro-display-xdr.jpg"
    },
    {
      "name": "Samsung Note 20 Ultra",
      "img":
          "https://s.yimg.com/uu/api/res/1.2/BEiJ8CDO8e_7eZ9.FKMg4w--~B/aD0xOTY5O3c9MzUwMDthcHBpZD15dGFjaHlvbg--/https://s.yimg.com/os/creatr-uploaded-images/2020-08/1499e9b0-e117-11ea-b66f-7c58e908215f.cf.jpg"
    },
  ];
  return GridView.count(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    crossAxisCount: 2,
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
    children: List.generate(products.length, (index) {
      return Container(
        width: 200.0,
        height: 100.0,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.blueGrey, blurRadius: 10.0),
          ],
        ),
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Image.network('${products[index]["img"]}',
                width: 200, height: 100, fit: BoxFit.cover),
            SizedBox(
              height: 3,
            ),
            Text(
              '${products[index]["name"]}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 3,
            ),
            Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.star_border_outlined,
                  color: Colors.yellow[800],
                ),
                SizedBox(
                  width: 10,
                ),
                Text("5.0 (23 Review)")
              ],
            )
          ],
        ),
      );
    }),
  );
}

Widget cloth() {
  return Icon(
    Icons.contacts_outlined,
    color: Colors.orange[900],
  );
}

Widget electronic() {
  return Icon(
    Icons.bolt,
    color: Colors.amber[800],
  );
}

Widget furniture() {
  return Icon(
    Icons.chair_outlined,
    color: Colors.brown,
  );
}

Widget laptop() {
  return Icon(
    Icons.computer_rounded,
    color: Colors.blueGrey,
  );
}

Widget camera() {
  return Icon(
    Icons.camera_roll_outlined,
    color: Colors.black,
  );
}

Widget cards() {
  List<dynamic> items = [
    "Clothes",
    "Electronic",
    "Furniture",
    "Laptops",
    "Camera",
  ];
  List<Widget> icons = [cloth(), electronic(), furniture(), laptop(), camera()];
  return Container(
    margin: EdgeInsets.only(top: 20),
    alignment: Alignment.center,
    height: 70,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.orange, blurRadius: 5.0),
          ],
        ),
        alignment: Alignment.center,
        margin: EdgeInsets.all(10),
        width: 160,
        height: 90,
        child: ListTile(
          leading: icons[index],
          title: Text(
            "${items[index]}",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),
  );
}

Widget carousel() {
  final List<String> imageList = [
    "http://www.businesskorea.co.kr/news/photo/202008/49909_61843_1421.png",
    "https://img.republicworld.com/republic-prod/stories/promolarge/xhdpi/g1jzwrwrlfim5wux_1623141909.jpeg",
    "https://static.pakwheels.com/2017/11/Tesla-Roadster-2.jpg",
  ];
  return CarouselSlider(
    options: CarouselOptions(
      enlargeCenterPage: true,
      enableInfiniteScroll: true,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 2),
    ),
    items: imageList
        .map((e) => ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.network(
                    e,
                    width: 1050,
                    height: 350,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ))
        .toList(),
  );
}
