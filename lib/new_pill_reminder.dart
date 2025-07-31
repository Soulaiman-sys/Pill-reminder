import 'package:flutter/material.dart';

class NewPillReminder extends StatefulWidget {
  const NewPillReminder({super.key});

  @override
  State<NewPillReminder> createState() => _NewPillReminderState();
}

class _NewPillReminderState extends State<NewPillReminder> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('New Pill Reminder',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Form(
            child: Column(
              children: [
                SizedBox(height: 50,),
                Text('Name',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                TextFormField()
            ],
        )),
      )
    );
  }
}
