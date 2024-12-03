import 'package:e_commerce_shop/utils/app_styles.dart';
import 'package:flutter/material.dart';

class HomeTileWidget extends StatelessWidget {
  final String assetsName;
  final String title;
  final GestureTapCallback onTapFun;
  const HomeTileWidget(
      {super.key,
      required this.assetsName,
      required this.title,
      required this.onTapFun});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFun,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 4,

                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Image(
                  image: AssetImage(assetsName),
                  width: MediaQuery.sizeOf(context).width / 10,
                  height: MediaQuery.sizeOf(context).width / 14,
                ),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: AppStyles.styleRegular16(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
