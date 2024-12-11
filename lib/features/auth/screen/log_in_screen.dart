import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fooddeliveryappyoutube/features/auth/controller/auth_controller.dart';
import 'package:fooddeliveryappyoutube/features/auth/screen/sign_up_screen.dart';
import 'package:fooddeliveryappyoutube/utils/color.dart';
import 'package:fooddeliveryappyoutube/utils/widgets/custom_text_field.dart';

class LogInScreen extends ConsumerStatefulWidget {
  const LogInScreen({super.key});

  @override
  ConsumerState<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends ConsumerState<LogInScreen> {
  final GlobalKey _formKey=GlobalKey<FormState>();
  TextEditingController _email=TextEditingController();
  TextEditingController _password=TextEditingController();

  signInWithEmailAndPassword(BuildContext context,
  String email,String password){
    ref.read(authControllerProvider.notifier)
    .signInWithEmailAndPassword(email, password, context);
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.primaryColor,
      ),
      body: SafeArea(child: 
      SingleChildScrollView(
        child: Form(key: _formKey,child: 
        Column(
        children: [
            const SizedBox(height: 32,),
            Center(child: Image.asset(
              "assets/logo/cooking.png",
              height: 143,
              width: 143,
            ),),
            const Text("Welcome Back",
            style: TextStyle(
              fontSize: 15,fontWeight: FontWeight.w700
            ),),
           const Padding(
              padding:  EdgeInsets.all(8.0),
              child: Text("Get the best local ,on the confort of your home",
              style: TextStyle(fontSize: 15),),
            ),
            const SizedBox(height: 12,),
          CustomTextField(controller: _email,
          hintText: "Enter your email",),
          const SizedBox(height: 32,),
          CustomTextField(controller: _password,
          hintText: "Enter your password",),
          const Center(child: Text("Forgot Password",
          style: TextStyle(color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.bold),),),
          const SizedBox(height: 15,),
          SizedBox(
            width: 343,
            height: 63,
            child: ElevatedButton(onPressed: (){
              signInWithEmailAndPassword(context, _email.text, _password.text);

            },style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              )
            ), child: const Text("LogIn",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500
            ),)),
          ),
          const SizedBox(height: 10,),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUpScreen()));
            },
            child: RichText(text: TextSpan(
              text: "No Account ?",
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[600],
                fontWeight: FontWeight.w400
              ),
              children:const [
                TextSpan(
              text: "Register ",
              style: TextStyle(
                fontSize: 15,
                color: Colors.orange,
                fontWeight: FontWeight.w400
              )),
              ] 
            
            )),
          )
        ],
        )),
      )),
    );
  }
}