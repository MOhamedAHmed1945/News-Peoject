import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget {
  CustomAppBar({
    Key? key,
    this.leadingFunction,
    required this.leadingIcon,
    required this.title,
    this.colorTitle,
    this.actionFunction,
    this.actionIcon,
  }) : super(key: key);
  void Function()? leadingFunction;
  IconData? leadingIcon;
  String title;
  Color? colorTitle;
  Function? actionFunction;
  IconData? actionIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              leadingFunction!();
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Icon(
                leadingIcon ?? Icons.arrow_back,
                size: 28,
              ),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: colorTitle,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          InkWell(
            onTap: () {
              actionFunction!();
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Icon(
                actionIcon ?? Icons.newspaper,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
