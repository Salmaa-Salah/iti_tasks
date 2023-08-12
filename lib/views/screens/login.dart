import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theproject/views/screens/Home.dart';

class loginscreen extends StatefulWidget {
  const loginscreen({super.key});

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Image(
                    height: 100,
                    width: 150,
                    image: AssetImage('assets/Dart_logo.png'),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 50,
                    width: 600,
                    child: TextFormField(
                      controller: emailcontroller,
                      decoration: const InputDecoration(
                        labelText: 'email',
                      ),
                      validator: (value) {
                        if (value == null || value.contains('@') == false) {
                          return 'Please enter valid email';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  /*Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'password',
                      ),
                      validator: (value) {
                        if (value == null || value.length < 8) {
                          return 'Please enter valid password';
                        }
                        return null;
                      },
                    ),
                  ),*/
                  Container(
                    height: 50,
                    width: 600,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'password',
                      ),
                      validator: (value) {
                        if (value == null || value.length < 6) {
                          return 'Please enter valid password';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.setString('email', emailcontroller.text);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => homeScreen(
                                      email: emailcontroller.text,
                                    )),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('success')),
                          );
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                          width: 400,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(
                            child: Text(
                              'login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot password? No yawa. Tap me',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 50,
                    width: 400,
                    color: Colors.white,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey),
                      child: const Text(
                        'No Account? Sign Up',
                        style: TextStyle(
                          color: Color.fromARGB(255, 17, 14, 14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
