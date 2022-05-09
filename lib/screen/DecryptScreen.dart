import 'package:codehill/screen/result.dart';
import 'package:flutter/material.dart';

import '../config/config.dart';

class DecryptScreen extends StatefulWidget {
  const DecryptScreen({Key? key}) : super(key: key);

  @override
  _DecryptScreenState createState() => _DecryptScreenState();
}

class _DecryptScreenState extends State<DecryptScreen> {
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
                'Dechiffrer un Message',
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
                            /*validator: (value) => EmailValidator.validate(value!)
                                ? null
                                : "Please enter a valid email",*/
                            maxLines: 1,
                            controller: _TextAcontroller,
                            keyboardType: TextInputType.number,
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
                            controller: _TextBcontroller,
                            keyboardType: TextInputType.number,
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
                            controller: _TextCcontroller,
                            keyboardType: TextInputType.number,
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
                      maxLines: 1,
                      controller: _Textcontroller,
                      decoration: InputDecoration(
                        hintText: 'Entrer le Texte à déchiffrer',
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
                          print("formulaire !");

                          print("debut dechiffrement !");
                          if(_Textcontroller!.value.text=='' || _TextAcontroller!.value.text==''||_TextBcontroller!.value.text==''||_TextCcontroller!.value.text==''||_TextDcontroller!.value.text==''){

                            ScaffoldMessenger.of(context)
                              ..removeCurrentSnackBar()
                              ..showSnackBar(SnackBar(content: Text('Veillez remplir tout les champs !')));
                          }else{
                            String word = formatText((_Textcontroller!.value.text).toString());
                            print(word);
                            int a =int.parse((_TextAcontroller!.value.text).toString());
                            int b =int.parse((_TextBcontroller!.value.text).toString());
                            int c =int.parse((_TextCcontroller!.value.text).toString());
                            int d =int.parse((_TextDcontroller!.value.text).toString());
                            if(a<0 || b<0 || c<0 || d<0){
                              ScaffoldMessenger.of(context)
                                ..removeCurrentSnackBar()
                                ..showSnackBar(SnackBar(content: Text('Les valeurs de a, b, c ou d doivent etre positives ! ')));
                            }else{
                              List result = VerifierMatrice(a,b,c,d);
                              if(result[0]==true){
                                print("matrice valid !");
                                ScaffoldMessenger.of(context)
                                  ..removeCurrentSnackBar()
                                  ..showSnackBar(SnackBar(content: Text('Matrice valide')));
                                String messageDechiffre = DeChiffrerMessage(word,a, b,c,d,result[1]);
                                print(messageDechiffre);
                                Navigator.push(context,
                                    MaterialPageRoute(
                                        builder: (context) => ResultScreen(
                                          premiertitle:"Message Chiffrer",
                                          premierText:(_Textcontroller!.value.text).toString(),
                                          secondtitle:"Message Déchiffrer",
                                          secondText:messageDechiffre,)
                                    )

                                );
                              }else{
                                print("matrice invalide !");
                                ScaffoldMessenger.of(context)
                                  ..removeCurrentSnackBar()
                                  ..showSnackBar(SnackBar(content: Text('Matrice Invalide')));
                              }
                            }

                          }

                          print("fin dechiffrement !");

                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                      ),
                      child: const Text(
                        'Dechiffrer',
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
                            *//*Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>{},
                                //const LoginPage(title: 'Login UI'),
                              ),
                            );*//*
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
