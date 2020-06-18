import 'package:flutter/material.dart';

class RoundedAlert extends StatelessWidget {
  final String title;
  final String content;

  RoundedAlert({this.title, this.content});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)), //this right here
      child: Container(
        height: 160,
        width: 300,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: <Widget>[
                  Center(
                      child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF9a0b0b),
                    ),
                  )),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Text(
                      content,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 120.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "OK",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: const Color(0xFF9a0b0b),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
