import 'package:adoption_app/utils/Consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Consts.secondaryYellow,
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 50),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25)
              ),
              child: Column(
                children: [
                  const Text('Seja Bem Vindo!',
                    style: TextStyle(
                      fontSize: 24
                    ),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            hintText: 'Nome'
                          ),
                        ),
                        const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                        TextFormField(
                          controller: _mailController,
                          decoration: const InputDecoration(
                            hintText: 'E-mail'
                          ),
                        ),
                        const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                        TextFormField(
                          controller: _phoneController,
                          decoration: const InputDecoration(
                            hintText: 'Telefone'
                          ),
                        ),
                        const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                        TextFormField(
                          controller: _passController,
                          decoration: const InputDecoration(
                            hintText: 'Senha'
                          ),
                        ),
                        const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                        TextFormField(
                          controller: _confirmPassController,
                          decoration: const InputDecoration(
                            hintText: 'Confirme a senha'
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 10, bottom: 15)),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          child: ElevatedButton(
                            onPressed: () {
                              // TODO > Implement Register
                              _formKey.currentState!.validate();
                            },
                            style: ElevatedButton.styleFrom(),
                            child: const Text('Cadastrar')
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          child: SignInButton(
                            Buttons.GoogleDark,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)
                            ),
                            text: 'Cadastrar com Google',
                            onPressed: () {
                              // TODO > Implement Google Register
                            },
                          )
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}