// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:sweethome/screen/halamanuser/halamanakun.dart';
// import 'package:sweethome/screen/pembuka/navbar.dart';





// class EditAkun extends StatefulWidget {
//    DocumentSnapshot docid;
// EditAkun({super.key, required this.docid});

//   @override
//   State<EditAkun> createState() => _EditAkunState();
// }

// class _EditAkunState extends State<EditAkun> {
//   TextEditingController usernameController= TextEditingController();
// TextEditingController emailController = TextEditingController();


// @override
//   void initState() {
//     namaController = TextEditingController(text: widget.docid.get('username'));
//     emailController = TextEditingController(text: widget.docid.get('email'));
//     super.initState();

    
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Profil'),
//         elevation: 0,
//         backgroundColor: Color(0xff141228),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: 15,
//           ),
//           Center(
//             child: CircleAvatar(
//                 radius: 68, backgroundImage: AssetImage('image/index.png')),
//           ),
//           SizedBox(
//             height: 8,
//           ),
//           InkWell(
//             child: Text(
//               'Ganti Foto',
//               style: TextStyle(fontSize: 18),
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Padding(
//             padding: EdgeInsets.only(left: 30, right: 30),
//             child: TextField(
//               controller: namaController,
//               decoration: InputDecoration(
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Color(0xff141228)),
//                   ),
//                   labelStyle: TextStyle(color: Color(0xff5A5A5A)),
//                   labelText: 'Nama ',
//                   hintStyle: TextStyle(color: Colors.grey),
//                   prefixIcon: Icon(
//                     Icons.account_box_outlined,
//                     color: Color(0xff5A5A5A),
//                   )),
//             ),
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           Padding(
//             padding: EdgeInsets.only(right: 30, left: 30),
//             child: TextField(
//               controller: emailController,
//               keyboardType: TextInputType.emailAddress,
//               decoration: InputDecoration(
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Color(0xff141228)),
//                   ),
//                   labelStyle: TextStyle(color: Color(0xff5A5A5A)),
//                   labelText: 'Email ',
//                   hintStyle: TextStyle(color: Colors.grey),
//                   prefixIcon: Icon(
//                     Icons.mail_outline,
//                     color: Color(0xff5A5A5A),
//                   )),
//             ),
//           ),
//           SizedBox(
//             height: 90.0,
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.pushReplacement(
//                   context, MaterialPageRoute(builder: (context) => (NavBar())));
//             },
//             child: const Text('Simpan'),
//             style: ElevatedButton.styleFrom(
//                 primary: Color(0xff141228),
//                 fixedSize: const Size(240, 44),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(50))),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:sweethome/widgets/filebari.dart';

enum MediaType {
  image,
  video,
}

class EditProfil extends StatefulWidget {
  DocumentSnapshot docid;
  EditProfil({Key? key, required this.docid}) : super(key: key);

  @override
  State<EditProfil> createState() => _EditProfilState();
}

class _EditProfilState extends State<EditProfil> {
  //untuk upload 2 image
  // List<File>? image = [];
  // Future getImage() async {
  //   final ImagePicker _picker = ImagePicker();
  //   final List<XFile>? imagePicked = await _picker.pickMultiImage();

  //   image = imagePicked!.map((e) => File(e.path)).toList();
  //   setState(() {});
  // }

  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  final MediaType _mediaType = MediaType.image;
  XFile? file;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  String? imagePath;

  @override
  void initState() {
    username = TextEditingController(text: widget.docid.get('username'));
    email = TextEditingController(text: widget.docid.get('email'));
    // imagePath = widget.docid.get('fieldGambar');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff141228),
        elevation: 0,
        title: const Text(
          'Edit Profil',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          //untuk upload 2 image
          // Row(
          //   children: [
          //     for (File img in image!)
          //       Container(
          //         height: 200,
          //         width: 200,
          //         child: Image.file(img, fit: BoxFit.cover),
          //       ),
          //     TextButton(
          //         onPressed: () async {
          //           await getImage();
          //         },
          //         child: Icon(
          //           Icons.add,
          //           size: 40,
          //         )),
          //   ],
          // ),
          Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Stack(
                children: [
                  // SizedBox(
                  //   width: 110,
                  //   height: 110,
                  //   child: 
                    // (imagePath != null)
                    //     ? CircleAvatar(
                    //         backgroundImage: FileImage(File(imagePath!)))
                    //     : widget.docid.get('fotoProfil') == ""
                    //         ? Container(
                    //             decoration: BoxDecoration(
                    //               shape: BoxShape.circle,
                    //               color: Colors.grey[300]!,
                    //             ),
                    //             width: 300,
                    //             height: 300,
                    //             child: const Icon(
                    //               Icons.person,
                    //               color: Colors.white,
                    //               size: 100,
                    //             ),
                    //           )
                    //         : Container(
                    //             decoration: BoxDecoration(
                    //               image: DecorationImage(
                    //                   fit: BoxFit.cover,
                    //                   image: NetworkImage(
                    //                       widget.docid.get('fotoProfil'))),
                    //               shape: BoxShape.circle,
                    //               color: Colors.grey[300]!,
                    //             ),
                    //             width: 300,
                    //             height: 300,
                    //           ),
                  // ),
                  Positioned(
                    top: 65,
                    left: 40,
                    child: RawMaterialButton(
                      onPressed: () {
                        // showDialog(
                        //   context: context,
                        //   builder: (BuildContext context) {
                        //     return AlertDialog(
                        //       title: const Text('Ambil foto dari :'),
                        //       content: Column(
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //         children: [
                        //           const SizedBox(height: 10),
                        //           InkWell(
                        //             onTap: () {
                        //               pickImage( source:
                        //                                   ImageSource.gallery);
                        //               Navigator.pop(context);
                        //             },
                        //             child: Row(
                        //               mainAxisSize: MainAxisSize.min,
                        //               children: const [
                        //                 Icon(
                        //                   Icons.image,
                        //                   size: 30,
                        //                   color: Color(0xff142D4C),
                        //                 ),
                        //                 SizedBox(width: 5),
                        //                 Text(
                        //                   "Galeri",
                        //                   style: TextStyle(
                        //                     fontSize: 15,
                        //                     color: Colors.black,
                        //                   ),
                        //                 )
                        //               ],
                        //             ),
                        //           ),
                        //           const SizedBox(height: 10),
                        //           InkWell(
                        //             onTap: () {
                        //               pickImage(source:
                        //                                   ImageSource.gallery);
                        //               Navigator.pop(context);
                        //             },
                        //             child: Row(
                        //               mainAxisSize: MainAxisSize.min,
                        //               children: const [
                        //                 Icon(
                        //                   Icons.camera_alt,
                        //                   size: 30,
                        //                   color: Color(0xff142D4C),
                        //                 ),
                        //                 SizedBox(width: 5),
                        //                 Text(
                        //                   "Buka kamera",
                        //                   style: TextStyle(
                        //                     fontSize: 15,
                        //                     color: Colors.black,
                        //                   ),
                        //                 )
                        //               ],
                        //             ),
                        //           ),
                        //           const SizedBox(height: 10),
                        //           InkWell(
                        //             onTap: () {
                        //               setState(
                        //                 () {
                        //                   imagePath = null;
                        //                 },
                        //               );
                        //             },
                        //             child: Row(
                        //               mainAxisSize: MainAxisSize.min,
                        //               children: const [
                        //                 Icon(
                        //                   Icons.remove_circle,
                        //                   size: 30,
                        //                   color: Colors.red,
                        //                 ),
                        //                 SizedBox(width: 5),
                        //                 Text(
                        //                   "Hapus foto profil",
                        //                   style: TextStyle(
                        //                     fontSize: 15,
                        //                     color: Colors.black,
                        //                   ),
                        //                 )
                        //               ],
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     );
                        //   },
                        // );
                        showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Choose Photo'),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: [
                                          InkWell(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.image,
                                                  size: 40,
                                                ),
                                                Text('Galery')
                                              ],
                                            ),
                                            onTap: () async {
                                              pickImage(source:
                                                          ImageSource.gallery);
                                      // Navigator.pop(context);
                                              setState(() {});
                                              Navigator.pop(context);
                                            },
                                          ),
                                          InkWell(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.camera,
                                                  size: 40,
                                                ),
                                                Text('Camera')
                                              ],
                                            ),
                                            onTap: () async {
                                              pickImage(source:
                                                          ImageSource.gallery);
                                      // Navigator.pop(context);
                                              setState(() {});
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                      },
                      child: Container(
                        // ignore: prefer_const_constructors
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xff142D4C),
                        ),
                        width: 35,
                        height: 35,
                        child: const Icon(
                          Icons.add,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),

              //nama dan deskripsi
              Container(
                margin: const EdgeInsets.all(25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text('Username :'),
                      ],
                    ),
                    TextFormField(
                      cursorColor: const Color(0xff142D4C),
                      controller: username,
                      maxLength: 25,
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff142D4C)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text('Email :'),
                      ],
                    ),
                    TextField(
                      cursorColor: const Color(0xff142D4C),
                      controller: email,
                      maxLines: 1,
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff142D4C)),
                        ),
                      ),
                      // maxLength: 15,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                        minimumSize: const Size(350, 38),
                        textStyle: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                        primary: const Color(0xff141228),
                        onPrimary: Colors.white,
                      ),
                      onPressed: () async {
                        widget.docid.reference.update({
                          'username': username.text,
                          'email': email.text,
                          'fotoProfil': imagePath
                        });
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: const Text("Profil telah diperbarui!"),
                          backgroundColor: Color(0xff141228),
                        ));
                        uploadImage();
                        setState(() {});
                        // .whenComplete(() {

                        Navigator.pop(
                          context,
                        );
                        // });
                      },
                      child: const Text(
                        'Simpan',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }

  // void pickMedia(ImageSource source) async {
  //   if (_mediaType == MediaType.image) {
  //     file = await ImagePicker().pickImage(source: source);
  //   } else {
  //     file = await ImagePicker().pickVideo(source: source);
  //   }
  //   if (file != null) {
  //     imagePath = file!.path;
  //     if (_mediaType == MediaType.video) {
  //       imagePath = await VideoThumbnail.thumbnailFile(
  //           video: file!.path,
  //           imageFormat: ImageFormat.PNG,
  //           quality: 100,
  //           maxWidth: 300,
  //           maxHeight: 300);
  //     }
  //     setState(() {});
  //   }
  // }
  final ImagePicker _picker = ImagePicker();
  Future<XFile?> pickImage({required ImageSource source}) async {
    try {
      final XFile? image = await _picker.pickImage(source: source);
      if (image == null) return null;
      final imageTemp = XFile(image.path);
      return imageTemp;
      // setState(() {
      //   this.image = imageTemp;
      // });
    } on PlatformException catch (e) {
      print("Failed to pick image $e");
    }
  }

  Future<void> uploadImage() async {
    if (file == null) {
      return;
    }
    String imageName = file!.name;
    File imageFile = File(file!.path);
    try {
      final firebaseStorageRef = await firebaseStorage
          .ref("admin")
          .child(imageName)
          .putFile(imageFile);
      final fileUrl = await firebaseStorageRef.ref.getDownloadURL();
      print(fileUrl);
      await FirebaseFirestore.instance
          .collection('profilAdmin')
          .doc('KGe04xpEqrJkE3MuYxsG')
          .update({'fotoProfil': fileUrl});
    } on FirebaseException catch (e) {
      print(e);
    } catch (error) {
      print(error);
    }
  }
}
