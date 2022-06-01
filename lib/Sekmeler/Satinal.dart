import 'package:belindaproje/Sekmeler/homepage.dart';
import 'package:belindaproje/service/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:hive/hive.dart';

class Satinal extends StatefulWidget {
  const Satinal({Key? key}) : super(key: key);

  @override
  State<Satinal> createState() => _BuyScreenState();
}

class _BuyScreenState extends State<Satinal> {
  String cardNumber = "";
  String expiryDate = "";
  String cardHolderName = "";
  String cvvCode = "";
  bool showBackView = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Box<ModelAdapter> hive = Hive.box<ModelAdapter>('model');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              CreditCardWidget(

                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  isHolderNameVisible: true,
                  cvvCode: cvvCode,
                  showBackView: showBackView,
                  onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {}),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CreditCardForm(
                          cardNumber: cardNumber,
                          expiryDate: expiryDate,
                          cardHolderName: cardHolderName,
                          cvvCode: cvvCode,
                          onCreditCardModelChange: onCreditCardModelChange,
                          themeColor: Colors.blue.shade900,
                          formKey: formKey),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 130),
                  child: Row(
                    children: [
                      Card(
                        elevation: 8,
                        color: Colors.white,
                        child: IconButton(
                          icon: const Icon(Icons.account_balance_sharp),
                          onPressed: () {

                            if (formKey.currentState!.validate()) {
                              final List<ModelAdapter> _all = hive.values.toList();
                              hive.deleteAll(hive.keys);
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(content : Text("İyi Günlerde Kullanın")));
                              Navigator.push (
                                context,
                                MaterialPageRoute(builder: (context) => Homapage(),),

                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      showBackView = creditCardModel.isCvvFocused;
    });
  }
}
Future<List<ModelAdapter>> delete() async {
  Box<ModelAdapter> hive = Hive.box<ModelAdapter>('model');

  List<ModelAdapter> _all = hive.values.toList();

  _all.forEach(
        (element) {


          print(element.name +
          " " +
          element.id +
          "  " +
          element.adet.toString() +
          " ");
    },
  );

  return _all;
}
