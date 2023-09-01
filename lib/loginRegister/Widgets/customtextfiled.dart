import 'package:flutter/material.dart';
import 'package:shopapp/constant.dart';

class TextfiledF extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final void Function(String)? onchange;
  final String? Function(String?)? validator;
  final IconButton icon;
  final Function()? ontap;
  final bool password;
  const TextfiledF(
      {super.key,
      required this.controller,
      required this.password,
      required this.hint,
      required this.icon,
      required this.onchange,
      this.ontap,
      this.validator});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        inputFormatters: [],
        controller: controller,
        obscureText: password,
        decoration: InputDecoration(
            fillColor: Colors.black,
            errorBorder: OutlineInputBorder(),
            focusedErrorBorder: OutlineInputBorder(),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 234, 10, 140))),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(
                    // color: Colors.grey
                    )),
            contentPadding: EdgeInsets.all(20),
            labelStyle: TextStyle(color: defultcolor, fontSize: 20),
            hintText: hint,
            suffixIcon: icon,
            suffixIconColor: Color.fromARGB(255, 234, 10, 140)),
        onTap: ontap,
        onChanged: onchange,
        validator: validator,
      ),
    );
  }
}
