import 'package:pas_flutter_18_november/models/review_model.dart';

class MakananModel {
  String namaMakanan;
  double hargaMakanan;
  String gambar;
  String desc;
  int rating; // jumlah bintang 1-5
  List<ReviewModel> review;

  MakananModel({
    required this.namaMakanan,
    required this.hargaMakanan,
    required this.gambar,
    required this.desc,
    required this.rating,
    required this.review,
  });
}
