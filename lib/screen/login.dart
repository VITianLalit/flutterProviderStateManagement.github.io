import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter/provider/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Login'),
      ),
      body:  Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email'
                ),
              ),
            SizedBox(height: 20,),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: 'Password'
              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){
                authProvider.login(emailController.text.toString(),
                passwordController.text.toString());
              },

              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child:authProvider.loading? CircularProgressIndicator(): Text('Login')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
