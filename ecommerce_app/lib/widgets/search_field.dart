import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants.dart';
import '../constants.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField(
      {
        Key? key,
        required this.onWhiteBackground
      }
      ) : super(key: key);
  final bool onWhiteBackground;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        fillColor: onWhiteBackground ? Colors.grey : Colors.white,
        filled: true,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
          ),
        prefixIcon: Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                color:kSeconderyHintColor,
                spreadRadius: 0.0,
                offset: Offset(1.0, 1.0),
              )
              ],
              color: Colors.white
            ),

            child: Icon(
                Icons.search,
              color: kSeconderyHintColor,
            )
        ),
        hintText: ('Search'),
        hintStyle: TextStyle(color:Colors.cyanAccent),
        contentPadding: EdgeInsets.fromLTRB(30, 10, 30, 10),
      ),
    );
  }
}
