import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pokeapp/themes/light.theme.dart';

class LoadingWidget extends StatefulWidget {
  @observable
  String message = '';

  LoadingWidget({this.message});
  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              this.widget.message,
              style: TextStyle(
                color: secondaryColor.shade600,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        CircularProgressIndicator(
          backgroundColor: primaryColor,
          strokeWidth: 3,
          valueColor:
              new AlwaysStoppedAnimation<Color>(secondaryColor.shade600),
        ),
      ],
    );
  }
}
