import 'package:flutter/material.dart';

class HomeFagment extends StatelessWidget {
  const HomeFagment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(children: [
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              fixedSize: Size(300, 50)),
            onPressed: () {

              showDialog(barrierDismissible: false,context: context, builder: (context) {
                return AlertDialog(icon: Icon(Icons.notification_important_rounded),title: Text('AlertDialog'),content: Text('assalamualikum'),actionsAlignment: MainAxisAlignment.center,actions: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          fixedSize: Size(100, 50)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }, child: Text('OK')),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          fixedSize: Size(100, 50)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }, child: Text('OK')),
                ],);
              },);

        }, child: Text('AlertDialog')),
      ),
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              fixedSize: const Size(300, 50)),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                useSafeArea: true,
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)
                ),
                ),
                builder: (context) {

                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('BottomSheet',style: TextStyle(fontSize: 20),),
                          IconButton(onPressed: () {
                            Navigator.pop(context);
                          },icon: Icon(Icons.close)),

                        ],),
                    ),
                    const Divider(color: Colors.black,height: 10,thickness: 2),
                  ],
                );
              },);
        }, child: const Text('Bottom Shet')),
      ),
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                fixedSize: const Size(300, 50)),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => BuySelCal(),));
            }, child: const Text('Buy sell Calculate')),
      ),
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                fixedSize: const Size(300, 50)),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => BuySelCal(),));
            }, child: const Text('Buy sell Calculate')),
      ),
    ],));
  }
}





class BuySelCal extends StatefulWidget {
  BuySelCal({Key? key}) : super(key: key);

  @override
  State<BuySelCal> createState() => _BuySelCalState();
}

class _BuySelCalState extends State<BuySelCal> {

  TextEditingController _buy=TextEditingController();
  TextEditingController _sell=TextEditingController();

  var sum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BuySelCal')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              Text('$sum tk',style: const TextStyle(fontSize: 30)),
              TextField(keyboardType: TextInputType.number,controller: _buy, decoration: InputDecoration(prefixIcon: const Icon(Icons.numbers),label: Text('Buy'),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)))),
              const SizedBox(height: 10),
              TextField(keyboardType: TextInputType.number,controller: _sell, decoration: InputDecoration(prefixIcon: const Icon(Icons.sell),label: Text('Sell'),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)))),
              ElevatedButton(style: ElevatedButton.styleFrom(fixedSize: const Size(double.infinity, 20)),onPressed: () {
                setState(() {
                  // var Buy =_buy.text.toString();
                  // var Sell =_sell.text.toString();

                  var buy = double.parse(_buy.text);
                  var sell = double.parse(_sell.text);
                  sum =sell-buy;

                });
                }, child: const Text("Calculate"))
            ],
          ),
        ),
      ),
    );
  }
}



