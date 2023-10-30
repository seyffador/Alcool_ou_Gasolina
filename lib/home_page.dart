import 'package:flutter/material.dart';


class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  TextEditingController _controllerAlcool=TextEditingController();
  TextEditingController _controllerGasolina=TextEditingController();
  String _textoresultado="";
  void _calcular(){
    double? precoalcool = double.tryParse(_controllerAlcool.text);
    double? precogasolina = double.tryParse(_controllerGasolina.text);
    if(
    precoalcool== null || precogasolina ==null
    ){
      setState(() {
        _textoresultado= "numero invalido digite numeros maiores que zero e utilizando ponto(.)";

      });
    }else{
      if( (precoalcool / precogasolina)>=0.7 ){
        setState(() {
          _textoresultado= "Melhor abastecer com gasolina";
        });
      }else{
        setState(() {
          _textoresultado ="Melhor abastecer com alcool";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alcol ou gasolina"),
      ),
      body: Container(
          padding: EdgeInsets.all(32),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.all(32),
                  child: Image.asset("images/logo.png"),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Text(
                    "saiba qual a melhor poçãp para abastecimento do seu carro",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,

                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "preço do alcol 1.59",
                  ),
                  style: TextStyle(
                    fontSize: 22,
                  ),
                  controller:_controllerAlcool,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "preço da gasolina 3.59"
                  ),
                  style: TextStyle(
                    fontSize: 22,
                  ),
                  controller:_controllerGasolina,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.indigo, // background
                        onPrimary: Colors.white, // foreground

                      ),
                      onPressed: _calcular,
                      child: Text(
                        'calcular',
                        style: TextStyle (
                          fontSize: 20,
                        ),
                      )
                  ),
                ),
                Padding(padding: EdgeInsets.only(top:20),
                  child: Text(_textoresultado,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}