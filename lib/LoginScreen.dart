
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:RedMusic_app/colors.dart';
import 'constants.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    print(height);
    print(width);
    return Scaffold(
      resizeToAvoidBottomInset:true,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image.asset(Bgimage,
                    height: height*0.40,
                    width: width,
                    fit: BoxFit.fill,),
                  Container(
                    height: height*0.40,
                    width: width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(stops: [0.6,1.0],
                          begin:Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent,Colors.white])
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.center,
                child:Text(appName,style:TextStyle(fontSize: 23,fontWeight:FontWeight.w900,color: Colors.red[500]),) ,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(slogan,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color:Colors.blueAccent),),
              ),
              Padding(
                padding: const EdgeInsets.all(10.5),
                child: Container(
                  child: Text("  $loginstring",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [primaryColor.withOpacity(0.5),Colors.transparent],
                    ),
                    border: Border(left: BorderSide(color: primaryColor,width: 5)
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.5),
                child: TextFormField(
                  validator: (value){
                    if(value!.isEmpty)
                      return "Please  Enter Email";
                    else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value))
                       return "Its not a valid Email";
                      return null;
                  },
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                    prefixIcon: Icon(Icons.email,
                        color:Colors.red),
                    labelText: "Email Address",labelStyle: TextStyle(color: Colors.red,fontSize: 18),
                  ),
                ) ,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.5,vertical: 10),
                child: TextFormField(
                  validator: (Password){
                    if(Password!.isEmpty)
                      return "Please Enter Password";
                    else if (Password.length<8|| Password.length>15)
                      return "Its not valid password";
                      return null;
                  },
                  obscureText:true,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                    prefixIcon: Icon(Icons.lock_outline,
                        color:Colors.red),
                    labelText: "Password",labelStyle: TextStyle(color: Colors.red,fontSize: 18),
                  ),
                ) ,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: FlatButton(onPressed:(){}, child:Text("Forgot Password?"))),
               Center(child: SizedBox(
                 height: height*0.08,
                 width: width-30,
                 child: FlatButton(
                   color: Colors.lightBlueAccent,
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                     onPressed: () {
                     if(formKey.currentState!.validate()){
                       print("valid");
                     }
                     },
                     child: Text("Login to account",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),)),
               ),
               ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text("Dont' have an account?"),
                 FlatButton(onPressed: (){}, child: Text("Create an Account",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w200,color: Colors.red),)),
               ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
