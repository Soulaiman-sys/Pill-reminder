import 'package:flutter/material.dart';

class PillRemainCard extends StatelessWidget {
  ///Todo: create an object that contains the data of the supplement
  const PillRemainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      //height: 200,
      width: 180,
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Pill name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
            Text("5 remaining",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
          ],
        ),
      )
    );
  }
}

