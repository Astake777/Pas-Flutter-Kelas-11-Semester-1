import 'package:pas_flutter_18_november/models/makanan_model.dart';

class OrderModel {

  // makanan yang dibeli
  MakananModel product;
  // jumlah yang dibeli
  int quantity;
  double subtotal;
  double diskon;
  double dpp;
  double ppn;
  double total;
  String status;

  OrderModel({
    required this.product,
    required this.quantity,
    required this.subtotal,
    required this.diskon,
    required this.dpp,
    required this.ppn,
    required this.total,
    required this.status,
  });
}


