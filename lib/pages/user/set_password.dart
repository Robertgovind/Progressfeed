import 'package:flutter/material.dart';
import 'package:progressfeed/services/database.dart';
import 'package:random_string/random_string.dart';

class SetPassword extends StatefulWidget {
  String? name, email, phone, address;
  SetPassword({
    super.key,
    this.name,
    this.email,
    this.phone,
    this.address,
  });

  @override
  State<SetPassword> createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {
  bool isChecked = false;

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Set Password"),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          height: double.infinity,
          width: double.infinity,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Password",
                      style: TextStyle(fontSize: 24),
                    ),
                    TextFormField(
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Invalid input";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 8),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(width: 2)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Confirm Password",
                      style: TextStyle(fontSize: 24),
                    ),
                    TextFormField(
                      controller: confirmpasswordController,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            passwordController.text !=
                                confirmpasswordController.text) {
                          return "invalid input";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 8),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(width: 2)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isChecked = !isChecked;
                        });
                      },
                      child: isChecked
                          ? const Icon(
                              Icons.check_box,
                              color: Colors.blue,
                            )
                          : const Icon(Icons.check_box_outline_blank),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "I agree term and conditions",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: MaterialButton(
                    onPressed: () async {
                      String id = randomAlphaNumeric(10);
                      if (_formKey.currentState!.validate() && isChecked) {
                        await FirebaseServices().addUser(
                          {
                            "name": widget.name,
                            "email": widget.email,
                            "phone": widget.phone,
                            "id": id,
                            "address": widget.address,
                            "password": passwordController.text,
                          },
                        );
                        Navigator.popAndPushNamed(context, "/user/loginPage");
                      }
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
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
}
