import 'package:flutter/material.dart';

class ResultadoWigdet extends StatelessWidget implements PreferredSizeWidget {
  final bool venceu;
  final Function onReniciar;

  ResultadoWigdet({
    @required this.venceu,
    @required this.onReniciar,
  });

  Color _getCor() {
    if (venceu == null) {
      return Colors.yellow;
    } else if (venceu) {
      return Colors.green[300];
    } else {
      return Colors.red[300];
    }
  }

  IconData _getIcons() {
    if (venceu == null) {
      return Icons.sentiment_satisfied;
    } else if (venceu) {
      return Icons.sentiment_very_satisfied;
    } else {
      return Icons.sentiment_very_dissatisfied;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: CircleAvatar(
            backgroundColor: _getCor(),
            child: IconButton(
              padding: EdgeInsets.all(0),
              icon: Icon(
                _getIcons(),
                color: Colors.black,
                size: 35,
              ),
              onPressed: onReniciar,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(120);
}
