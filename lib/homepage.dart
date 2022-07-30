import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController _phonenumber = TextEditingController();
  TextEditingController _message = TextEditingController();

  Widget? textWidget(var controller, String labelText, String hintText, Widget IconType){
    return TextField(
      style: TextStyle(color: Colors.white70, fontSize: 17.5),
      onChanged: (value) {},
      controller: controller,
      cursorHeight: 25,
      textAlignVertical: TextAlignVertical.center,
      cursorColor: Colors.green,
      decoration: InputDecoration(
        labelText: labelText,
        contentPadding: EdgeInsets.all(8),
        labelStyle: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.75, color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        prefixIcon: IconType,
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0.75, color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        fillColor: Color(0xffD5D399),
      ),
    );
  }

  launchWhatsapp() async{
    final link = WhatsAppUnilink(
      phoneNumber: '+91${_phonenumber.text}',
      text: '${_message.text}'
    );
    // ignore: deprecated_member_use
    await launch('$link');
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      //backgroundColor: Colors.black,
      appBar: AppBar(title: Center(child: Text('Direct WhatsApp', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 25),)),backgroundColor: Colors.transparent,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.03,
            ),
            Container(
              height: height * 0.2,
              width: width * 0.9,
              decoration: BoxDecoration(
                color: Colors.transparent
              ),
              child: Center(child: Text('Send WhatsApp Messages\n\n Without Saving Number',textAlign: TextAlign.center, style: GoogleFonts.comfortaa(textStyle: TextStyle(fontSize: 25, wordSpacing: 2, letterSpacing: 2, color: Colors.white)),)),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:30, vertical:5),
              child: Container(
                height: height*0.075,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.transparent
                ),
                child: textWidget(_phonenumber, 'Phone Number', 'Enter WhatsApp Number', Icon(FontAwesome5.whatsapp,size: 25,color:Colors.green,)), 
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:30, vertical:15),
              child: Container(
                height: height*0.08,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.transparent
                ),
                child: textWidget(_message, 'Message', 'Type your message here', Icon(CupertinoIcons.mail,size: 25,color:Colors.green,)),
              ),
            ),
            SizedBox(
              height: height*0.05,
            ),
            ElevatedButton(onPressed: (){
              if(_phonenumber.text.isNotEmpty){
              launchWhatsapp();
              }else{
                showDialog(context: context, builder: (context) =>
                  AlertDialog(
                    title: _phonenumber.text.isEmpty?Text('Enter the Phone Number'):Text('Invalid Phone Number'),
                    content: Text('This Field can\'t be empty'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('OK', style: TextStyle(color: Colors.green),))
                    ],
                  ),
                );
              }
            },
            child: Container(
              height: height * 0.06,
              width: width * 0.5,
              child: Center(child: Text('Send',style: GoogleFonts.merriweatherSans(fontSize: 20,color: Colors.green),))))
          ],
        ),
      ),
    );
    
  }
}