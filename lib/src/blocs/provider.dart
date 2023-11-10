import 'package:flutter/material.dart';
import 'bloc.dart';
class Provider extends InheritedWidget{
  final bloc = Bloc();
  Provider({Key? key, required Widget child}): super(key: key, child: child);
  
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;


}