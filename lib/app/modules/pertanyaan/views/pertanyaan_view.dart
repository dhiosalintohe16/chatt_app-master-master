import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tierra_app/app/controllers/auth_controller.dart';
import 'package:tierra_app/app/utils/theme.dart';

import '../controllers/pertanyaan_controller.dart';

class PertanyaanView extends GetView<PertanyaanController> {
  

  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Pertanyaan',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          // child: SingleChildScrollView(
            // child: Expanded(
               
              child: Expanded(
                
                
                  child: SingleChildScrollView( child :
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     
                        
                      // Text(
                      //   "Pertanyaan Anda",
                      //   textAlign: TextAlign.start,
                      //   style: TextStyle(fontSize: 15),
                      // ),

                      // Container(
                      //     // color: Colors.amber,
                      //     padding: EdgeInsets.only(
                      //         left: Get.width * 0.04,
                      //         right: Get.width * 0.04,
                      //         bottom: Get.height * 0.03),
                      //     width: double.infinity,
                      //     height: Get.height * 0.2,
                      //     child: 
                          
                          TextField(
                            onChanged: (String isiChat) { 
                              controller.getPertanyaan(isiChat);
                            },
                            maxLines: null,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                // labelStyle: TextStyle(),
                                focusColor: Colors.green,
                                hintText: "Tambahkan pertanyaan anda disini",
                                fillColor: Color(0xFF008269).withOpacity(0.1),
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Color(0xFF008269), width: 1)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Color(0xFF008269), width: 1))),
                          // )
                          ),
                      
                      //Mengambil gambar
                      
                      SizedBox(height: 10),
                      
                      
                      
                      Center(
                        child: GetBuilder<PertanyaanController>(
                            builder: (controller) => controller.PickedImage != null
                                ? Galeri(controller)
                                :
                                // Container(
                                //   child: Image.network(authC.user.value.photoURL!,
                                //           fit: BoxFit.cover,),
                                // ),
                                Text("Tambahkan Gambar Ke postingan anda")),
                      ),
                      
                      SizedBox(
                        height: 10,
                      ),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                              onTap: () => controller.PickGaleri (),
                              child: Container(
                                // margin: EdgeInsets.only(left: Get.width * 0.04),
                                width: Get.width * 0.2,
                                height: Get.width * 0.2,
                                color: Colors.red[100],
                      
                                child: Column(children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.photo_album_rounded)),
                                  Text("Galeri"),
                                ]),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () => controller.PickCamera(),
                            child: Container(
                                // margin: EdgeInsets.only(left: Get.width * 0.04),
                                width: Get.width * 0.2,
                                height: Get.width * 0.2,
                                color: Colors.red[100],
                                child: Column(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.add_a_photo)),
                                    Text("Camera")
                                  ],
                                )),
                          )
                        ],
                      ),
                      
                      SizedBox(height: 10,),
                      
                      Container(
                          margin: EdgeInsets.only(
                              bottom: Get.height * 0.06, right: Get.width * 0.04),
                          alignment: Alignment.bottomRight,
                          // margin: EdgeInsets.only(left: Get.width * 0.8,top: Get.height * 0.35),
                          child: GestureDetector(
                            onTap: () {
                              controller.uploadData();
                              // controller.uploadfto();
                              // controller.upload().then((foto) {
                              //   if (foto != null) {
                              //     controller.tmbhfto(foto);
                              //   }
                              // });
                              Get.back();
                            },
                            child: CircleAvatar(
                              radius: 35,
                              backgroundColor: Color(0xFF008269),
                              child: Icon(
                                Icons.send,
                                color: whiteColor,
                              ),
                            ),
                          ))
                            ],
                          ),
                ),
              ),
            ),
          ),
      // ),
      );
            
  }

  Stack Galeri(PertanyaanController controller) {
    return Stack(children: [
      // controller.imageFile != null ? Image.file( controller.imageFile!) : Text("no image"),
      
      Container(
        height: 200,
        width: 200, 
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
          image: DecorationImage(
            image: FileImage(File(controller.PickedImage!.path)),
            // FileImage(File(controller.PickedImage!.path)),
            fit: BoxFit.cover,
          ),
        ),
      ),
      IconButton(
        onPressed: () => controller.ResetImage(),
        icon: Icon(
          Icons.delete_forever_rounded,
          color: Colors.red[400],
          size: 50,
        ),
      )
    ]);
  }
}
