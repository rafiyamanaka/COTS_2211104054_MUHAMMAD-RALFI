import 'package:get/get.dart';

class PromoController extends GetxController {
  var currentPage = 0.obs; // Menyimpan halaman aktif dalam bentuk observable (reactive)
  
  // Fungsi untuk mengubah halaman aktif
  void setCurrentPage(int page) {
    currentPage.value = page;
  }
  final List<Map<String, String>> promoBanners = [
    {'imagePath': 'assets/images/sample_banner.png', 'description': 'Promo KFC DISC 50%'},
    {'imagePath': 'assets/images/sample_banner2.png', 'description': 'Promo MCD DISC 40%'},
    {'imagePath': 'assets/images/sample_banner3.png', 'description': 'Promo Burger King DISC 30%'},
  ];
}