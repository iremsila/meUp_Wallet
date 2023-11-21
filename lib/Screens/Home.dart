import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                    title: TextButton(onPressed: (){
                      updateAppbar('Ağ 1');
                    } ,child: Text('Ağ 1',
                    style: TextStyle(
                      color: Colors.black,
                    ),)),
                  ),
                  ListTile(
                    title: TextButton(onPressed: (){updateAppbar('Ağ 2');} ,child: Text('Ağ 2',
                      style: TextStyle(
                        color: Colors.black
                      ),)),
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
                      title: TextButton(onPressed: (){updateAppbar('Ağ 3');} ,child: Text('Ağ 3',style: TextStyle(
                        color: Colors.black
                      ),)),
                    ),
                  if (showAdditionalOptions)
                    ListTile(
                      title: TextButton(onPressed: (){updateAppbar('Ağ 4');} ,child: Text('Ağ 4',style: TextStyle(
                        color: Colors.black
                      ),)),
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
  String selectedAccount='Account 1';

  int selectedIndex = 0;
  int subIndex = 0;

  final Map<int, Widget> mainSegments = {
    0: Text('NFTler'),
    1: Text('Tokenlar'),
  };

  final Map<int, List<Widget>> subSegments = {
    0: [
      Text('NFT 1'),
      Text('NFT 2'),
      Text('NFT 3'),
    ],
    1: [
      Text('Token 1'),
      Text('Token 2'),
      Text('Token 3'),
    ],
  };

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
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
                  CupertinoSegmentedControl<int>(
                    groupValue: selectedIndex,
                    children: mainSegments,
                    onValueChanged: (value) {
                      setState(() {
                        selectedIndex = value!;
                        subIndex = 0; // Ana seçenek değiştiğinde alt seçenekleri sıfırla.
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: subSegments[selectedIndex]!.map((subSegment) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            subIndex = subSegments[selectedIndex]!.indexOf(subSegment);
                          });
                        },
                        child: Row(
                          children: [
                            Radio<int>(
                              value: subSegments[selectedIndex]!.indexOf(subSegment),
                              groupValue: subIndex,
                              onChanged: (value) {
                                setState(() {
                                  subIndex = value!;
                                });
                              },
                            ),
                            subSegment,
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),

      ),
    );
  }
}
