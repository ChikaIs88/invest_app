
import 'package:flutter/material.dart';

//{@custom clipper} This clip the container and draw a new path for the buttom
class ContainerCurve extends CustomClipper<Path> {
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  @override
  Path getClip(Size size) {
    var firstEndPoint = Offset(size.width / 2, size.height);
    var endPoint = Offset(size.width, size.height / 1.3);

    Path path = Path()
      ..moveTo(size.width, 0)
      ..lineTo(0, 0)
      ..lineTo(0, size.height / 1.3)
      ..quadraticBezierTo(
          firstEndPoint.dx, firstEndPoint.dy, endPoint.dx, endPoint.dy)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}