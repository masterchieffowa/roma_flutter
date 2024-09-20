// import 'package:flutter/material.dart';
//
// Widget defaultTextFormField({
//   required TextEditingController controller,
//   required TextInputType type,
//   required String label,
//   required IconData prefix,
//   IconData? suffix,
//   Function? suffixPressed,
//   bool isPassword = false,
//   Function? onSubmit,
//   Function? onChange,
//   Function? onTap,
//   bool isClickable = true,
//   required String? Function(String?)? validate,
// }) =>
//     // TextFormField(
// // , ,  decoration: InputDecoration( labelText: label, prefixIcon: Icon( prefix, ), suffixIcon: suffix != null ? IconButton( onPressed: () { suffixPressed!(); }, icon: Icon( suffix, ), ) : null, border: OutlineInputBorder(), ), );
//     Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Expanded(
//           child: Text(
//             'Appointment Reason',
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 20,
//             ),
//             overflow: TextOverflow.ellipsis,
//             maxLines: 2,
//           ),
//         ),
//         const SizedBox(
//           height: 20,
//         ),
//         Container(
//           height: 100,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(25),
//             color: Colors.blueGrey[50],
//           ),
//           child: Padding(
//             padding: const EdgeInsets.only(left: 20.0, right: 20, top: 2),
//             child: TextFormField(
//               cursorColor: Colors.black38,
//               // Set the cursor color
//               keyboardType: type,
//               obscureText: isPassword,
//               enabled: isClickable,
//               onFieldSubmitted: (s) {
//                 onSubmit!(s);
//               },
//               onChanged: (s) {
//                 onChange!(s);
//               },
//               onTap: () {
//                 onTap!();
//               },
//               validator: validate,
//
//               maxLines: 5,
//               controller: controller,
//               decoration: const InputDecoration(
//                 suffixIcon: Padding(
//                   padding: EdgeInsets.only(bottom: 55.0, left: 20),
//                   child: Icon(Icons.edit_note_sharp),
//                 ),
//                 border: InputBorder.none,
//                 suffixIconColor: Colors.black38,
//                 hintText: 'Reason',
//                 hintStyle: TextStyle(
//                   color: Colors.black38,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(
//           height: 160,
//         ),
//       ],
//     );

import 'package:flutter/material.dart';

Widget defaultTextFeild({
  required TextEditingController controller,
  required type,
  required String label,
  required String hint,
  IconData? prefix,
  Widget? suffix,
  required Function validate,
  required Function onSubmit,
  required Function onChange,
  bool isPassword = false,
  bool isClickable = true,
  Color lablecolor = Colors.black,
  Color cursorColor = Colors.black38,
  Color suffixColor = Colors.black38,
  Color prefixColor = Colors.black38,
  Color hintColor = Colors.black38,

  TextInputType textInputType = TextInputType.text,
  InputBorder border = InputBorder.none,
  int maxLines = 1,
  double labelsize = 20,
  double feildheight = 50,
  double spacerhight = 20,
  double spacerwidth = 0,
  double borderRaduis = 25,
  double feildwidth = double.infinity,
  double topfeildpadding = 2,
  double leftfeildpadding = 20.0,
  double rightfeildpadding = 20,
  double bottomfeildpadding = 0,
  required Function suffixPressed,
// }) =>
//     TextFormField(
//       controller: controller,
//       keyboardType: type,
//       obscureText: isPassword,
//       enabled: isClickable,
//       onFieldSubmitted: (s) {
//         onSubmit(s);
//       },
//       onChanged: (s) {
//         onChange(s);
//       },
//       validator: (s) {
//         validate(s);
//       },
//       decoration: InputDecoration(
//         labelText: label,
//         prefixIcon: Icon(prefix),
//         suffixIcon: IconButton(
//           onPressed: () {
//             suffixPressed();
//           },
//           icon: Icon(suffix),
//         ),
//         border: OutlineInputBorder(),
//       ),
//     );
})=>Container(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
          color: lablecolor,
          fontSize: labelsize,
        ),
      ),
      SizedBox(
        height: spacerhight,
        width: spacerwidth,
      ),
      Container(
        width: feildwidth,
        height: feildheight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRaduis),
          color: Colors.blueGrey[50],
        ),
        child: Padding(
          padding: EdgeInsets.only(left: leftfeildpadding, right: rightfeildpadding,top: topfeildpadding, bottom: bottomfeildpadding),
          child: Form(
            key: GlobalKey<FormState>(),
            child: TextFormField(
              cursorColor: cursorColor, // Set the cursor color
              keyboardType: type,
              maxLines: maxLines,
              decoration: InputDecoration(
                prefixIcon: prefix != null
                    ? Icon(
                  prefix,
                  color: prefixColor,
                )
                    : null,
                suffixIcon: suffix != null
                    ? GestureDetector(
                      child: suffix,
                      onTap: () {
                        suffixPressed();
                      },
                    )
                    : null,
                suffixIconColor: suffixColor,
                border: border,
                hintText: hint,
                hintStyle: TextStyle(
                  color: hintColor,
                ),
              ),
              controller: controller,
              obscureText: isPassword,
              enabled: isClickable,
              onFieldSubmitted: (s) {
                onSubmit(s);
              },
              onChanged: (s) {
                onChange(s);
              },
              validator: (s) {
                validate(s);
              },
            ),
          ),
        ),
      ),
    ],
  ),
);

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.teal,
  bool isUpperCase = true,
  double radius = 25.0,
  required Function function,
  required String text,
  double fontSize = 20.0,
  Color color = Colors.white,
  required int height,
}) =>
    Container(
      width: width,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            fontSize: fontSize,
            color: color,
          ),
        ),
      ),
    );