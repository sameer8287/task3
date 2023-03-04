// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:task3/screen2.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  List<Userdata> listt = [];
  String defalutValue = 'friend';
  final items = [
    'Facebook',
    'Google',
    'friend',
    'Organic',
    'Instagram'
  ];
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  String ? value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 1'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              TextFormField(
                controller: name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Enter your name ',
                  label: Text('Name')
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Enter your Email ',
                    label: Text('Email')
                ),
              ),
              SizedBox(
                height:30 ,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black,width: 2)
                ),
                child: DropdownButton<String>(
                    value: value,
                    isExpanded: true,
                    hint: Text('Selcted where you from'),
                    items: items.map(buildMenuItem).toList(),
                    onChanged: (value) {
                      setState(() {
                        this.value = value;
                      });
                    }

                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(onPressed: (){
                // postList.insert(0, PostsModels(title: data[0].toString(), body: data[1].toString()));
                setState(() {
                  // listt.insert(0, Userdata(name: name.toString(), Email: email.toString(), source: value.toString()));
                  listt.add(Userdata(name: name.text.toString(), Email: email.text.toString(), source: value.toString()));
                  name.clear();
                  email.clear();
                });

                Navigator.push(context, MaterialPageRoute(builder: (context) => Screen2(lst:listt ,)));
                // print(lst);
              },
                  child: Text('Login '))
            ],
          ),
        ),
      ),
    );
  }
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
      ));
}

class Userdata{
  final String name;
  final String Email;
  final String source;

  Userdata({
    required this.name,
    required this.Email,
    required this.source
  });
}

