import 'package:codehill/config/config.dart';
import 'package:codehill/screen/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CryptScreen extends StatefulWidget {
  const CryptScreen({Key? key}) : super(key: key);
  @override
  _CryptScreenState createState() => _CryptScreenState();
}

class _CryptScreenState extends State<CryptScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController? _Textcontroller = new TextEditingController();
  TextEditingController? _TextAcontroller = new TextEditingController();
  TextEditingController? _TextBcontroller = new TextEditingController();
  TextEditingController? _TextCcontroller = new TextEditingController();
  TextEditingController? _TextDcontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Chiffrer un Message',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            validator: (value) => value!=null
                                ? null
                                : "Entrer la valeur de a",
                            maxLines: 1,
                            controller: _TextAcontroller,
                            decoration: InputDecoration(
                              hintText: 'Valeur a',
                              prefixIcon: const Icon(Icons.numbers),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: TextFormField(
                            /*validator: (value) => EmailValidator.validate(value!)
                                ? null
                                : "Please enter a valid email",*/
                            maxLines: 1,
                            keyboardType: TextInputType.number,
                            controller: _TextBcontroller,
                            decoration: InputDecoration(
                              hintText: 'Valeur b',
                              prefixIcon: const Icon(Icons.numbers),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            /*validator: (value) => EmailValidator.validate(value!)
                                ? null
                                : "Please enter a valid email",*/
                            maxLines: 1,
                            keyboardType: TextInputType.number,
                            controller: _TextCcontroller,
                            decoration: InputDecoration(
                              hintText: 'Valeur c',
                              prefixIcon: const Icon(Icons.numbers),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: TextFormField(
                            /*validator: (value) => EmailValidator.validate(value!)
                                ? null
                                : "Please enter a valid email",*/
                            maxLines: 1,
                            keyboardType: TextInputType.number,
                            controller: _TextDcontroller,
                            decoration: InputDecoration(
                              hintText: 'Valeur d',
                              prefixIcon: const Icon(Icons.numbers),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      /*validator: (value) => EmailValidator.validate(value!)
                          ? null
                          : "Please enter a valid email",*/
                      controller: _Textcontroller,
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: 'Entrer le Texte a chiffrer',
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    /*TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      maxLines: 1,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        hintText: 'Enter your password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),*/
                    ElevatedButton(
                      onPressed: () {
                          print("formulaire ! :${_Textcontroller!.value.text}");
                          if(_Textcontroller!.value.text=='' || _TextAcontroller!.value.text==''||_TextBcontroller!.value.text==''||_TextCcontroller!.value.text==''||_TextDcontroller!.value.text==''){

                          ScaffoldMessenger.of(context)
                          ..removeCurrentSnackBar()
                          ..showSnackBar(SnackBar(content: Text('Veillez remplir tout les champs !')));
                          }else {
                            String word = formatText((_Textcontroller!.value.text)
                                .toString());
                            print(word);
                            int a = int.parse((_TextAcontroller!.value.text)
                                .toString());
                            int b = int.parse((_TextBcontroller!.value.text)
                                .toString());
                            int c = int.parse((_TextCcontroller!.value.text)
                                .toString());
                            int d = int.parse((_TextDcontroller!.value.text)
                                .toString());
                            print("debut chiffrement !");
                            List result = VerifierMatrice(a, b, c, d);
                            if (result[0] == true) {
                              print("matrice valid !");
                              String messageChiffre = ChiffrerMessage(word, a, b,
                                  c, d);
                              print("${messageChiffre}");
                              ScaffoldMessenger.of(context)
                                ..removeCurrentSnackBar()
                                ..showSnackBar(SnackBar(
                                    content: Text('Matrice Valide')));
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) => ResultScreen(
                                    premiertitle: "Message à Chiffrer",
                                    premierText: (_Textcontroller!.value.text).toString(),
                                    secondtitle: "Message Chiffrer",
                                    secondText: messageChiffre,
                                ),
                              ), /*arguments: {
                                "premiertitle": "Message à Chiffrer",
                                "premierText": (_Textcontroller!.value.text)
                                    .toString(),
                                "secondtitle": "Message Chiffrer",
                                "secondText": messageChiffre,
                              }*/);
                            } else {
                              print("matrice invalide !");
                              ScaffoldMessenger.of(context)
                                ..removeCurrentSnackBar()
                                ..showSnackBar(SnackBar(
                                    content: Text('Matrice Invalide')));
                            }
                          }

                          print("fin chiffrement !");


                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                      ),
                      child: const Text(
                        'Chiffrer',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    /*Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already registered?'),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                const ResultScreen(),
                              ),
                            );
                          },
                          child: const Text('Sign in'),
                        ),
                      ],
                    ),*/
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
