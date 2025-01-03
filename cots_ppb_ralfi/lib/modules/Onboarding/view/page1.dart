import 'package:cots_ppb_ralfi/design_system/theme.dart';
import 'package:cots_ppb_ralfi/modules/Loginpage/view/login.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _carouselData = [
    {
      "image": "assets/Images/Picture/onboarding1.png",
      "title": "Selamat datang di Gojek!",
      "description":
          "Aplikasi yang bikin hidupmu lebih nyaman. Siap bantuin  semua kebutuhan mu, kapanpun, dan di manapun",
    },
    {
      "image": "assets/Images/Picture/onboarding2.png",
      "title": "Transportasi & Logistik",
      "description":
          "Antarin kamu jalan atau ambilin barang lebih gampang tinggal ngeklik doang~",
    },
    {
      "image": "assets/Images/Picture/onboarding3.png",
      "title": "Pesan makan & belanja",
      "description": "Lagi ngidam sesuatu? Gojek beliin gak pakai lama.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Logos
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/Images/Logo/Gojek-Logo.png', height: 20),
                  SizedBox(width: 10),
                  Image.asset('assets/Images/Logo/Language.png', height: 26),
                ],
              ),

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Carousel
                    Container(
                      height: MediaQuery.of(context).size.height *
                          0.5, // Increased to 70% of screen height
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: _carouselData.length,
                        onPageChanged: (int page) {
                          setState(() {
                            _currentPage = page;
                          });
                        },
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(_carouselData[index]["image"]!,
                                    height: MediaQuery.of(context).size.height *
                                        0.3), // Adjust image height
                                SizedBox(height: 5),
                                Text(
                                  _carouselData[index]["title"]!,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 10),
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Text(
                                      _carouselData[index]["description"]!,
                                      style: TextStyle(
                                          fontSize: 14, color: AppColors.grey),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 5),

                    // Page indicator
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _carouselData.length,
                        (index) => Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage == index
                                ? AppColors.greenGojek
                                : AppColors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Login button
              Positioned(
                top: 631,
                left: 15,
                child: Container(
                  width: 330,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Implement login functionality
                    },
                    child: Text(
                      'Masuk',
                      style: TextStyle(color: AppColors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.green,
                      padding: EdgeInsets.only(top: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(20)),
                      ),
                      elevation: 0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8), // Gap between buttons
              Positioned(
                top: 679, // 631 + 40 + 8 (button height + gap)
                left: 15,
                child: Container(
                  width: 330,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: Text(
                      'Belum ada akun? Daftar dulu',
                      style: TextStyle(color: AppColors.green),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: AppColors.green,
                      backgroundColor: AppColors.white,
                      padding: EdgeInsets.only(top: 8),
                      side: BorderSide(color: AppColors.green),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(20)),
                      ),
                      elevation: 0,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),

              // Terms and conditions
              Align(
                alignment: Alignment.bottomLeft,
                child: TextButton(
                  onPressed: () {
                    // TODO: Show terms and conditions
                  },
                  child: Text(
                    'Dengan masuk atau mendaftar, kamu menyetujui \nKetentuan layanan dan Kebijakan privasi.',
                    style: TextStyle(fontSize: 12, color: AppColors.grey),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
