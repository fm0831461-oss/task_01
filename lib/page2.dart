import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  int count = 0;
  Color bg_color = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text(
          "Basket Ball",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
            color: Colors.white,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            bg_color = bg_color == Colors.white
                ? const Color.fromARGB(255, 191, 103, 103)
                : Colors.white;
          });
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: bg_color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Team B",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
              Text(
                "$count",
                style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 50),
              SizedBox(
                width: 200,
                height: 50,
                child: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      count++;
                    });
                  },
                  child: Text("Add 1Point"),
                  backgroundColor: Colors.red,
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 200,
                height: 50,
                child: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      count += 2;
                    });
                  },
                  child: Text("Add 2 Point"),
                  backgroundColor: Colors.red,
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 200,
                height: 50,
                child: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      count += 3;
                    });
                  },
                  child: Text("Add 3 Point"),
                  backgroundColor: Colors.red,
                ),
              ),
              SizedBox(height: 50),
              SizedBox(
                width: 100,
                height: 50,
                child: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      count = 0;
                    });
                  },
                  child: Text("Reset"),
                  backgroundColor: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
