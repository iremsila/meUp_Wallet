import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meup_wallet/SettingsDetail/Genel.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List<SettingItem> settingItems = [
    SettingItem(
      title: 'Genel',
      description: 'Para birimi dönüştürme, birincil para birimi, dil ve arama motoru',
    ),
    SettingItem(
      title: 'Güvenlik ve Gizlilik',
      description: 'Gizlilik ayarları, MetaMetrics, özel anahtar ve cüzdan Gizli Kurtarma İfadesi',
    ),
    SettingItem(
      title: 'Gelişmiş',
      description: 'Erişim geliştirici özellikleri, hesabı sıfırla, kurulum test ağları, durum günlükleri, IPFS ağ geçidi ve özel RPC',
    ),
    SettingItem(
      title: 'Kişiler',
      description: 'Hesap ekle, düzenle, kaldır ve hesaplarını yönet',
    ),
    SettingItem(
      title: 'Ağlar',
      description: 'Kişisel RPC ağı ekle ve düzenle',
    ),
    SettingItem(
      title: 'Kripto Satın Al',
      description: 'Bölge ve daha fazlası...',
    ),
    SettingItem(
      title: 'Deneysel',
      description: 'WalletConnect ve daha fazlası...',
    ),
    SettingItem(
      title: 'MeUp Wallet Hakkında',
        description: ''
    ),
    SettingItem(
      title: 'Bir özellik talep et',
      description: '',
    ),
    SettingItem(
      title: 'Destek ile iletişim kurun',
      description: '',
    ),
    SettingItem(
      title: 'Kilitle',
      description: '',
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text('Ayarlar',
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey.shade800,
      ),
        body: ListView.builder(
        itemCount: settingItems.length,
        itemBuilder: (context, index) {
      SettingItem settingItem = settingItems[index];
      return Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              if (index == 0) {
                // İlk liste öğesine tıklanırsa Genel Ayarlar sayfasına git
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Genel()));
              }
              else if (index == 1) {
                // İkinci liste öğesine tıklandığında yapılacak işlem
              }
              // ve benzer şekilde diğer liste öğeleri için işlemleri ekleyebilirsiniz.
            },
            child: ListTile(
              title:Text(
                settingItem.title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: settingItem.title == 'Kilitle' ? Colors.blue : Colors.black,
                ),
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(top: 8.0), // title ve description arasındaki boşluğu ayarlayın
                child: Text(settingItem.description,
                style: TextStyle(
                  color: Colors.grey.shade800
                ),),
              ),
            ),
          ),
          Divider(
            color: Colors.black, // Siyah bir çizgi rengi
            thickness: 1, // Çizgi kalınlığı
          ),
        ],
      );
    },
    ),
    );
  }
}

    class SettingItem {
  final String title;
  final String description;
  bool isEnabled;

  SettingItem({
    required this.title,
    required this.description,
    this.isEnabled = false,
  });
}

