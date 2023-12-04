import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meup_wallet/Screens/ChooseNetwork.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isSwitchOn = false;
  bool showAdditionalOptions = false;
  PersistentBottomSheetController<dynamic>? _bottomSheetController;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String selectednetwork = 'Ağ seç';
  void updateAppbar(String newtitle){
    setState(() {
      selectednetwork=newtitle;
    });
  }

  void _openBottomSheet() {
    if (_bottomSheetController == null) {
      _bottomSheetController = _scaffoldKey.currentState?.showBottomSheet((context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: TextButton(
                      onPressed: () {
                        updateAppbar('Ağ 1');
                      },
                      child: Text(
                        'Ağ 1',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    title: TextButton(
                      onPressed: () {
                        updateAppbar('Ağ 2');
                      },
                      child: Text(
                        'Ağ 2',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Text('Test ağlarını göster  '),
                        Switch(
                          value: isSwitchOn,
                          onChanged: (value) {
                            setState(() {
                              isSwitchOn = value;
                              showAdditionalOptions = value;
                            });
                          },
                        ),
                      ],
                    ),
                    onTap: () {
                      if (!showAdditionalOptions) {}
                    },
                  ),
                  if (showAdditionalOptions)
                    ListTile(
                      title: TextButton(
                        onPressed: () {
                          updateAppbar('Ağ 3');
                        },
                        child: Text(
                          'Ağ 3',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  if (showAdditionalOptions)
                    ListTile(
                      title: TextButton(
                        onPressed: () {
                          updateAppbar('Ağ 4');
                        },
                        child: Text(
                          'Ağ 4',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ListTile( // Yeni eklenen ListTile
                    title: TextButton(
                      onPressed: () {
                        // "AĞ Ekle" butonuna tıklandığında yapılacak işlemler
                        // Örneğin, yeni bir sayfa açılabilir
                        _openNewPage();
                      },
                      child: Text(
                        'AĞ Ekle',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      });
    } else {
      _bottomSheetController?.close();
      _bottomSheetController = null;
    }
  }

  void _openNewPage() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => chooseNetwork()));
  }

  String selectedAccount='Account 1';

  int selectedIndex = 0;
  int subIndex = 0;

  final Map<int, Widget> mainSegments = {
    0: Text('  NFTler  '),
    1: Text('  Tokenlar  '),
  };



  Widget buildSelectedWidget() {
    switch (selectedIndex) {
      case 0:
        return NFTWidget();
      case 1:
        return TokenWidget();
      default:
        return Container(); // Varsayılan durum için boş bir container
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        title: Center(
          child: Center(
            child: TextButton(
              onPressed: _openBottomSheet,
              child: Text(selectednetwork),
            ),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/image/meuplogoo.jpeg'),
        ),
      ),
      body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Column(
                              children: [
                                DropdownButton<String>(
                                  isExpanded: true, // Genişletilmiş modu etkinleştirir
                                  value: selectedAccount, // Seçili değer
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedAccount = newValue!;
                                    });
                                  },
                                  items: <String>['Account 1', 'Account 2', 'Account 3']
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value,style: TextStyle(
                                          color: Colors.black87, fontSize: 18
                                      ),),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 12),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.0),
                            child: Row(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Adress: ',
                                    style: TextStyle(color: Colors.black87, fontSize: 19),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 12),

                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 60, // Container'ın yüksekliği
                    width: double.infinity, // Container'ı genişliği, ekrana yaymak için 'double.infinity' kullanılır
                    padding: EdgeInsets.all(10),
                    child: CupertinoSegmentedControl<int>(
                      groupValue: selectedIndex,
                      children: mainSegments,
                      onValueChanged: (value) {
                        setState(() {
                          selectedIndex = value!;
                          subIndex = 0; // Ana seçenek değiştiğinde alt seçenekleri sıfırla.
                        });
                      },
                      borderColor: Colors.grey.shade800,
                      selectedColor: Colors.grey.shade800,
                      pressedColor: Colors.grey.shade700,
                      unselectedColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  buildSelectedWidget(),
                ],
              ),
      ),
    );
  }
}

class NFTWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  ' 0 TL',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // Portföy butonuna tıklandığında yapılacak işlemler
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => PortfolioPage()));
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade700,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Text(
                    'Portföy ! ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ethereum",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "0 ETH",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Text(
                "0.0 TL",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Center(
            child: Text(
              "Başlamak için kripto ekleyin",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // "ETH Satın Alın" butonuna tıklandığında yapılacak işlemler
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => BuyEthPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Center(
                      child: Text("ETH Satın Alın")),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "Tokeninizi görmüyorsanız",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    // "Tokenleri İçe Aktar" butonuna tıklandığında yapılacak işlemler
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => ImportTokensPage()));
                  },
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text(
                    "Tokenleri İçe Aktar",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue.shade700,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

}

class TokenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.info,
                color: Colors.blue,
                size: 24,
              ),
              SizedBox(width: 8),
              Text(
                "NFT Otomatik Algılama",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            "MetaMask’ın OpenSea’dan NFT’leri otomatik olarak algılayıp MetaMask cüzdanında göstermesine izin verin.",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade700,
            ),
          ),
          SizedBox(height: 16),
          TextButton(
            onPressed: () {
              // Ayarlar kısmında NFT’leri otomatik algıla seçeneğini açın
            },
            child: Text(
              "Ayarlar kısmında NFT’leri otomatik algıla seçeneğini açın",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}



