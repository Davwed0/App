import 'package:flutter/material.dart';
import 'package:todo/widgets/input_text_field.dart';
import 'package:http/http.dart' as http;

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController UserNameTextController = TextEditingController();
  TextEditingController PasswordTextController = TextEditingController();
  TextEditingController PasswordTextController2 = TextEditingController();

  void onSignUp(String username, String password) async {
    var response = await http
        .post(Uri.http("10.0.2.2:5000", "/credentials/$username/$password"));
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        minimum: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InputTextField(
                hintText: "Enter your username",
                controller: UserNameTextController),
            InputTextField(
                hintText: "Enter your password",
                controller: PasswordTextController),
            InputTextField(
                hintText: "Enter your password again",
                controller: PasswordTextController2),
            TextButton(
              onPressed: () => {
                if (PasswordTextController2.text == PasswordTextController.text)
                  {
                    onSignUp(UserNameTextController.text,
                        PasswordTextController.text)
                  }
                else
                  {
                    PasswordTextController.text = "",
                    PasswordTextController2.text = ""
                  }
              },
              child: Text(
                "Sign up",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            )
          ],
        ),
      ),
    );
  }
}
