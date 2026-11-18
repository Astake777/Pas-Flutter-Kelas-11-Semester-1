// lib/pages/3_checkout_page.dart
// Halaman ini hanya MENAMPILKAN angka dari controller (tidak ada rumus di sini).
// tombol seragam
import 'package:pas_flutter_18_november/components/custom_button2.dart';
// baris rincian label dan nilai
import 'package:pas_flutter_18_november/components/summary_row.dart';
// semua angka hitungan
import 'package:pas_flutter_18_november/controller/checkout_controller.dart';
// format harga Rupiah
import 'package:pas_flutter_18_november/utils/format_rupiah.dart';
// widget bawaan Flutter
import 'package:flutter/material.dart';
// paket GetX
import 'package:get/get.dart';

// halaman 3: rincian pembayaran sebelum bayar
class CheckoutPage extends StatelessWidget {
  // constructor halaman
  CheckoutPage({super.key});

  // Get.put = buat controller; produk dan jumlah dibaca dari Get.arguments
  final controller = Get.put(CheckoutController());

  // build = menggambar tampilan halaman
  @override
  Widget build(BuildContext context) {
    // kerangka halaman
    return Scaffold(
      // bilah judul di atas
      appBar: AppBar(title: Text("Checkout")),
      // daftar yang bisa digulir (data tidak berubah di halaman ini, jadi tanpa Obx)
      body: ListView(
        // ruang di sekeliling isi
        padding: EdgeInsets.all(16),
        children: [
          // judul bagian produk
          Text("Produk", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          // nama x jumlah di kiri, subtotal di kanan
          SummaryRow(
            label: "${controller.product.namaMakanan} x${controller.quantity}",
            value: formatRupiah(controller.subtotal),
          ),
          // garis pemisah
          Divider(height: 32),
          // judul bagian rincian
          Text("Rincian Pembayaran", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          // harga x jumlah
          SummaryRow(label: "Subtotal", value: formatRupiah(controller.subtotal)),
          SummaryRow(
            // persen diskon dibaca dari controller, jadi ikut berubah jika diganti
            label: "Diskon ${(controller.diskonPersen * 100).round()}%",
            // tanda minus karena mengurangi
            value: formatRupiah(-controller.diskon),
          ),
          // harga setelah diskon
          SummaryRow(label: "DPP", value: formatRupiah(controller.dpp)),
          SummaryRow(
            // persen PPN dibaca dari controller
            label: "PPN ${(controller.ppnPersen * 100).round()}%",
            value: formatRupiah(controller.ppn),
          ),
          // garis pemisah sebelum total
          Divider(height: 32),
          // jumlah yang harus dibayar, dicetak tebal
          SummaryRow(
            label: "Total Pembayaran",
            value: formatRupiah(controller.total),
            bold: true,
          ),
        ],
      ),
      // tombol tetap di bawah layar
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: SizedBox(
            width: double.infinity,
            // tombol Bayar
            child: CustomButton2(
              myText: "Bayar (Simulasi)",
              myColor: Color(0xFFEE6C2B),
              // bayar: buat struk lalu pindah ke konfirmasi
              onPressed: () => controller.bayar(),
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// KEGUNAAN FILE
// Halaman checkout: menampilkan rincian subtotal, diskon, DPP, PPN, total. Tidak ada rumus di sini, semua dari controller.
//
// TERHUBUNG KE
// Memakai: controller/checkout_controller.dart, components/summary_row.dart, components/custom_button2.dart.
// Datang dari: pages/2_detail_page.dart.
// Tombol Bayar memanggil CheckoutController.bayar(), yang pindah ke Routes.konfirmasi.
// ============================================================
