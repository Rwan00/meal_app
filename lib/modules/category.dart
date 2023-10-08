import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final String imgUrl;
  final Color clr;


  Category( {
    required this.id,
    required this.title,
    required this.imgUrl,
    this.clr = const Color.fromRGBO(247, 164, 164, 1),
  });
}
