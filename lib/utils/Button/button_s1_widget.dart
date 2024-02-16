import 'package:flutter/material.dart';

class ButtonS1 extends StatelessWidget {
  const ButtonS1({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
    required this.color,
    required this.color2,
  });

  final String text;
  final IconData icon;
  final GestureTapCallback onTap;
  final Color color;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1), // Shadow color
                      spreadRadius: 2, // Spread radius
                      blurRadius: 5, // Blur radius
                      offset: const Offset(0, 3), // Offset in x and y directions
                    ),
                  ]
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(icon,size: 25,color: color2,),
              ),
            ),
            const SizedBox(height: 5,),
            Text(text,style: const TextStyle(fontSize: 13),textAlign: TextAlign.center,)
          ],
        ),
      ),
    );
  }
}