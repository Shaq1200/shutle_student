import 'package:flutter/material.dart';

class RoundedButton extends RaisedButton{
  final VoidCallback onPressed;
  final Widget child;
  final Color color;

  const RoundedButton ( {
    @required this.onPressed, this.child,this.color,
  })
      : super(onPressed: onPressed, child: child,);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Theme(
      data: Theme.of(context).copyWith(
          buttonTheme: Theme.of(context).buttonTheme.copyWith(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
              )
          )
      ),
      child: Builder(builder: super.build),
    );
  }

}