import 'package:flutter/material.dart';
import 'bloc.dart';
class Provider extends InheritedWidget{
  final bloc = Bloc();
  Provider({Key? key, required Widget child}): super(key: key, child: child);
  // java
  // Provider(Key key, Widget child){
  // super (key, child)
  // }
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static Bloc of (BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<Provider>()!.bloc;
  }
}