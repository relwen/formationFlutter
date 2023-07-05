import 'package:flutter/material.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        floatingActionButton: FloatingActionButton(backgroundColor: Colors.red,onPressed: () {  },
        child: Icon(Icons.search),),
        appBar: AppBar(title: Center(child: Text("FORMATION")),backgroundColor: Colors.deepOrange,),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(color: Colors.red,width: 100,height: 100,),
                Container(color: Colors.black,width: 100,height: 100,),
                Container(color: Colors.blue,width: 100,height: 100,),
              ],
            ),
            ElevatedButton(onPressed:(){
              print("click");
              }, child: Text("Suivant")),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 60,
              child: Text("Nouveau",textAlign: TextAlign.center,style: TextStyle(color:Colors.white,fontSize: 20),),
              color: Colors.green,
            ),
            Icon(Icons.account_circle,size: 50,color: Colors.deepOrange,),
            Icon(Icons.account_balance_wallet,size: 50),
            Icon(Icons.settings_suggest_outlined,size: 50),
            Icon(Icons.add_call,size: 50),
          ],
        )
      )
    );
  }
}
