import 'package:cots_ppb_ralfi/modules/BoardingPages/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cots_ppb_ralfi/design_system/theme.dart';

class PromoPage extends StatelessWidget {
  const PromoPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Menggunakan GetX Controller
    final PromoController promoController = Get.put(PromoController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Text(
          'Promo',
          style: AppTextStyles.heading2.copyWith(color: AppColors.black),
        ),
        centerTitle: false,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back, color: AppColors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              // XP Progress
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.lightGrey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      color: AppColors.primary2, // Placeholder for icon/logo
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '121 XP to your next treasure',
                            style: AppTextStyles.bodyRegular.copyWith(color: AppColors.grey),
                          ),
                          const SizedBox(height: 8),
                          LinearProgressIndicator(
                            value: 0.6,
                            backgroundColor: AppColors.grey,
                            color: AppColors.primary1,
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward, color: AppColors.black),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Cards Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCard('13\nVouchers', '13 Akan hangus', AppColors.primary2),
                  _buildCard('0\nLangganan', 'Lagi aktif', AppColors.primary3),
                  _buildCard('0\nMission', 'Lagi berjalan', AppColors.primary4),
                ],
              ),
              const SizedBox(height: 16),
              // Promo Code Input
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Masukan kode promo',
                          style: AppTextStyles.bodyRegular.copyWith(color: AppColors.grey),
                        ),
                      ),
                      const Icon(Icons.arrow_forward, color: AppColors.black),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Section Title
              Text(
                'Promo menarik buat kamu',
                style: AppTextStyles.subheading2,
              ),
              const SizedBox(height: 8),
              // Filter Chips (Horizontal Scrolling)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildFilterChip('Apa aja', isSelected: true),
                    _buildFilterChip('GoFood'),
                    _buildFilterChip('GoPay'),
                    _buildFilterChip('GoPayLater'),
                    _buildFilterChip('GoRide'),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text('Biar Makin Hemat', style: AppTextStyles.bodySemibold),
              const SizedBox(height: 16),
              // Promo Banners with Dots
              SizedBox(
                height: 210,
                child: Column(
                  children: [
                    Expanded(
                      child: PageView(
                        onPageChanged: (int page) {
                          // Mengupdate halaman aktif dengan controller GetX
                          promoController.setCurrentPage(page);
                        },
                        children: [
                          _buildPromoBanner(
                              'assets/images/sample_banner.png', 'Promo KFC DISC 50%'),
                          _buildPromoBanner(
                              'assets/images/sample_banner2.png', 'Promo MCD DISC 40%'),
                          _buildPromoBanner(
                              'assets/images/sample_banner3.png', 'Promo Burger King DISC 30%'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Obx(() {
                      // Menggunakan Obx untuk mendengarkan perubahan state
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          3, // Jumlah banner
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            width: promoController.currentPage.value == index ? 12 : 8,
                            height: 5,
                            decoration: BoxDecoration(
                              color: promoController.currentPage.value == index
                                  ? AppColors.primary1
                                  : AppColors.grey,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
              SizedBox(height: 16,),
              Text('Promo Menarik dari Brand Populer', style: AppTextStyles.bodySemibold),
              const SizedBox(height: 10),
              Text('Buat rileks atau produktif, kamu yang tentuin! ')
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(String title, String subtitle, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: AppTextStyles.bodyRegular,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: AppTextStyles.bodyRegular.copyWith(color: color),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, {bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ChoiceChip(
        label: Text(
          label,
          style: AppTextStyles.bodyRegular.copyWith(
            color: isSelected ? AppColors.white : AppColors.grey,
          ),
        ),
        selected: isSelected,
        selectedColor: AppColors.primary1,
        backgroundColor: AppColors.lightGrey,
        onSelected: (bool selected) {},
      ),
    );
  }

  Widget _buildPromoBanner(String imagePath, String description) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20), // Tambahkan margin antar banner
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 160, // Ukuran lebih kecil
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: AppTextStyles.subheading1,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}