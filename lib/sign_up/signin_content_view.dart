import 'package:flutter/material.dart';
import 'package:tester/sign_up/signin_submit_button.dart';
import 'package:tester/signin/signin_submit_button.dart';
import 'package:tester/signin/signin_text_field.dart';


class SignUpContentView extends StatefulWidget {
  TextEditingController controller1;
  TextEditingController controller2;

  Function() signup;
  SignUpContentView(
      {Key? key,required this.controller1,required this.controller2 , required this.signup })
      : super(key: key);
  @override
  SignUpContentViewState createState() => SignUpContentViewState();
}

class SignUpContentViewState extends State<SignUpContentView> {
  String welcomeText = '';
  String welcomeText1 = '';

  double totalHeight = 0;
  @override
  void initState() {
    welcomeText = 'Welcome';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(
            top: 50, left: 20, right: 20),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                    // margin: EdgeInsets.only(
                    //      bottom: screenWidth*0.1),
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color:
                          Colors.transparent, // Background color of the container
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/test.jpeg'), // Replace 'image.jpg' with your image asset
                        fit: BoxFit.contain, // Optional: Adjust how the image fits inside the container
                      ),
                    )),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: screenHeight * 0.10, left: 30, right: 30),
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Column(
                    children: [
                      Text("SignUp",
                          textScaleFactor: 1.1,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                          )),
                    ],
                  ),
                ),
              ),
              SignInTextField(
                controller1:widget.controller1,
                controller2:widget.controller2,
                top: totalHeight * 0.03,
              ),
              Container(
                margin: EdgeInsets.only(
                    top: 60,),
                child: SignUpSubmitButton(
                       signup:widget.signup,

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
