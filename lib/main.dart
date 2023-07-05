import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:formation/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/accueil': (context) =>
              Accueil(), // Définissez la route vers la page de destination
        },
        home: SplashScreen());
  }
}

class Accueil extends StatelessWidget {
  Future<String> fetchTextContent() async {
    String textContent = await rootBundle.loadString('assets/my_file.txt');
    return textContent;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 30, right: 60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: customCard(title: "Home"),
            ),
            SizedBox(
              width: 50,
              child: FutureBuilder<String>(
                future: fetchTextContent(),
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    return RichText(
                      text: TextSpan(
                        text: snapshot.data,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            Expanded(
              child: Material(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                    onTap: () {
                      // Navigator.of(context)
                      //     .push(MaterialPageRoute(builder: (_) => Accueil()));
                    },
                    splashColor: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 150,
                      height: 150,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.account_balance,
                              color: Colors.white,
                              size: 35,
                            ),
                            Text(
                              "Nouveau",
                              style: TextStyle(color: Colors.white),
                            )
                          ]),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget customCard({title, CallbackAction}) {
    return Material(
      color: Colors.black,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
          onTap: () {
            // Navigator.of(context)
            //     .push(MaterialPageRoute(builder: (_) => Accueil()));
          },
          splashColor: Colors.red,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 150,
            height: 150,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                Icons.account_balance,
                color: Colors.white,
                size: 35,
              ),
              Text(
                title,
                style: TextStyle(color: Colors.white),
              )
            ]),
          )),
    );
  }
}
