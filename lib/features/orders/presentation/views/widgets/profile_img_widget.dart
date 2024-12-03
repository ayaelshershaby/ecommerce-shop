import 'package:flutter/material.dart';

class ProfileImgWidget extends StatelessWidget {
  const ProfileImgWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 150.0,
      child: Container(
        height: 90,
        width: 90,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: const Padding(
          padding: EdgeInsets.all(0),
          child: SizedBox(
            height: 80.0,
            width: 80.0,
            child: Image(
              image: AssetImage("assets/images/cart.png"),
            ),
          ),
        ),
      ),
    );
  }
}
