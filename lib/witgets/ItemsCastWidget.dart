import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemCastWitget extends StatelessWidget {
  String? nombre;
  String? actor;

  ItemCastWitget({this.nombre, this.actor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 2.0),
      width: 100,
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(
                "https://images.pexels.com/photos/1446948/pexels-photo-1446948.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
          ),
          Text(
            nombre!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 13),
          ),
          Text(
            actor!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 12),
          )
        ],
      ),
    );
  }
}
