import 'package:flutter/material.dart';
import '../Screen/RestAPI.dart';
import '../Screen/BuySelCal.dart';

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
              Navigator.push(context, MaterialPageRoute(builder: (context) => RestApi(),));
            }, child: const Text('RestApi')),
      ),
    ],));
  }
}









