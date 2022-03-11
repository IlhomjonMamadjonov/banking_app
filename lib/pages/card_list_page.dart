import 'package:flutter/material.dart';
import 'package:new_one/pages/create_card_page.dart';

class CardList extends StatefulWidget {
  const CardList({Key? key}) : super(key: key);
  static const String id = "/card_list";

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  String text = "No cards yet";
  List<Card> cards = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              "assets/images/profil.jpg",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 15,
          ),
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Good Morning,",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "Boss",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
              ),
              // Add button
              Container(
                margin: const EdgeInsets.only(top: 24.0),
                alignment: Alignment.center,
                child: FloatingActionButton(
                  elevation: 2.0,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateCardPage()));
                  },
                  backgroundColor: Colors.transparent,
                  child: Icon(Icons.add),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text("Add new card")
            ],
          ),
        ),
      ),
    ));
  }
}
