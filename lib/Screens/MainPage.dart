import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:meup_wallet/Screens/Profile.dart';
import 'package:meup_wallet/Screens/Settings.dart';
import 'package:meup_wallet/Screens/Wallet.dart';

import 'Home.dart';
import 'Search.dart';



class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Home(),
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
            tabs: const [
              GButton(icon: Icons.home, text: 'Ana Sayfa'),
              GButton(icon: Icons.person, text: 'Profil'),
              GButton(icon: Icons.search, text: 'Arama'),
              GButton(icon: Icons.wallet, text: 'Cüzdan'),
              GButton(icon: Icons.settings, text: 'Ayarlar'),
            ],
          ),
        ),
      ),
    );
  }
}
