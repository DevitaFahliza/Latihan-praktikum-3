import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan 9',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Penuhi Lindungi',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Color.fromARGB(0, 82, 82, 82),
          elevation: 30, // Tambahkan elevation untuk bayangan
        ),
        
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              height: 100,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Entering a Public Space?',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Stay alert to stay safe',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Image.network(
                      'assets/tangan.jpg',
                      width: 100,
                      height: 100,
                    ),
                  ),
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              height: 60,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.keyboard_arrow_down, color: Colors.black),
                              Text(
                                ' Check-In Preference',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton.icon(
                      onPressed: () {
                        // Action when button pressed
                      },
                      icon: Image.network(
                        'assets/scan.png',
                        width: 24,
                        height: 24,
                        color: Color.fromARGB(255, 7, 97, 171),
                      ),
                      label: Text(
                        'Check-In',
                        style: TextStyle(
                          color: Color.fromARGB(255, 7, 97, 171),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(48, 33, 149, 243)),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Expanded(
              child: MenuGrid(),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem {
  final String title;
  final String image;

  MenuItem({required this.title, required this.image});
}

class MenuGrid extends StatelessWidget {
  final List<MenuItem> menuItems = [
    MenuItem(title: 'Covid19 Vaccine', image: 'assets/vaccine.jpg'),
    MenuItem(title: 'Covid19 Test Result', image: 'assets/results.jpg'),
    MenuItem(title: 'EHAC', image: 'assets/ehac.jpg'),
    MenuItem(title: 'Travel Regulations', image: 'assets/travel.jpg'),
    MenuItem(title: 'Telemedicine', image: 'assets/telemedicine.jpg'),
    MenuItem(title: 'Healthcare Facility', image: 'assets/healthcare.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        return MenuItemWidget(
          title: menuItems[index].title,
          image: menuItems[index].image,
        );
      },
    );
  }
}

class MenuItemWidget extends StatelessWidget {
  final String title;
  final String image;

  MenuItemWidget({required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(
          image,
          height: 64,
          width: 64,
        ),
        SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
