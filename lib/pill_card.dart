import 'package:flutter/material.dart';

class PillCard extends StatelessWidget {
  ///Todo: create an object that contains the data of the supplement
  const PillCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      height: 100,
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pill name",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 4,
              ),
              PillDetailComponent(),
            ],
          ),
          Spacer(),
          Row(
            children: [
              CustomButton(icon: Icons.done,color: Colors.blue,),
              SizedBox(width: 10,),
              CustomButton(icon: Icons.add,color: Colors.red,),
            ],
          )
        ],
      ),
    );
  }
}

class PillDetailComponent extends StatelessWidget {
  const PillDetailComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.access_time_rounded,
          color: Colors.grey,
          size: 16,
        ),
        SizedBox(
          width: 3,
        ),
        Text(
          '16:30',
          style: TextStyle(fontSize: 15,color: Colors.grey,),
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.density_small_sharp,
          size: 16,
          color: Colors.grey,
        ),
        SizedBox(
          width: 3,
        ),
        Text(
          '1 pills',
          style: TextStyle(fontSize: 15,color: Colors.grey,),
        ),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final MaterialColor color;

  const CustomButton({super.key, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: color.shade100),
      child: Icon(
        icon,
        color: color,
      ),
    );
  }
}
