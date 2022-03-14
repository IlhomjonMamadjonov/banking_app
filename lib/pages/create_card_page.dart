import 'package:flutter/material.dart';
import 'package:new_one/models/card_model.dart';
import 'package:new_one/pages/card_list_page.dart';
import 'package:new_one/services/http_service.dart';

class CreateCardPage extends StatefulWidget {
  const CreateCardPage({Key? key}) : super(key: key);
  static const String id = "create_page";

  @override
  State<CreateCardPage> createState() => _CreateCardPageState();
}

class _CreateCardPageState extends State<CreateCardPage> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';

  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiritionController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  saveCards() {
    String cardNumber = cardNumberController.text.trim().toString();
    String holderName = nameController.text.trim().toString();
    String expireDate = expiritionController.text.trim().toString();
    String cvv = cvvController.text.trim().toString();
    if (cardNumber.isEmpty ||
        holderName.isEmpty ||
        expireDate.isEmpty ||
        cvv.isEmpty) return null;
    ModelCard card = ModelCard(
        holderName: holderName,
        cardNumber: cardNumber,
        expiryDate: expireDate,
        cvvCode: cvv);
    Network.POST(Network.API_CREATE, Network.paramsCreate(card)).then((value) {
      getResponse(value);
    });
  }

  getResponse(String? response) {
    if (response != null) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade700,
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    /// text1
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Add your card",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.white),
                        ),
                        Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // text2
                    Text(
                      "Fill in the fields below or use camera phone",
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Card number
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        maxLength: 16,
                        controller: cardNumberController,
                        cursorColor: Colors.grey,
                        keyboardType: TextInputType.number,
                        onChanged: (text) {
                          setState(() {
                            cardNumber = text;
                          });
                        },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 5),
                          hintText: "Credit Card Number",
                          labelText: "Credit Card Number",
                          border: InputBorder.none,
                          hintStyle:
                              TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    /// CVV and Expiration date
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              maxLength: 4,
                              textInputAction: TextInputAction.next,
                              controller: expiritionController,
                              cursorColor: Colors.grey,
                              keyboardType: TextInputType.number,
                              onChanged: (text) {
                                setState(() {
                                  expiryDate = text;
                                });
                              },
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(left: 5),
                                hintText: "Expiration date",
                                labelText: "Expiration date",
                                border: InputBorder.none,
                                hintStyle:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              controller: cvvController,
                              maxLength: 3,
                              cursorColor: Colors.grey,
                              onChanged: (text) {
                                setState(() {
                                  cvvCode = text;
                                });
                              },
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(left: 5),
                                labelText: "CVV",
                                hintText: "CVV",
                                border: InputBorder.none,
                                hintStyle:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // Holder name
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        textInputAction: TextInputAction.done,
                        controller: nameController,
                        cursorColor: Colors.grey,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 5),
                          labelText: "Holder Name",
                          hintText: "Holder Name",
                          border: InputBorder.none,
                          hintStyle:
                              TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        primary: const Color(0xff1b447b),
                      ),
                      child: Text("Save"),
                      onPressed: () {
                        saveCards();
                        Navigator.pushReplacementNamed(context, CardList.id);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
