import 'package:flutter/material.dart';
import 'package:pill_reminder/time_component.dart';

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
  List<String> times = ['12:00'];
  int doses = 0;

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
        child: SingleChildScrollView(
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
                  SizedBox(height: 20,),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SingleChildScrollView( scrollDirection: Axis.horizontal,child: SizedBox(
                          width: 290,
                          child: ListView.separated(scrollDirection: Axis.horizontal,itemBuilder: (ctx,index)=> TimeComponent(
                            onClick: () async{
                              final TimeOfDay? pickedTime = await showTimePicker(context: context, initialTime: TimeOfDay(hour: 00, minute: 00));
                              if(pickedTime != null){
                                setState(() {
                                  times[index] = pickedTime.format(context);
                                });
                              }
                            }, title: times[index],), separatorBuilder: (ctx,index)=> SizedBox(width: 10,), itemCount: times.length),
                        )),
                        SizedBox(width: 10,),
                        IconButton(onPressed: (){
                          setState(() {
                            times.add('00:00');
                          });
                        }, icon: Icon(Icons.add,color: Colors.lightBlueAccent))
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Align(alignment: Alignment.centerLeft,child: Text('Total Doses',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black54),textAlign: TextAlign.start,)),
                  SizedBox(height: 20,),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade400),borderRadius: BorderRadius.circular(10)),
                      width: double.infinity,
                      height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap:(){
                            if(doses>0){
                              setState(() {
                                doses--;
                              });
                            }
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.black12.withValues(alpha: .05)),
                            child: Center(child: Text('-',style: TextStyle(color: Colors.black38,fontSize: 30,fontWeight: FontWeight.bold),)) //Icon(Icons.add,color: Colors.black38,),
                          ),
                        ),
                        Text('$doses',style: TextStyle(color: Colors.black38,fontWeight: FontWeight.bold,fontSize: 20),),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              doses++;
                            });
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.black12.withValues(alpha: .05)),
                            child: Icon(Icons.add,color: Colors.black38,),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    width: MediaQuery.of(context).size.width * .8,
                    height: 70,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlue.shade300,
                            elevation: 0
                        ),
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (_)=> NewPillReminder()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.done,color: Colors.white,size: 18,),
                            SizedBox(width: 5,),
                            Text("Add reminder",style: TextStyle(color: Colors.white,fontSize: 17),)
                          ],
                        )),
                  ),
              ],
          )),
        ),
      )
    );
  }
}
