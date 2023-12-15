import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const name = 'login';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: const MyCustomForm()
    );
  }
}

class MyCustomForm extends StatelessWidget {
  const MyCustomForm({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
              hintText: 'username',
              labelText: 'Username',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
              labelText: 'Password',
              hintText: 'Enter your password',
            ),
          ),
        ),
                Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Row(children: [
            Expanded(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(colors.secondaryContainer),
                ),
                onPressed: () {},
                child: Text('Login',  style: TextStyle(color: colors.onBackground)),
              ),
            ),
            const SizedBox(width: 10,),


          ],)
        ),
      ],
    );
  }
}