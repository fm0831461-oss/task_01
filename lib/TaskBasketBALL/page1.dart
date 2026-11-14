import 'package:flutter/material.dart';
import 'package:task_01/TaskBasketBALL/page2.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  int count = 0;
  Color bgColor = Colors.white;
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
        behavior: HitTestBehavior.opaque,
        onTap: () {
          setState(() {
            bgColor = bgColor == Colors.white
                ? const Color.fromARGB(255, 191, 103, 103)
                : Colors.white;
          });
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: bgColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Team A",
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
                  backgroundColor: Colors.red,
                  child: Text("Add 1Point"),
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
                  backgroundColor: Colors.red,
                  child: Text("Add 2 Point"),
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
                  backgroundColor: Colors.red,
                  child: Text("Add 3 Point"),
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
                  backgroundColor: Colors.red,
                  child: Text("Reset"),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Page2()),
                  );
                },
                child: Text("Show Team B"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
