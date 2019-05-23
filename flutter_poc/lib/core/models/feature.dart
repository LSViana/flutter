import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Feature {
  String title;
  String subtitle;
  IconData icon;
  String imageSrc;
  WidgetBuilder builder;

  Feature({
    this.title,
    this.subtitle,
    this.icon,
    this.imageSrc,
    this.builder,
  });
}