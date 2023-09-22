import 'package:flutter/material.dart';
import 'login_notifier.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => LoginNotifier(context),
        child: Consumer<LoginNotifier>(
            builder: (context, value, child) => Scaffold(
                  body: Center(
                    child: Container(
                      height: 500,
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(color: Colors.grey, blurRadius: 10)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Form(
                        key: _formKey,
                        child: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.shopping_basket,
                                  color: Colors.blue,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "SportsShop",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 30,
                                    fontFamily: 'Exo2',
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 16),
                              child: TextFormField(
                                controller: emailController,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Email"),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Masukan email!';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 16),
                              child: TextFormField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Password"),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Masukan password!';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            TextButton(
                                style: ButtonStyle(
                                    alignment: Alignment.centerLeft),
                                onPressed: () {},
                                child: const Text("Lupa Password?")),
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Container(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text('Please fill input')),
                                      );
                                    }
                                  },
                                  child: const Text('Masuk'),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Container(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.white)),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'Batal',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )));
  }
}
