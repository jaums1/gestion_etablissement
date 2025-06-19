
import 'package:flutter/cupertino.dart';

class TCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path=Path();

    path.lineTo(0, size.height);

    final firstCurved=Offset(0, size.height-20);
    final lastCurved=Offset(30, size.height-20);

    path.quadraticBezierTo(firstCurved.dx, firstCurved.dy, lastCurved.dx, lastCurved.dy);

    
    final secondfirstCurved=Offset(0, size.height-20);
    final secondlastCurved=Offset(size.width-30, size.height-20);
     path.quadraticBezierTo(secondfirstCurved.dx, secondfirstCurved.dy, secondlastCurved.dx, secondlastCurved.dy);


     final thirdfirstCurved=Offset(size.width, size.height-20);
    final thirdlastCurved=Offset(size.width, size.height);
     path.quadraticBezierTo(thirdfirstCurved.dx, thirdfirstCurved.dy, thirdlastCurved.dx, thirdlastCurved.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }




  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
  

}