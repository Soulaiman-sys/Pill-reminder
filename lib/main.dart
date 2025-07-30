import 'package:flutter/material.dart';
import 'package:pill_reminder/pill_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFE0E4EA),
        appBarTheme: AppBarTheme(backgroundColor: Color(0xFFE0E4EA)),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle),
                  child: Icon(Icons.perm_identity,color: Colors.grey,size: 30,),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey)),
                  child: Icon(
                    Icons.notifications_none_outlined,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Today's Reminder ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                textAlign: TextAlign.start,
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
                itemBuilder: (ctx,index)=> PillCard(),
                separatorBuilder: (ctx,index)=> SizedBox(height: 20,),
                itemCount: 2),
            SizedBox(height: 20,),
            Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Inventory",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    textAlign: TextAlign.start,
                  ),
                ),
                Spacer(),
                Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),border: Border.all(color: Colors.grey)),
                  child: Center(child: Text("SEE ALL",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black38),)),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
