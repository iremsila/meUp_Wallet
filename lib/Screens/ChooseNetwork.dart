import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class chooseNetwork extends StatefulWidget {
  const chooseNetwork({super.key});

  @override
  State<chooseNetwork> createState() => _chooseNetworkState();
}

class _chooseNetworkState extends State<chooseNetwork> {
  int _currentIndex = 0;
  Map<int, Widget> _segments = {
    0: Text(
      '      Popüler      ',
      style: TextStyle(fontSize: 22),
    ),
    1: Text(
      '      Özel Ağlar      ',
      style: TextStyle(fontSize: 22),
    ),
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        title: Text(
          "AĞLAR",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 22,
          ),
        ),
        centerTitle: true, // Başlığı ortala
        automaticallyImplyLeading: false, // Geri butonunu kaldır
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop(); // Sayfayı kapat
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: CupertinoSlidingSegmentedControl<int>(
              groupValue: _currentIndex,
              children: _segments,
              onValueChanged: (value) {
                setState(() {
                  _currentIndex = value!;
                });
              },
            ),
          ),
          // İçeriğinizi buraya ekleyin
          _currentIndex == 0
              ? _buildPopulerContent()
              : _buildOzelAglarContent(),
          SizedBox(height: 16), // Ekle butonu ile arasına bir boşluk ekleyebilirsiniz
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade400,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextButton(
              onPressed: () {},
              child: Text("Ekle",style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPopulerContent() {
    return Container(
      // Popüler ağlar için içerik
      child: Text(
        'Popüler Ağlar',
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  Widget _buildOzelAglarContent() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Dikey eksende sola yasla
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.grey.shade400,
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Kötü amaçlı bir ağ sağlayıcı blok zincirinin durumu hakkında yalan söyleyebilir ve ağ aktivitenizi kaydedebilir. Sadece güvendiğiniz özel ağları ekleyin.',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            buildTextFormField("Ağ adı", "Ağ Adı (İsteğe bağlı)"),
            buildTextFormField("RPC Url adresi", "Yeni RPC Ağı"),
            buildTextFormField("Zincir Kimliği", "Zincir Kimliği"),
            buildTextFormField("Sembol", "Sembol (İsteğe bağlı)"),
            buildTextFormField("Blok Gezgini URL adresi", "Blok Gezgini URL adresi (İsteğe bağlı)"),
          ],
        ),
      ),
    );
  }

  Widget buildTextFormField(String labelText, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
      SizedBox(height: 8),
        Text(labelText,style: TextStyle(
          fontWeight: FontWeight.w700
        ),),
        SizedBox(height: 10),
        TextFormField(
          style: TextStyle(color: Colors.black87),
          decoration: InputDecoration(
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.white,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey.shade600),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
          ),
        ),
      ],
    );
  }

}