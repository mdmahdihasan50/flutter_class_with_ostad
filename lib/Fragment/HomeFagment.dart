import 'package:flutter/material.dart';
import '../Screen/RestAPI.dart';
import '../Screen/BuySelCal.dart';
import '../main.dart';

class HomeFagment extends StatelessWidget {
  HomeFagment({Key? key}) : super(key: key);

  TextEditingController _vid=TextEditingController();

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

              showDialog(
                barrierDismissible: false,
                context: context, builder: (context) {
                return AlertDialog(
                  titlePadding: const EdgeInsets.only(left: 16),
                  contentPadding: const EdgeInsets.only(left: 8,right: 8,bottom: 8),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Chose an Action'),
                      //const Spacer(),
                      IconButton(onPressed: () {
                        Navigator.pop(context);
                      }, icon: const Icon(Icons.cancel_outlined))
                    ],
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            TextFormField(validator: (value) {
                              if(value!.isEmpty){
                                return 'Write Your Password';
                              }
                            }, keyboardType: TextInputType.text,controller: _vid, decoration: InputDecoration(prefixIcon: const Icon(Icons.play_circle),label: const Text('Write Your Password'),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)))),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(style: ElevatedButton.styleFrom(fixedSize: const Size(double.infinity, 20)),onPressed: () {

                              //  Navigator.push(context, MaterialPageRoute(builder: (context) => BuySelCal(),));

                                var vid=_vid.text.trim();

                                RegExp regex = RegExp("90905350");
                                if (regex.hasMatch(vid) && vid.length==8) {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => BuySelCal(),));
                                  _vid.clear();
                                } else {

                                  toast('Enter valid password', Colors.red);
                                }



                              }, child: const Text("Submit")),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },);


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









