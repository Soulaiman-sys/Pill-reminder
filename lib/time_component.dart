import 'package:flutter/material.dart';

class TimeComponent extends StatefulWidget {
  final Function() onClick;
  final String title;
  const TimeComponent({super.key, required this.onClick, required this.title});

  @override
  State<TimeComponent> createState() => _TimeComponentState();
}

class _TimeComponentState extends State<TimeComponent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onClick,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade400),borderRadius: BorderRadius.circular(10)),
            width: 130,
            height: 60,
            child: Row(
              children: [
                Text(widget.title,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black38,fontSize: 16),),
                Spacer(),
                VerticalDivider(width: 10,),
                Spacer(),
                Text("1",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black38,fontSize: 16),),
              ],
            ),
          ),
          Positioned(
            left: 115,
            top: -5,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.red.shade100,),
              child: Center(child: Icon(Icons.close_outlined,size: 12,color: Colors.red,)),
            ),
          ),
        ],
      ),
    );
  }
}
