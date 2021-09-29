import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String value;
  final String hint;
  final String label;
  final bool isnumber;
  const InputField({
    Key? key,
    this.value = "defaultValue",
    this.hint = "value",
    this.label = "Enter value",
    this.isnumber = false,
  }) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  String? val(value) {
    if (value == null || value.isEmpty || widget.isnumber
        ? double.tryParse(value) == null
        : false) {
      return 'Please ' + widget.label;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          cursorColor: Colors.black,
          cursorWidth: 1,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
            fillColor: Color(0xFFB352DD),
            labelStyle: TextStyle(color: Colors.white),
            filled: true,
            errorStyle: TextStyle(color: Colors.yellow[300]),
            focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
          ),
          validator: val,
          onSaved: (value) => {
            // user[widget.value] = value,
          },
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
