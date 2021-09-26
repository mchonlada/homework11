import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homework11/pages/login/home_page.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static const pin = '123456';
  var input = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: const DecorationImage(
              image: const AssetImage("assets/images/bg.jpg"),
              fit: BoxFit.fill),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.lock_outline,
                          size: 90.0,
                          color: Colors.cyan,
                        ),
                        Text(
                          'LOGIN',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        SizedBox(height: 6.0),
                        Text(
                          'Enter PIN to login',
                          style: Theme.of(context).textTheme.headline6,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (var i = 0; i < input.length; i++)
                          Container(
                            margin: EdgeInsets.all(4.0),
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                shape: BoxShape.circle),
                          ),
                        for (var i = input.length; i < 6; i++)
                          Container(
                            margin: EdgeInsets.all(4.0),
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    )
                  ],
                ),
              ),
              _buildNumPad(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNumPad() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          [1, 2, 3],
          [4, 5, 6],
          [7, 8, 9],
          [-2, 0, -1],
        ].map((row) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: row.map((item) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: LoginButton(
                  number: item,
                  onClick: () {
                    _handleClickButton(item);
                  },
                ),
              );
            }).toList(),
          );
        }).toList(),
      ),
    );
  }

  void _handleClickButton(int num) {
    print('You pressed $num');

    setState(() {
      if (num == -1) {
        if (input.length > 0) input = input.substring(0, input.length - 1);
      } else {
        input = '$input$num';
      }

      if (input.length == pin.length) {
        if (input == pin) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        } else {
          _showMaterialDialog('ERROR', 'Invalid PIN. Please try again.');
        }

        input = '';
      }
    });
  }

  void _showMaterialDialog(String title, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(msg, style: Theme.of(context).textTheme.bodyText2),
          actions: [
            // ปุ่ม OK ใน dialog
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                // ปิด dialog
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class LoginButton extends StatelessWidget {
  final int number;
  final Function() onClick;

  const LoginButton({
    required this.number,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: CircleBorder(),
      onTap: number == -2 ? null : onClick,
      child: Container(
        width: 75.0,
        height: 75.0,
        decoration: number == -2
            ? null
            : BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.deepPurple.withOpacity(0.5),
          border: Border.all(
            width: 3.0,
            color: Colors.indigoAccent,
          ),
        ),
        child: Center(
          child: number >= 0
              ? Text(
            '$number', // number.toString()
            style: Theme.of(context).textTheme.headline6,
          )
              : (number == -1
              ? Icon(
            Icons.backspace_outlined,
            size: 28.0,
          )
              : SizedBox.shrink()),
        ),
      ),
    );
  }
}

