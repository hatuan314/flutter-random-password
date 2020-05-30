import 'package:flutter/material.dart';

class PasswordLengthForm extends StatefulWidget {
  final TextEditingController controller;


  const PasswordLengthForm({Key key, this.controller}) : super(key: key);

  @override
  _PasswordLengthForm createState() => _PasswordLengthForm();
}

class _PasswordLengthForm extends State<PasswordLengthForm> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      controller: widget.controller,
      style: TextStyle(fontSize: 18, color: Colors.black87),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          errorStyle: TextStyle(fontSize: 14, color: Colors.redAccent),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.red[800])),
          hintText: '8',
          hintStyle: TextStyle(fontSize: 18, color: Colors.black38),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.black)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.black)),
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12)),
      validator: (value) {
        if (value.isEmpty) return 'This field isn\'t empty';
        return null;
      },
    );
  }
}
