import 'package:doob/Pages/Library.dart';
import 'package:flutter/material.dart';

class Tracktabs extends StatefulWidget {
  const Tracktabs({super.key});

  @override
  State<Tracktabs> createState() => _TracktabsState();
}

class _TracktabsState extends State<Tracktabs> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 10, left: 10, bottom: 20),
      child: Column(
        children: [
          GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/folderdetails');
              },
              child: FloderCard()),
          SizedBox(
            height: 10,
          ),
          FloderCard(),
          SizedBox(
            height: 10,
          ),
          FloderCard(),
          SizedBox(
            height: 10,
          ),
          FloderCard(),
          SizedBox(
            height: 10,
          ),
          FloderCard(),
          SizedBox(
            height: 10,
          ),
          FloderCard(),
          SizedBox(
            height: 10,
          ),
          FloderCard(),
          SizedBox(
            height: 10,
          ),
          FloderCard(),
        ],
      ),
    );
  }
}

class FloderCard extends StatelessWidget {
  const FloderCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white12,
        //color: Color.fromARGB(255, 194, 211, 226),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 20,
          ),
          Text(
            '#1',
            style: TextStyle(
                fontFamily: "Century",
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18),
          ),
          SizedBox(
            width: 40,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: Image.asset(
              'assets/Image/unforgiven.jpg',
              width: 50,
              height: 50,
            ),
          ),
          SizedBox(
            width: 40,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Swim',
                style: TextStyle(
                    fontFamily: "Century",
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 14),
              ),
              Text(
                'Chase Atlantic',
                style: TextStyle(
                    fontFamily: "Century",
                    // fontWeight: FontWeight.bold,
                    color: Color(0xff8A9A9D),
                    fontSize: 12),
              ),
            ],
          )
        ],
      ),
    );
  }
}
