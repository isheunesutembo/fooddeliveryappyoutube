import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value){

      },
      decoration: InputDecoration(
        prefixIcon: Image.asset("assets/icons/search.png",height: 25,
        width: 25,),
        hintText: "Search food,drink desserts",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none
        ),
        fillColor: Colors.white,
        filled: true,
        suffixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("assets/icons/filter.png",
          height: 25,width:25,),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none
        )
      ),
    );
  }
}