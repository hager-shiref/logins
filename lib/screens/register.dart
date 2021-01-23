import'../widgets/textForm.dart';
import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'login.dart';
import 'file:///E:/flutter/logins/lib/data/userData.dart';
class RegisterScreen extends StatefulWidget {

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}
class _RegisterScreenState extends State<RegisterScreen>  {
  List<int>countryCode=[02,91,90];
  int selectedCode=91;
  static TextEditingController _emailController=TextEditingController();
  static TextEditingController _passController=TextEditingController();
  TextEditingController _confirmController=TextEditingController();
  TextEditingController _nameController=TextEditingController();
  TextEditingController _mobileController=TextEditingController();
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
   void setData() {
    String name=_nameController.text.toString();
    String email=_emailController.text.toString();
     String phoneNumber=_mobileController.text.toString();
    String password=_passController.text.toString();
    UserData.setEmail('email', email);
    UserData.setName('name', name);
    UserData.setPhone('phone', phoneNumber);
    UserData.setPass('pass', password);
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10,top:10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:[ IconButton(icon: Icon(Icons.arrow_back_ios),
                    onPressed: (){Navigator.pop(context);},),]
              ),
            ),
            Form(
                key: _globalKey,
                child:Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical:25),
                    child: Text('Register to Cat Reloaded',style: TextStyle(
                        fontSize: 19,fontWeight: FontWeight.bold
                    ),),
                  ),
                  textFormField(controller: _nameController,keyboard:TextInputType.name,label: 'Full Name',secure: false,
                    validate: (value){
                      if(value.isEmpty){
                        return "Please enter your name ! ";
                      }
                    },),
                  textFormField(controller: _emailController,keyboard: TextInputType.emailAddress,label: 'Email',secure: false,
                    validate: (value){
                      if(value.isEmpty){
                        return "Please enter your Email ! ";
                      }
                    },),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: ScreenUtil().setWidth(300),
                      child: TextFormField(
                        controller: _mobileController,
                        keyboardType: TextInputType.phone,
                        obscureText: false,
                        decoration: InputDecoration(
                            prefix:DropdownButton(
                              items: countryCode.map((selected){
                                return DropdownMenuItem(
                                    value:selected,
                                    child:Text('$selected')
                                );
                              }).toList(),
                              onChanged: (value){
                                setState(() {
                                  selectedCode=value;
                                });
                              },
                              value: selectedCode,
                            ),
                            labelText: "Mobile Phone",
                            labelStyle: TextStyle(
                                fontSize: 15
                            )
                        ),
                        validator: (value){
                          if(value.isEmpty){
                            return "Please enter Mobile Phone ! ";
                          }
                        },
                      ),
                    ),
                  ),
                  textFormField(controller:_passController,keyboard:TextInputType.name,label: 'Password',secure: true,
                    validate:( String value){
                      if(value.isEmpty){
                        return "Please enter Password ! ";
                      }
                    },   ),

                  textFormField(
                    controller: _confirmController,keyboard: TextInputType.name,label: 'Confirm Password',secure: true,
                    validate:  (String value){
                      if(_passController.text != _confirmController.text){
                        return "password isn't identical ! ";
                      }
                    },
                  )
                ],)
            )
            ,
            InkWell(
              onTap: (){
                if(_globalKey.currentState.validate()){
                  setData();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                    return LoginScreen();
                  }));
                }
                else{
                  _globalKey.currentState.save();
                }
              },
              child: Container(
                  margin: EdgeInsets.fromLTRB(20, 60, 20, 20),
                  decoration: BoxDecoration(
                      color:Colors.red[800],
                      borderRadius: BorderRadius.circular(5)
                  ),
                  height: 50.h,
                  width: 320.w,
                  child:Center(child: Text('Register',style: TextStyle(color:Colors.white),))
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35,vertical:5),
                child:Text('By registering you agree to Terms & Conditions ' )
            ),
            Center(child:Text('and Privacy Policy of the Festival'))
          ],
        )
    );
  }
}