import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demoproject/auth_service.dart';
import 'package:demoproject/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginForm(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection("users");
  void signIn() async {
    final AuthService authService = AuthService();
    String info =
        await authService.signIn(emailController.text, passwordController.text);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(info)));
  }

  signUp() async {
    final AuthService authService = AuthService();
    String info =
        await authService.signUp(emailController.text, passwordController.text);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(info)));
    users.add({
      "name": nameController.text,
      "age": ageController.text,
      "email": emailController.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your emaill',
              ),
            ),
            //SizedBox(height: 30.0),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                hintText: 'Enter your Name',
              ),
            ),
            TextField(
              controller: ageController,
              decoration: InputDecoration(
                labelText: 'Age',
                hintText: 'Enter your Age',
              ),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: signIn,
                  child: Text('Sign In'),
                ),
                ElevatedButton(
                  onPressed: signUp,
                  child: Text('Sign Up'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
