import 'package:flutter/material.dart';
import 'package:sistema_login_cadastro/auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool entrar = true;

  final _formkey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();

  final AuthServise _authServ = AuthServise();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (entrar) ? Colors.black : Colors.blue,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: (entrar) ? Colors.blue : Colors.green,
        title: Text(
          (entrar) ? "TELA DE LOGIN" : "TELA DE CADASTRO",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Icon(
                  (entrar)
                      ? Icons.account_circle_rounded
                      : Icons.account_circle_outlined,
                  color: Colors.white,
                  size: 110,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  validator: (String? value) {
                    if (value == null) {
                      return "O campo e-mail precisa ser preenchido";
                    }
                    if (value.length < 5) {
                      return "O campo e-mail precisa ter no mínimo 5 caractres";
                    }
                    if (!value.contains("@")) {
                      return "O campo e-mail precisa ter arroba ( @ )";
                    }
                    if (!value.contains(".")) {
                      return "O campo e-mail precisa ter ponto ( . )";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "E-mail",
                    fillColor: Colors.white,
                    filled: true,
                    hintStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w200,
                      fontSize: 16,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w200,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: _senhaController,
                  validator: (String? value) {
                    if (value == null) {
                      return "O campo Senha precisa ser preenchido";
                    }
                    if (value.length < 8) {
                      return "O campo e-mail precisa ter no mínimo 8 caractres";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Senha",
                    fillColor: Colors.white,
                    filled: true,
                    hintStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w200,
                      fontSize: 16,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w200,
                    fontSize: 16,
                  ),
                  obscureText: true,
                ),
                Visibility(
                  visible: !entrar,
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      /* TextFormField(
                              validator: (String? value) {
                    if(value == null) {
                      return "O campo e-mail precisa ser preenchido";
                    }
                      if(value.length < 8) {
                      return "O campo confirme Senha precisa ter no mínimo 8 caractres";
                      }                 
                    return null;
                  },
                        decoration: InputDecoration(
                          hintText: "Confirme a Senha",
                          fillColor: Colors.white,
                          filled: true,
                          hintStyle: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w200,
                            fontSize: 16,
                          ) ,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w200,
                          fontSize: 16,
                        ),
                        obscureText: true,
                       ),*/
                      const SizedBox(height: 5),
                      TextFormField(
                        controller: _nomeController,
                        validator: (String? value) {
                          if (value == null) {
                            return "O campo Nome precisa ser preenchido";
                          }
                          if (value.length < 3) {
                            return "O campo Nome precisa ter no mínimo 3 caractres";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Nome",
                          fillColor: Colors.white,
                          filled: true,
                          hintStyle: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w200,
                            fontSize: 16,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w200,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        botaoEntrar();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: (entrar) ? Colors.blue : Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: Text(
                        (entrar) ? "Entrar" : "Cadastrar",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      entrar = !entrar;
                    });
                  },
                  child: Text(
                    (entrar) ? "Cadastre-se" : "Entre",
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  botaoEntrar() {
    String email = _emailController.text;
    String senha = _senhaController.text;
    String nome = _nomeController.text;

    if (_formkey.currentState!.validate()) {
      if (entrar) {
        print("Entreda validada!");
      } else {
        print("Cadastro validado!");
        print("${_emailController.text}");
        print("${_senhaController.text}");
        print("${_nomeController.text}");
        _authServ.cadUser(email: email, senha: senha, nome: nome);
      }
    } else {
      print("formulario NAO funcionando");
    }
  }
}
