import 'package:cots_ppb_ralfi/design_system/theme.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                searchBar(),
                gopayCardBanner(),
                goClubBanner(),
                promoBanner(),
                // promoMerdeka(),
                // promoGoFood(),
                // promoGoClub(),
                SizedBox(height: 100),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            // child: bottomNavBar(),
          ),
        ],
      ),
    );
  }

  Widget searchBar() {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 40, 15, 20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 10),
                  Text('Cari layanan, makanan, & tujuan',
                      style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ),
          SizedBox(width: 15),
          CircleAvatar(
            backgroundColor: Colors.green,
            child: Icon(Icons.person, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget gopayCardBanner() {
    return Container(
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/icons/gopay_logo.png', height: 20),
                SizedBox(height: 5),
                Text('Rp 100.000',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildGopayAction(Icons.arrow_upward, 'Bayar'),
                _buildGopayAction(Icons.add, 'Top Up'),
                _buildGopayAction(Icons.explore, 'Eksplor'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGopayAction(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.blue, size: 20),
        ),
        SizedBox(height: 5),
        Text(label, style: TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }

  Widget goClubBanner() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade200, blurRadius: 5, spreadRadius: 1)
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset('assets/icons/goclub.png', height: 20),
                  SizedBox(width: 5),
                  Text('GoClub', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              Text('Program Loyalitas Gojek',
                  style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Ikutan Gratis'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ],
      ),
    );
  }

  Widget promoBanner() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade200, blurRadius: 5, spreadRadius: 1)
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.asset('assets/images/promo_banner.png',
                fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Belanjanya diskon, ongkirnya juga diskon',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Text(
                    'Belanja di Tokopedia, dapat cashback dan gratis ongkir dengan GoSend',
                    style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPromoMerdeka() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Promo Merdeka buat kamu',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Diskon dari GoRide/GoCar, paket hemat GoSend, dan diskon GoPay!',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildPromoCard(
                    'Diskon GoRide 17%', 'assets/images/goride_promo.png'),
                SizedBox(width: 12),
                _buildPromoCard(
                    'Hemat GoSend 45%', 'assets/images/gosend_promo.png'),
                SizedBox(width: 12),
                _buildPromoCard(
                    'Cashback GoPay 8%', 'assets/images/gopay_promo.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPromoCard(String title, String imagePath) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            child: Image.asset(imagePath,
                height: 100, width: 200, fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildPromoGoFood() {
    return Container(
      margin: EdgeInsets.all(16),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage('assets/images/gofood_promo.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildPromoGoClub() {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.green.shade50,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('GoClub',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              SizedBox(height: 4),
              Text('Nikmati berbagai benefit menarik!',
                  style: TextStyle(fontSize: 14)),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Gabung Sekarang'),
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.green),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavBarItem(Icons.home, 'Beranda', true),
          _buildNavBarItem(Icons.assignment, 'Pesanan', false),
          _buildNavBarItem(Icons.mail, 'Chat', false),
          _buildNavBarItem(Icons.person, 'Akun', false),
        ],
      ),
    );
  }

  Widget _buildNavBarItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: isActive ? Colors.green : Colors.grey),
        Text(label,
            style: TextStyle(color: isActive ? Colors.green : Colors.grey)),
      ],
    );
  }
}
