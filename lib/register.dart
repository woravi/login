import 'package:flutter/material.dart';
// import 'package:login/login.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  @override
  final formKey = GlobalKey<FormState>();

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();

  Future sign_up() async {
    String url = "https://www.rw1968.com/register.php";
    final response = await http.post(Uri.parse(url), body: {
      'username': username.text,
      'password': password.text,
      'email': email.text,
    });
    var data = jsonDecode(response.body);
    if (data == "Error") {
      Navigator.pushNamed(context, 'register');
    } else {
      Navigator.pushNamed(context, 'home');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Center(
        child: Form(
          key: formKey,
          child: Form(
            child: ListView(
              shrinkWrap: true,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'ลงทะเบียน',
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'เพื่อการใช้งานที่สมบูรณ์',
                      style: TextStyle(fontSize: 20),
                    ),
                    const Text(
                      'ขอขอบคุณที่ลงทะเบียน',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 350,
                      child: TextFormField(
                        obscureText: false,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'ชื่อของคุณ',
                        ),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Empty';
                          }
                          return null;
                        },
                        controller: username,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 350,
                      child: TextFormField(
                        obscureText: false,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'อีเมล์',
                        ),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Empty';
                          }
                          return null;
                        },
                        controller: email,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 350,
                      child: TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'รหัสผ่าน',
                        ),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Empty';
                          }
                          return null;
                        },
                        controller: password,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 350,
                      child: TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'ใส่รหัสผ่านอีกครั้ง',
                        ),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Empty';
                          } else if (val != password.text) {
                            return 'รหัสผ่านไม่ตรงกัน';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 350,
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF3F60A0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        onPressed: () {
                          bool password = formKey.currentState!.validate();

                          if (password) {
                            sign_up();
                          }
                        },
                        child: const Text(
                          'ลงทะเบียน',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
