import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  String title;
  TextEditingController? controller;
  bool readOnly = false;
  double? width;
  InputBorder? borderType;
  EdgeInsets? padding;
  void Function(String)? changed;
  void Function()? tap;

  TextFieldWidget({
    Key? key,
    required this.title,
    this.controller,
    required this.readOnly,
    this.width,
    this.borderType,
    this.padding,
    this.changed,
    this.tap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: title != 'Judul Kegiatan'
          ? const EdgeInsets.only(left: 30, top: 10, bottom: 10)
          : const EdgeInsets.only(left: 20),
      padding: padding,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: TextField(
        controller: controller,
        onChanged: changed,
        onTap: tap,
        readOnly: readOnly,
        maxLines: title == 'Tambah Keterangan' ? 3 : null,
        decoration: InputDecoration(
          border: borderType,
          hintText: title,
        ),
      ),
    );
  }
}
