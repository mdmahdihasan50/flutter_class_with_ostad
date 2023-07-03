import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_class/main.dart';

class Todo extends StatefulWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {

  TextEditingController Todolistadd = TextEditingController();

  List Todolist=['Todolist'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 50,
              width: double.infinity,
              child: Row(
                  children: [
                    Expanded(flex: 8,
                        child: TextField(
                          controller: Todolistadd,
                          decoration: InputDecoration(label: Text('Your Tex'),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                        )),
                    SizedBox(width: 10,),
                    Expanded(
                      flex: 2,
                        child: ElevatedButton(onPressed: () {

                          if(Todolistadd.text.trim().isNotEmpty){
                            Todolist.add(Todolistadd.text);
                            Todolistadd.clear();

                            if(mounted){
                              setState(() {});
                            }

                          }
                          else{
                            toast('কিছু লিখুন', Colors.green);
                          }

                          }, child: Text('add'))),

              ]),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: Todolist.length,
                itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    onTap: () {
                      int iteamn=index+1;
                      toast('iteam= $iteamn', Colors.green);
                    },
                    onLongPress: () {
                        showDialog(context: context, builder: (context) {
                          return AlertDialog(

                            icon: Icon(Icons.delete),
                            title: Text('sure remove ?'),
                            actionsAlignment: MainAxisAlignment.center,
                            actions: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                      fixedSize: Size(100, 50)),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  }, child: Text('NO')),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                      fixedSize: Size(100, 50)),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Todolist.removeAt(index);

                                    if(mounted){
                                      setState(() {});
                                    }

                                  }, child: Text('Yes')),
                            ],);
                        },);

                      },
                    title: Text(Todolist[index]),
                      leading: IconButton(onPressed: () {

                      }, icon: Icon(Icons.close)),
                    trailing: IconButton(onPressed: () {

                    }, icon: Icon(Icons.edit)),
                  ),
                );
              },),
            ),
          ],
        ),
      )),
    );
  }
}

