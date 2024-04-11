import 'package:akademi3/data/users.dart';
import 'package:akademi3/screens/home_view.dart';
import 'package:akademi3/screens/register_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  final String imgUrl =
      "/Users/speyzie/Desktop/akademi3/assets/images/birunigram.png";
  final String appTitle = "BiruniGram";
  final String mailHint = "Mail";
  final String passwordHint = "Şifre";
  final String loginButton = "Giriş Yap";
  final String registerButton = "Kaydol";
  final String registerDetail = "Hesabınız yok mu?";

  final TextEditingController mailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final Users users = Users();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 6,
                        child: Image.asset(
                          imgUrl,
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              appTitle,
                              style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            buildTextField(mailHint, mailController),
                            buildTextField(passwordHint, passwordController),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => loginFunc(context),
                        style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                          ),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blue),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                        child: Text(
                          loginButton,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          registerDetail,
                          style: const TextStyle(fontSize: 16),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => RegisterView(users: users),
                            ));
                          },
                          child: Text(
                            registerButton,
                            style: const TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildTextField(String hint, TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(10),
          hintText: hint,
        ),
        controller: controller,
      ),
    );
  }

  void loginFunc(BuildContext context) {
    users.userList.forEach((element) {
      if (mailController.text == element.mail &&
          passwordController.text == element.password) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeView(userName: element.name),
          ),
        );
      } else {
        print("Hatalı değer");
      }
    });
  }
}
