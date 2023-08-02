// // ignore_for_file: prefer_const_constructors

// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:fzregex/utils/fzregex.dart';
// import 'package:fzregex/utils/pattern.dart';
// import 'package:instagram/shared/Colors.dart';

// class SharedTextFormFeild extends StatefulWidget {
//    bool? isValid=true ;
//    bool? isEmailFeild = false;
//    bool? isPasswordFeild = false;
//    bool? isObscure;
//    String lableName;
//    double badding;
//    TextInputType inputdata;
//    double fontTextsize;
//   Function(String)? onchange;
//   SharedTextFormFeild(
//       {super.key,
//       this.isValid,
//       this.isEmailFeild,
//       this.isPasswordFeild,
//       this.onchange,
//       this.isObscure,
//       required this.inputdata,
//       required this.lableName,
//       required this.badding,
//       this.fontTextsize = 16});

//   @override
//   State<SharedTextFormFeild> createState() => _SharedTextFormFeildState();
// }

// class _SharedTextFormFeildState extends State<SharedTextFormFeild> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 280,
//       height: 40,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(4),
//           border:
//               Border.all(color: Color.fromARGB(83, 70, 70, 70), width: 0.5)),
//       child: TextFormField(
//           validator: (value) {
//             if (widget.isEmailFeild == false && value == null ||
//                 value!.isEmpty ||
//                 !value.contains('@') ||
//                 !value.contains('.')) {
//               isValid = false;
//               return 'Invalid Email';
//             } else if (widget.isPasswordFeild == true && value.isEmpty ||
//                 value.length >= 8 ||
//                 value.contains(RegExp(r'[A-Z]')) ||
//                 value.contains(RegExp(r'[0-9]'))) {
//               isValid = false;
//               return 'Invalid Email';
//             } else {
//               isValid = true;
//             }
//             return ScaffoldMessenger.of(context)
//                 .showSnackBar(SnackBar(content: Text("Done")))
//                 .toString();
//           },
//           onChanged: widget.onchange,
//           autocorrect: true,
//           obscureText: widget.isObscure!,

//           keyboardType: widget.inputdata,
//           textInputAction: TextInputAction.done,
//           style: TextStyle(color: textColor),
//           decoration: InputDecoration(
//             suffixIcon:  InkWell(
//                                  onTap: () {
//                                    setState(() {
//                                      isObscure = !widget.isObscure;
//                                    });
//                                  },
//                                  child: Icon(
//                                    showPassword
//                                    ? Icons.visibility
//                                    : Icons.visibility_off,
//                                    color: const Color(0xff31708c)
//                                  ),
//                                ),
//             isDense: true,
//             labelText: widget.lableName,
//             labelStyle: TextStyle(color: textColor, fontSize: widget.fontTextsize),
//             contentPadding: EdgeInsets.all(widget.badding),
//             filled: true,
//             fillColor: widget.isValid!
//                 ? Color.fromARGB(121, 20, 177, 65)
//                 : Color.fromARGB(122, 197, 23, 23),
//             border: InputBorder.none,
//           )),
//     );
//   }
// }

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:instagram/shared/Colors.dart';

class SharedTextFormFeild extends StatefulWidget {
  //  bool isValid=false;
  // final bool? isEmailFeild;
  //  final bool? isPasswordFeild;
  //  bool? isObscure;
  // final String lableName;
  // final double badding;
  // final TextInputType inputdata;
  // final double fontTextsize;
  // final Function(String)? onchange;
  final String? text;
  final InputBorder border;
  final TextEditingController controller;
  final String? hint;
  final TextInputType keyboardType;
  final bool isPasswordField;
  bool isPasswordVisible = false;
  final Function(String)? onChange;
  final Function validator;
  final Function? toggelPasswordFunction;
  final FocusNode? focusNode;

  SharedTextFormFeild(
      {Key? key,
      this.text,
      this.hint,
      required this.controller,
      required this.border,
      required this.isPasswordField,
      this.isPasswordVisible = false,
      required this.onChange,
      required this.validator,
      this.toggelPasswordFunction,
      this.focusNode,
      required this.keyboardType
      // this.isEmailFeild,
      // this.isPasswordFeild,
      // this.onchange,
      // required this.isObscure,
      // required this.inputdata,
      // required this.lableName,
      // required this.badding,
      // this.fontTextsize = 16,
      })
      : super(key: key);

  @override
  State<SharedTextFormFeild> createState() => _SharedTextFormFeildState();
}

class _SharedTextFormFeildState extends State<SharedTextFormFeild> {
  // bool? isValid;

  @override
  void initState() {
    super.initState();
    // isValid = widget.isValid;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 280,
        height: 42,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: const Color.fromARGB(159, 70, 70, 70),
            width: 0.5,
          ),
        ),
        child: Center(
          child: TextFormField(
            style: const TextStyle(color: Colors.black),
            keyboardType: widget.keyboardType,
            onChanged: widget.onChange,
            controller: widget.controller,
            obscureText:
                (widget.isPasswordField) ? !widget.isPasswordVisible : false,
            validator: (value) => widget.validator(value),
            focusNode: widget.focusNode,
            onEditingComplete: () {
              // Move focus to next TextFormField widget
              FocusScope.of(context).nextFocus();
            },
            decoration: InputDecoration(
              border: widget.border,
              prefixIcon: (widget.isPasswordField)
                  ? Icon(
                      Icons.lock,
                      color: Colors.grey.withOpacity(0.5),
                    )
                  : Icon(
                      Icons.email_rounded,
                      color: Colors.grey.withOpacity(0.5),
                    ),
              suffixIcon: (widget.isPasswordField)
                  ? InkWell(
                      onTap: () {
                        widget.toggelPasswordFunction!();
                       
                      },
                      child: (widget.isPasswordVisible)
                          ?  Icon(
                              Icons.visibility,
                              color: const Color.fromARGB(255, 9, 106, 186),
                            )
                          : Icon(
                              Icons.visibility_off,
                              color: const Color.fromARGB(255, 18, 24, 31)
                                  .withOpacity(0.5),
                            ),
                    )
                  : null,
              hintText: widget.hint,
              hintStyle: const TextStyle(
                color: Color.fromARGB(128, 0, 0, 0),
              ),
              fillColor: Color.fromARGB(139, 242, 237, 237),
              filled: true,
            ),
          ),
        ));
  }
}

    // TextFormField(
    //     validator: (value) {
    //       if (!widget.isEmailFeild! &&
    //           (value == null || value.isEmpty || !value.contains('@') || !value.contains('.'))) {
    //         setState(() {
    //           isValid = false;
    //         });
    //         return 'Invalid Email';
    //       } else if (widget.isPasswordFeild! &&
    //           (value == null || value.isEmpty || value.length < 8 || !value.contains(RegExp(r'[A-Z]')) || !value.contains(RegExp(r'[0-9]')))) {
    //         setState(() {
    //           isValid = false;
    //         });
    //         return 'Invalid Password';
    //       } else {
    //         setState(() {
    //           isValid = true;
    //         });
    //       }
    //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Done")));
    //       return null;
    //     },
    //     onChanged: widget.onchange,
    //     autocorrect: true,
    //     obscureText: widget.isObscure!,
    //     keyboardType: widget.inputdata,
    //     textInputAction: TextInputAction.done,
    //     style:const TextStyle(color: textColor),
    //     decoration: InputDecoration(
    //       suffixIcon:widget.isPasswordFeild!?InkWell(
    //         onTap: () {
             
    //             widget.isObscure = !widget.isObscure!;
             
    //         },
    //         child: Icon(
    //           widget.isObscure! ? Icons.visibility : Icons.visibility_off,
    //           color: const Color(0xff31708c),
    //         ),
    //       ):null,
    //       isDense: true,
    //       labelText: widget.lableName,
    //       labelStyle: TextStyle(color: textColor, fontSize: widget.fontTextsize),
    //       contentPadding: EdgeInsets.all(widget.badding),
    //       filled: true,
    //       fillColor: isValid! ? Color.fromARGB(121, 20, 177, 65) : Color.fromARGB(122, 197, 23, 23),
    //       border: InputBorder.none,
          
    //     ),
    //   ),
    // );
