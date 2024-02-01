import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    // Initialize AnimationController and Animation
    controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);

    // Start the animation
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'Product layout demo home page',
        animation: animation,
      ),
    );
  }

  @override
  void dispose() {
    // Dispose the controller when not needed
    controller.dispose();
    super.dispose();
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title, required this.animation}) : super(key: key);

  final String title;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("6488080")),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
        children: <Widget>[
          FadeTransition(
            child: ProductBox(
              name: "iPhone",
              description: "iPhone is the stylist phone ever",
              price: 1000,
              networkimage: false,
              image: "Iphone.jpg",
            ),
            opacity: animation,
          ),
          MyAnimatedWidget(
            child: ProductBox(
              name: "Pixel",
              description: "Pixel is the most featureful phone ever",
              price: 800,
              networkimage: false,
              image: "Pixel-2.png",
            ),
            animation: animation,
          ),
          ProductBox(
            name: "Laptop",
            description: "Laptop is most productive development tool",
            price: 2000,
            networkimage: false,
            image: "laptop.jpg",
          ),
          ProductBox(
            name: "Tablet",
            description: "Tablet is the most useful device ever for meeting",
            price: 1500,
            networkimage: true,
            image: "https://media-cdn.bnn.in.th/342499/Lenovo-Tablet-P12-square_medium.jpg",
          ),
          ProductBox(
            name: "Pendrive",
            description: "Pendrive is useful storage medium",
            price: 100,
            networkimage: true,
            image: "https://m.media-amazon.com/images/I/61EMSGrZUuL._AC_UF1000,1000_QL80_.jpg",
          ),
          ProductBox(
            name: "Floppy Drive",
            description: "Floppy drive is useful rescue storage medium",
            price: 20,
            networkimage: true,
            image: "https://www.lifewire.com/thmb/1ItZYEen3YB3x5ejaYsMuCUA93A=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/sabrentexternalfloppydrive-5c7820dd46e0fb0001a5efd7-d14e349888e749d4893eab84d80a35b4.jpg",
          ),
        ],
      ),
    );
  }
}

class ProductBox extends StatelessWidget {
  ProductBox({Key? key, required this.name, required this.description, required this.price, required this.image, required this.networkimage}): super(key: key);

  final String name;
  final String description;
  final int price;
  final String image;
  final bool networkimage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      height: 140,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            networkimage?Image.network(image,width: 80, height: 80):
            Image.asset("assets/imageforwireless/" + image),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      this.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(this.description),
                    Text("Price: " + this.price.toString()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyAnimatedWidget extends StatelessWidget {
  MyAnimatedWidget({required this.child,required this.animation});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) => Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) => Container(
            child: Opacity(opacity: animation.value, child: child),
          ),
          child: child,
        ),
      );
}
