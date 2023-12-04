import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:meup_wallet/Screens/Profile.dart';
import 'package:meup_wallet/Screens/Settings.dart';
import 'package:meup_wallet/Screens/Wallet.dart';

import 'Home.dart';
import 'gonderalbutton.dart';



class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
     Home(),
    const Profile(),
    const Search(),
    const Wallet(),
    const Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Seçilen sayfayı göster
      bottomNavigationBar: Container(
        color: Colors.grey.shade900,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            backgroundColor: Colors.grey.shade900,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade700,
            gap: 7,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index; // Seçilen sekmenin indeksini güncelle
              });
            },
            padding: EdgeInsets.all(16),
            tabs:  [
              GButton(icon: Icons.wallet),
              GButton(icon: Icons.access_time),
              GButton(icon: Icons.arrow_circle_up_outlined,
              onPressed: (){
                _showSearchOptions(context);
              },
              ),
              GButton(icon: Icons.compass_calibration),
              GButton(icon: Icons.settings),
            ],
          ),
        ),
      ),
    );
  }

  void _showSearchOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: TextButton(
                onPressed: () {
                  // Para gönderme işlemleri
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Icon(Icons.arrow_circle_up_outlined, color: Colors.black), // Gönderme ikonu
                    SizedBox(width: 8), // İkon ile metin arasında boşluk
                    Text(
                      'Para Gönder',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),

            ListTile(
              title: TextButton(
                onPressed: () {
                  // Para gönderme işlemleri
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Icon(Icons.arrow_circle_down_outlined, color: Colors.black), // Gönderme ikonu
                    SizedBox(width: 8), // İkon ile metin arasında boşluk
                    Text(
                      'Para Al',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
