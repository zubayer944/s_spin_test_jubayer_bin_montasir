import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'colors.dart';

class CustomTextFromField {
  Widget textFromField(
      {String? titleText,
      required String? hintTile,
      String? Function(String?)? validator,
      TextInputType? keyboardType,
      String? mandatorySign,
      void Function()? onTap,
      void Function(String)? onChanged,
      TextEditingController? controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: RichText(
              text: TextSpan(
                text: '$mandatorySign ',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: redColor, fontSize: 16),
                children: <TextSpan>[
                  TextSpan(
                      text: ' $titleText',
                      style: const TextStyle(color: blackColor, fontSize: 14)),
                ],
              ),
            )),
        const SizedBox(
          height: 5,
        ),
        Container(
          // width: 338,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextFormField(
            onChanged: onChanged,
            controller: controller,
            onTap: onTap,
            validator: validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: keyboardType,
            maxLines: null,
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              hintText: hintTile.toString(),
              hintStyle: const TextStyle(fontSize: 18),
              border: const OutlineInputBorder(),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: blueBtnBackgroundColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
