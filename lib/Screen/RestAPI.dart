import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_class/main.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



AmolList() async {
  var URL=Uri.parse('https://ruqyahmedia25.xyz/jinjadu/amol_list.json');
  var PostHeader={"Content-Type":"application/json"};
  var respons= await http.get(URL,headers: PostHeader);
  var resultcode=respons.statusCode;
  var resultbody=json.decode(respons.body);

  if(resultcode==200){
    toast('Success', Colors.green);
  }else{
    toast('Failed', Colors.red);
  }
}


class RestApi extends StatefulWidget {
  const RestApi({Key? key}) : super(key: key);

  @override
  State<RestApi> createState() => _RestApiState();
}

class _RestApiState extends State<RestApi> {

  var _formkey = GlobalKey<FormState>();
  TextEditingController _vid=TextEditingController();
  TextEditingController _title=TextEditingController();
  TextEditingController _des=TextEditingController();

  Map<String, String>amol={"vid":"", "title":"", "des":""};


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void getAmol() async {
    // https://ruqyahmedia25.xyz/jinjadu/amol_list.json

    Response response = await get(Uri.parse("https://ruqyahmedia25.xyz/jinjadu/amol_list.json"));

    final  Map<String,dynamic> decodeRespons = jsonDecode(response.body);

    toast('Success', Colors.green);
    var rs=decodeRespons.length;

    toast('decodeRespons= $rs', Colors.green);

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('RestApi'),),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
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
                  Form(
                    key: _formkey,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          TextFormField(validator: (value) {
                            if(value!.isEmpty){
                              return 'Write Your vid';
                            }
                          }, keyboardType: TextInputType.text,controller: _vid, decoration: InputDecoration(prefixIcon: const Icon(Icons.play_circle),label: const Text('Write Your vid'),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)))),
                          const SizedBox(height: 10),
                          TextFormField(validator: (value) {
                            if(value!.isEmpty){
                              return 'Write Your Title';
                            }
                          }, keyboardType: TextInputType.text,controller: _title, decoration: InputDecoration(prefixIcon: const Icon(Icons.title),label: const Text('Write Your Title'),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)))),
                          const SizedBox(height: 10),
                          TextFormField(validator: (value) {
                            if(value!.isEmpty){
                              return 'Write Your Description';
                            }
                          }, keyboardType: TextInputType.multiline,controller: _des, decoration: InputDecoration(prefixIcon: const Icon(Icons.description),label: const Text('Write Your Description'),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)))),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(style: ElevatedButton.styleFrom(fixedSize: const Size(double.infinity, 20)),onPressed: () {

                              if(_formkey.currentState!.validate()){

                                var vid=_vid.text.trim();
                                var title=_title.text.trim();
                                var des=_des.text.trim();

                                toast('$vid \n $title \n $des', Colors.green);

                                _vid.clear();
                                _title.clear();
                                _des.clear();
                                Navigator.pop(context);
                              }else{
                                toast('কিছু লিখুন', Colors.red);
                              }




                            }, child: const Text("Submit")),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },);
        },),
      body: Center(
        child: ListView.builder(
          // itemCount: amol_list.length,
          itemCount: 20,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  onLongPress: () {

                    showDialog(context: context, builder: (context) {
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
                            ListTile(title: const Text('Edit'),
                              leading: const Icon(Icons.edit),onTap: () {

                              },),
                            const Divider(),
                            ListTile(title: const Text('Delete'),
                              leading: const Icon(Icons.delete),onTap: () {

                              },),

                          ],
                        ),
                      );
                    },);

                  },
                  // title: Text(amol_list[index]['tile']!),
                    title: Text('assalamu alikum'),
                  leading: const Icon(Icons.menu_book),
                  trailing: const Icon(Icons.play_circle)
                ),
                const Divider(),
              ],
            );
          },),
      ),
    );

  }
}



class amolView extends StatefulWidget {
  const amolView({Key? key}) : super(key: key);

  @override
  State<amolView> createState() => _amolViewState();
}

class _amolViewState extends State<amolView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('amolView')),

    );
  }
}

