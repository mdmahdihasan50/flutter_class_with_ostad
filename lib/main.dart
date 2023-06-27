import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_class/Fragment/HomeFagment.dart';
import 'package:flutter_class/Fragment/Todo.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Clas with ostad',
      debugShowCheckedModeBanner: false,
      home: Spash(),
    );
  }
}



class  Spash extends StatefulWidget {
  const Spash({super.key});
  @override
  State<Spash> createState() => _SpashState();
}
class _SpashState extends State<Spash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder:
              (context) =>MyScreen(),));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 150,height: 150, child: Image.asset("img/logo.png")),
            const Text('Flutter Class',style: TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}





class MyScreen extends StatelessWidget {

  //##########_exitDialoge
  Future _exitDialoge(context){
    return showDialog(context: context, builder: (context) {
      return AlertDialog(

        icon: Icon(Icons.exit_to_app),
        title: Text('Are You Exit'),
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
              backgroundColor: Colors.blueGrey,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                fixedSize: Size(100, 50)),
            onPressed: () {
              SystemNavigator.pop();
            }, child: Text('Yes')),
      ],);
    },);
  }
  //************
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: WillPopScope(
        onWillPop: () {
          _exitDialoge(context);
          return Future.value(false);
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Flutter Clas with ostad",
                style: TextStyle(color: Colors.black)),
            titleSpacing: 0,
            centerTitle: true,
            toolbarHeight: 60,
            toolbarOpacity: 1,
            backgroundColor: Colors.amberAccent,
            actions: [
              IconButton(
                  onPressed: () {
                    MySnakber('notifications', context);
                  },
                  icon: const Icon(Icons.notifications)),
              IconButton(
                  onPressed: () {
                    MySnakber('search', context);
                  },
                  icon: const Icon(Icons.search)),
              IconButton(
                  onPressed: () {
                    MySnakber('settings', context);
                  },
                  icon: const Icon(Icons.settings)),
            ],
            bottom: const TabBar(
               // isScrollable: true,
                tabs: [
              Tab(icon: Icon(Icons.home),text: "home"),
              Tab(icon: Icon(Icons.list),text: "listview"),
              Tab(icon: Icon(Icons.person),text: "Todo"),
            ]),
          ),
          floatingActionButton: FloatingActionButton(
            elevation: 10,
            child: const Icon(Icons.add),
            onPressed: () {
              Fluttertoast.showToast(
                  msg: 'floatingActionButton',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: 0,
            onTap: (int index) {
              if (index == 0) {
                MySnakber('Home', context);
              } else if (index == 1) {
                MySnakber('Message', context);
              } else if (index == 2) {
                MySnakber('Verified_user', context);
              }
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.message), label: "Message"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.verified_user), label: "Verified_user"),
            ],
          ),
          drawer: Drawer(
            child: ListView(
              children: [
                DrawerHeader(
                  padding: const EdgeInsets.all(0),
                  child: UserAccountsDrawerHeader(
                      accountName: const Text('Mahdi Hasan'),
                      accountEmail: const Text('mahdihasan@gmail.com'),
                      currentAccountPicture: Image.network(
                          "https://logowik.com/content/uploads/images/flutter5786.jpg")),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                  onTap: () {
                    MySnakber('Home', context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.phone),
                  title: const Text('Phone'),
                  onTap: () {
                    MySnakber('Phone', context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.mail),
                  title: const Text('Mail'),
                  onTap: () {
                    MySnakber('Mail', context);
                  },
                ),
              ],
            ),
          ),
          endDrawer: Drawer(
            child: ListView(
              children: [
                DrawerHeader(
                  padding: const EdgeInsets.all(0),
                  child: UserAccountsDrawerHeader(
                      accountName: const Text('Mahdi Hasan'),
                      accountEmail: const Text('mahdihasan@gmail.com'),
                      currentAccountPicture: Image.network(
                          "https://ruqyahmedia25.xyz/image/Mahdi%20Hasan.jpg")),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                  onTap: () {
                    MySnakber('Home', context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.phone),
                  title: const Text('Phone'),
                  onTap: () {
                    MySnakber('Phone', context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.mail),
                  title: const Text('Mail'),
                  onTap: () {
                    MySnakber('Mail', context);
                  },
                ),
              ],
            ),
          ),
          body: const TapBer(),
        ),
      ),
    );
  }
}



//########TapBer()
class TapBer extends StatelessWidget {
  const TapBer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TabBarView(children: [
        HomeFagment(),
        ListViewbuilder(),
        Todo(),
      ],),
    );
  }
}



//###############ListViewbuilder()
class ListViewbuilder extends StatelessWidget {
  ListViewbuilder({Key? key}) : super(key: key);
  var news=[
    {"img": "https://cdn.rabbil.com/photos/images/2022/11/04/rabbilVai.png", "tile": "Rabbil", "des": "Apps Developer"},
    {"img": "https://cdn.rabbil.com/photos/images/2022/11/04/rabbilVai.png", "tile": "Rabbil", "des": "Apps Developer"},
    {"img": "https://cdn.rabbil.com/photos/images/2022/11/04/rabbilVai.png", "tile": "Rabbil", "des": "Apps Developer"},
    {"img": "https://cdn.rabbil.com/photos/images/2022/11/04/rabbilVai.png", "tile": "Rabbil", "des": "Apps Developer"},
    {"img": "https://cdn.rabbil.com/photos/images/2022/11/04/rabbilVai.png", "tile": "Rabbil", "des": "Apps Developer"},
    {"img": "https://cdn.rabbil.com/photos/images/2022/11/04/rabbilVai.png", "tile": "Rabbil", "des": "Apps Developer"},
    {"img": "https://cdn.rabbil.com/photos/images/2022/11/04/rabbilVai.png", "tile": "Rabbil", "des": "Apps Developer"},
    {"img": "https://cdn.rabbil.com/photos/images/2022/11/04/rabbilVai.png", "tile": "Rabbil", "des": "Apps Developer"},
    {"img": "https://cdn.rabbil.com/photos/images/2022/11/04/rabbilVai.png", "tile": "Rabbil", "des": "Apps Developer"},
    {"img": "https://cdn.rabbil.com/photos/images/2022/11/04/rabbilVai.png", "tile": "Rabbil", "des": "Apps Developer"},
    {"img": "https://cdn.rabbil.com/photos/images/2022/11/04/rabbilVai.png", "tile": "Rabbil", "des": "Apps Developer"},
  ];


  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: news.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(onTap: () {
                int sumindex=index +1;
                toast("Button= $sumindex", Colors.green);
              }, leading: Image.network(news[index]['img']!),title: Text(news[index]['tile']!),subtitle: Text(news[index]['des']!),trailing: Icon(Icons.arrow_forward)),
              Divider(),
            ],
          );
        },),
    );
  }
}

toast(text, color){
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      fontSize: 16.0,
    backgroundColor: color,
  );
}

MySnakber(messes, context) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(messes)));
}