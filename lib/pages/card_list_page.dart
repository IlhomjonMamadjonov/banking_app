import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:new_one/models/card_model.dart';
import 'package:new_one/pages/create_card_page.dart';
import 'package:new_one/services/http_service.dart';

class CardList extends StatefulWidget {
  const CardList({Key? key}) : super(key: key);
  static const String id = "/card_list";

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  String text = "No cards yet";
  List<ModelCard> cards = [];

  @override
  void initState() {
    super.initState();
    bringCards();
  }

  void bringCards() {
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((value) {
      setState(() {
        cards = Network.parseCard(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        actions: [
          ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profil.jpg'),
              )),
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
          color: Colors.grey.shade200,
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListView.builder(
                  itemCount: cards.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return cardBuilder(context, cards[index], index);
                  }),
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
                    setState(() {
                      bringCards();
                    });
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

  Widget cardBuilder(BuildContext context, ModelCard card, int index) {
    return CreditCardWidget(
      height: MediaQuery.of(context).size.height * 0.26,
      cardNumber: card.cardNumber,
      expiryDate: card.expiryDate,
      cardHolderName: card.holderName,
      cvvCode: card.cvvCode,
      obscureCardNumber: true,
      obscureCardCvv: false,
      isHolderNameVisible: true,
      cardBgColor: Colors.teal,
      isSwipeGestureEnabled: true,
      isChipVisible: true,
      onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
      showBackView: false,
    );
  }
}
