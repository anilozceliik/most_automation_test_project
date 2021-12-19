import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_most_test_project/core/services/api_services.dart';
import 'package:flutter_most_test_project/screen/dashboard/home.dart';
import 'package:kartal/kartal.dart';


class UserLogin extends StatefulWidget {
  const UserLogin({Key? key}) : super(key: key);

  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  ApiServices _apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: context.width,
            height: context.height,
            child: Image.asset(
              'assets/bg.png',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20),
              width: context.width,
              height: context.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/logo.png',
                        width: context.width * 0.6,
                      ),
                    ],
                  ),
                  context.emptySizedHeightBoxLow3x,
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  context.emptySizedHeightBoxLow,
                  Text(
                    'Please sign in to continune.',
                    style: TextStyle(
                        fontSize: 19,
                        color: Colors.white.withOpacity(0.6),
                        fontWeight: FontWeight.bold),
                  ),
                  context.emptySizedHeightBoxLow3x,
                  Container(
                    width: context.width,
                    height: 55,
                    padding: EdgeInsets.only(left: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          color: Colors.grey.withOpacity(0.7),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _username,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        border: InputBorder.none,
                        labelText: 'Username',
                      ),
                    ),
                  ),
                  context.emptySizedHeightBoxLow3x,
                  Container(
                    width: context.width,
                    height: 55,
                    padding: EdgeInsets.only(left: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          color: Colors.grey.withOpacity(0.7),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _password,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        border: InputBorder.none,
                        labelText: 'Password',
                      ),
                    ),
                  ),
                  context.emptySizedHeightBoxLow3x,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () async {
                          var isSuccess =
                              await _apiServices.getUserLoginIsSuccess(
                                  _username.text, _password.text);
                          if (isSuccess.toString() == 'true') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          }else
                            showDialog(
                              barrierDismissible: false,
                                context: context, builder: (BuildContext context){
                                return AlertDialog(
                                  title: Text ("Warning"),
                                  content: Text ("Incorrect login information"),
                                  actions: <Widget>[
                                    MaterialButton(
                                      child: Text("Back"),
                                      onPressed: () => Navigator.pop(context),
                                    ),
                                  ],
                                );
                            },);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: context.width * 0.4,
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'LOGIN',
                                  style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 30,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
