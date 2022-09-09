import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vybaze_music/controller/auth_state_controller.dart';
import 'package:vybaze_music/routes/app_route_names.dart';


class ResetPasswordVerification extends StatelessWidget {
  ResetPasswordVerification({Key? key}) : super(key: key);

  final AuthStateController _authStateController = Get.find<AuthStateController>();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        color: HexColor("121212"),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50,),
              InkWell(
                onTap: (){
                  Get.back();
                }, 
                child: const Icon(
                  FontAwesomeIcons.arrowLeft,
                  color: Colors.pink,
                ),
              ),
              const SizedBox(height: 50,),
              Image.asset(
                "lib/img/vybazelogo.png",
                color: Colors.pink,
              ),
              const SizedBox(height: 40,),
              const Text(
                "Enter Code",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30, 
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 10,),
              const SizedBox(
                width: 300,
                child: Text(
                  "We have sent a 4 digit pin to your email",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12, 
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              GetBuilder<AuthStateController>(
                builder: (controller){
                  return Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 10,),
                        TextFormField(
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.pink,
                              ),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.pink,
                              ),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.pink,
                              ),
                              borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                          obscureText: controller.hidePassword,
                          onChanged: (value){
                            controller.updatePassword(value);
                          },
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: (){   
                              },
                              child: const Text(
                                "Send to phone",
                                style: TextStyle(
                                  color: Colors.pink,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 40,),
                        SizedBox(
                          height: 50,
                          width: 400,
                          child: ElevatedButton(
                            onPressed: (){
                              Get.toNamed(resetpassword);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.pink,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              )
                            ),
                            child: const Text(
                              "Submit",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}