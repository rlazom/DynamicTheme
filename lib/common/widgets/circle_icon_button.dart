import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color color;
  final Function fn;
  final bool border;

  const CircleIconButton({Key key, this.icon, this.fn, this.color, this.border = false, this.iconColor,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: color,
      shape: CircleBorder(side: border ? BorderSide(color: Theme.of(context).scaffoldBackgroundColor, width: 8) : BorderSide.none),
      onPressed: fn,
      child: new Padding(
        padding: const EdgeInsets.all(12.0),
        child: new Icon(icon, color: iconColor ?? Theme.of(context).textTheme.button.color),
      ),
    );
  }
}
