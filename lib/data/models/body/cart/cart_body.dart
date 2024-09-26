import 'dart:io';

import 'package:dio/dio.dart';

class CartBody {
  int? width;
  int? height;
  int? length;
  String? note;
  int? designId;
  File? corner1;
  File? corner2;
  File? corner3;
  File? corner4;
  File? pdf;
  File? dwg;
  String? id;

  CartBody(
      {this.width,
      this.height,
      this.length,
      this.note,
      this.designId,
      this.corner1,
      this.corner2,
      this.corner3,
      this.corner4,
      this.pdf,
      this.dwg,
      this.id});

  FormData toFormData() {
    final formData = FormData();

    formData.fields
      ..add(MapEntry('width', width.toString()))
      ..add(MapEntry('height', height.toString()))
      ..add(MapEntry('length', length.toString()))
      ..add(MapEntry('note', note.toString()))
      ..add(MapEntry('id', id.toString()))
      ..add(MapEntry('design_id', designId.toString()));

    if (corner1 != null) {
      formData.files.add(MapEntry(
        'corner_1',
        MultipartFile.fromFileSync(corner1!.path),
      ));
    }
    if (corner2 != null) {
      formData.files.add(MapEntry(
        'corner_2',
        MultipartFile.fromFileSync(corner2!.path),
      ));
    }
    if (corner3 != null) {
      formData.files.add(MapEntry(
        'corner_3',
        MultipartFile.fromFileSync(corner3!.path),
      ));
    }
    if (corner4 != null) {
      formData.files.add(MapEntry(
        'corner_3',
        MultipartFile.fromFileSync(corner4!.path),
      ));
    }
    if (pdf != null) {
      formData.files.add(MapEntry(
        'pdf',
        MultipartFile.fromFileSync(pdf!.path),
      ));
    }
    if (dwg != null) {
      formData.files.add(MapEntry(
        'dwg',
        MultipartFile.fromFileSync(dwg!.path),
      ));
    }
    return formData;
  }
}
