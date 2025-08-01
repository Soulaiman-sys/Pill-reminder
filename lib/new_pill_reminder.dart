import 'package:flutter/material.dart';

class NewPillReminder extends StatefulWidget {
  const NewPillReminder({super.key});

  @override
  State<NewPillReminder> createState() => _NewPillReminderState();
}

class _NewPillReminderState extends State<NewPillReminder> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtDescription = TextEditingController();
  final dayNames = ['Mo','Tu','We','Th','Fr','Sa','Su'];
  List<String> selectedDays = [];

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
                SizedBox(height: 30,),
                Align(alignment: Alignment.centerLeft,child: Text('Name',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black54),textAlign: TextAlign.start,)),
                SizedBox(height: 10,),
                TextFormField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder:  const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  ),
                ),
                SizedBox(height: 20,),
                Align(alignment: Alignment.centerLeft,child: Text('Description',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black54),textAlign: TextAlign.start,)),
                SizedBox(height: 10,),
                TextFormField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder:  const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  ),
                ),
                SizedBox(height: 20,),
                Align(alignment: Alignment.centerLeft,child: Text('Days',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black54),textAlign: TextAlign.start,)),
                SizedBox(height: 10,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...dayNames.map((e){
                        bool isSelected = selectedDays.any((item)=> item ==e);
                      return GestureDetector(
                        onTap: (){
                          setState(() {
                            if(!isSelected) {
                              selectedDays.add(e);
                            }else{
                              selectedDays.remove(e);
                            }
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 5),
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                            color: (isSelected)? Colors.lightBlueAccent.withValues(alpha: .1) : null,
                            shape: BoxShape.circle,
                            border: (!isSelected) ?   Border.all(color: Colors.grey.shade400) : null
                          ),
                          child: Center(child: Text(e,
                            style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: (isSelected) ? Colors.lightBlue : Colors.black54),
                          )),
                        ),
                      );
                      }),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Align(alignment: Alignment.centerLeft,child: Text('Times',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black54),textAlign: TextAlign.start,)),
            ],
        )),
      )
    );
  }
}
