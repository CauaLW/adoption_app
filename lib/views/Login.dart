import 'package:adoption_app/utils/Consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Consts.secondaryYellow,
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  const Text('Bem Vindo de Volta!',
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
                          controller: _mailController,
                          validator: (String? text) {
                            if(text!.isEmpty) {
                              return 'O e-mail é obrigatório.';
                            }
                            if(!text.contains('@') || !text.contains('.')) {
                              return 'Preencha um e-mail válido.';
                            }
                          },
                          decoration: const InputDecoration(
                            hintText: 'E-mail',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 15),
                          child: TextFormField(
                            controller: _passController,
                            validator: (String? text) {
                              if(text!.isEmpty) {
                                return 'A senha é obrigatória';
                              }
                              if(text.length < 6) {
                                return 'A senha deve conter ao menos 6 carácteres.';
                              }
                            },
                            decoration: const InputDecoration(
                              hintText: 'Senha',
                            ),
                          )
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          child: ElevatedButton(
                            onPressed: () {
                              // TODO > Implement Login
                              _formKey.currentState!.validate();
                            },
                            style: ElevatedButton.styleFrom(),
                            child: const Text('Entrar')
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          child: SignInButton(
                            Buttons.GoogleDark,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)
                            ),
                            text: 'Entrar com Google',
                            onPressed: () {
                              // TODO > Implement Google Login
                            },
                          )
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }

  CustomTextField(String hint, TextEditingController controller, String? Function(String? text)? validator) {
    return TextFormField(
      controller: controller,
      validator: validator,
      cursorColor: Consts.primaryPurple,
      decoration: InputDecoration(
        hintText: hint,
      ),
    );
  }
}