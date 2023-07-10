import 'package:flutter/material.dart';

import '../main.dart';

class BuySelCal extends StatefulWidget {
  BuySelCal({Key? key}) : super(key: key);

  @override
  State<BuySelCal> createState() => _BuySelCalState();
}
class _BuySelCalState extends State<BuySelCal> {

  TextEditingController _buy=TextEditingController();
  TextEditingController _sell=TextEditingController();
  bool _tVisibl=false;

  final _formkey=GlobalKey<FormState>();

  var sum;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BuySelCal')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                SizedBox(height: 50, child: Visibility(visible: _tVisibl,child: Text('$sum tk',style: const TextStyle(fontSize: 30)))),
                TextFormField(validator: (value) {
                  if(value!.isEmpty){
                    return 'Write Your Buy';
                  }
                }, keyboardType: TextInputType.number,controller: _buy, decoration: InputDecoration(prefixIcon: const Icon(Icons.numbers),label: Text('Buy'),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)))),
                const SizedBox(height: 10),
                TextFormField(validator: (value) {

                  if(value!.isEmpty){
                    return 'Write Your Sel';
                  }

                }, keyboardType: TextInputType.number,controller: _sell, decoration: InputDecoration(prefixIcon: const Icon(Icons.sell),label: Text('Sell'),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)))),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(style: ElevatedButton.styleFrom(fixedSize: const Size(double.infinity, 20)),onPressed: () {

                    if(_formkey.currentState!.validate()){
                      // var Buy =_buy.text.toString();
                      // var Sell =_sell.text.toString();

                      var buy = double.parse(_buy.text);
                      var sell = double.parse(_sell.text);
                      sum =sell-buy;
                      _tVisibl=true;
                      setState(() {});
                    }else{
                      toast('কিছু লিখুন', Colors.green);
                    }


                  }, child: const Text("Calculate")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}