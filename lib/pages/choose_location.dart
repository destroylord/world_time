import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  @override
  void getData() async{
    String username = await Future.delayed(Duration(seconds: 3), () {
      return 'Yoshi';
    });

    String bio = await Future.delayed(Duration(seconds: 3), () {
      return 'vegan, musician & egg collector';
    });

    print('$username - $bio');
  }

  void initState() {
    super.initState();
    getData();
    print('hey there');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
        title: Text('Choose a Location'),
        elevation: 0,
      ),
      body: Center(
          // child: RaisedButton(
          //   onPressed: () {
          //     setState((){
          //       // counter += 1;
          //     });
          //   },
          //   // child: Text('Counter is $counter'),
          // ),
          ),
    );
  }
}
