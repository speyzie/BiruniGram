import 'package:akademi3/data/user.dart';
import 'package:flutter/material.dart';

import '../data/users.dart';

class RegisterView extends StatelessWidget {
  final String title = "Kaydol";
  final String nameHint = "Ad";
  final String surnameHint = "Soyad";
  final String mailHint = "Mail";
  final String passwordHint = "Şifre";

  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final Users users;
  RegisterView({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
            backgroundColor: Colors.blueGrey,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                buildTextField(nameHint, nameController),
                buildTextField(surnameHint, surnameController),
                buildTextField(mailHint, mailController),
                buildTextField(passwordHint, passwordController),
                ElevatedButton(
                  onPressed: () => addUser(context),
                  style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    ),
                    backgroundColor: MaterialStatePropertyAll(Colors.blueGrey),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding buildTextField(String hint, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
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
      ),
    );
  }

  void addUser(BuildContext context) {
    users.userList.add(
      User(
        name: nameController.text,
        surname: surnameController.text,
        mail: mailController.text,
        password: passwordController.text,
      ),
    );
    Navigator.pop(context);
  }
}
