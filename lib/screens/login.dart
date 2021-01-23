import'package:flutter/material.dart';
import 'register.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import'../widgets/textForm.dart';
import 'home.dart';
import 'file:///E:/flutter/logins/lib/data/userData.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  Widget _buildContainer({String image, String name}) {
    return Container(
        height: 40.h,
        width: 150.w,
        margin: EdgeInsets.symmetric(
            horizontal: 10.w, vertical: 20.h
        ),
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.grey
            ),
            borderRadius: BorderRadius.circular(5)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(image), width: 50.w, height: 25.h,),
            Text(name)
          ],
        )
    );
  }

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  Widget _buildForm() {
    return Form(key: _globalKey,
      child: Column(
        children: [
          textFormField(controller: _emailController,
            keyboard: TextInputType.emailAddress,
            label: 'Email ID',
            secure: false,
            validate: (value) {
              if (value.isEmpty) {
                return 'please enter your e-mail address';
              }
            },),
          textFormField(controller: _passController,
            keyboard: TextInputType.name,
            label: 'Password',
            secure: true,
            validate: (value) {
              if (value.isEmpty) {
                return 'please enter your password';
              }
            },)

        ],
      ),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
            children: [ Stack(
              children: [
                Container(
                  height: 690.h,
                  width: 360.w,
                ),
                Positioned(
                    top: 100.h,
                    left: 120.w,
                    child: Container(
                        height: 150.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            image: DecorationImage(
                                image: AssetImage('assets/cat.jpg',),
                                fit: BoxFit.cover
                            )
                        )
                    )
                ),
                Positioned(
                  left: 10.w,
                  top: 300.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildContainer(
                          image: 'assets/facebook.png', name: 'facebook'),
                      _buildContainer(
                          image: 'assets/google.png', name: 'google'),
                    ],
                  ),
                ),
                Positioned(
                  top: 380.h,
                  left: 180.w,
                  child: Text('Or', style: TextStyle(
                      color: Colors.grey
                  ),),
                ),
                Positioned(
                    left: 30.w,
                    top: 390.h,
                    child: _buildForm()
                ),
                Positioned(
                    right: 25.w, bottom: 150.h,
                    child: Text('Forgot Password?',)
                ),
                Positioned(
                  bottom: 80.h,
                  child: InkWell(
                    onTap: () {
                      if (UserData.getEmail('email') == _emailController.text.toString() &&
                          UserData.getPass('pass') == _passController.text.toString()) {
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (context) {
                          return HomeScreen();
                        }));
                      }
                      else {
                        return 'invalid email or password';
                      }
                      },
                    child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.red[800],
                            borderRadius: BorderRadius.circular(5)
                        ),
                        height: 50.h,
                        width: 320.w,
                        child: Center(child: Text('Login', style: TextStyle(
                            color: Colors.white),))
                    ),
                  ),
                ),
                Positioned(
                  bottom: 50.h,
                  left: 90.w,
                  child: Row(
                    children: [
                      Text("Don't have an account?"),
                      InkWell(
                          onTap: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (
                                context) {
                              return RegisterScreen();
                            }));
                          },
                          child: Text(' Register Now'))
                    ],
                  ),
                )
              ],
            ),
            ])
    );
  }

}