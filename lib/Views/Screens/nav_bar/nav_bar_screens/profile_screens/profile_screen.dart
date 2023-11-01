import 'package:flutter/material.dart';
import 'package:master/Views/Screens/nav_bar/nav_bar_screens/profile_screens/edit_profile_screen.dart';
import 'package:provider/provider.dart';
import '../../../../../Models/model_provider.dart';
import '../../../../Widgets/custom_cart_profile.dart';
import '../../../../Widgets/custom_case_value_profile_null.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);
  static String profileRoute = 'profileRoute';
  //ProfileModel? dataNewsModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[800],
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Positioned(
                top: 25,
                right: 35,
                child: IconButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, EditeProfileScreen.editeProfileRoute);
                  },
                  icon: Icon(
                    Icons.edit_note_outlined,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),
              const Column(
                children:  [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/Education.jpeg'),
                        radius: 80,
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Text(
                    'MOHAMED AHMED',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'News_Admin@gmail.com',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.only(
              top: 20,
              right: 20,
              left: 20,
            ),
            height: MediaQuery.of(context).size.height / 2.2,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Consumer<ModelProvider>(
              builder: (context, provider, _) {
                final userData = provider.profiles;
                final firstUserData =
                    userData.isNotEmpty ? userData.first : null;
                return ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    if (firstUserData != null) {
                      final displayUserData = userData[index];
                      return Padding(
                        padding: const EdgeInsets.only(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                const SizedBox(height: 30),
                                CustomCartProfile(
                                  icon: Icons.flag_outlined,
                                  text: displayUserData
                                      .userName, //'User Name',//dataNewsModel.userName,
                                ),
                                CustomCartProfile(
                                  icon: Icons.flag_outlined,
                                  text: displayUserData
                                      .email, //'Email',//dataNewsModel.email,
                                ),
                                CustomCartProfile(
                                  icon: Icons.phone_outlined,
                                  text: displayUserData
                                      .phoneNumber, // 'Phone Number',//dataNewsModel.phoneNumber.toString(),
                                ),
                                CustomCartProfile(
                                  icon: Icons.hdr_auto_sharp,
                                  text: displayUserData
                                      .age, //'Age', //dataNewsModel.age.toString(),
                                ),
                                CustomCartProfile(
                                  icon: Icons.flag_outlined,
                                  text: displayUserData
                                      .country, // 'Country',//dataNewsModel.country,
                                ),
                                CustomCartProfile(
                                  icon: Icons.apartment_outlined,
                                  text: displayUserData
                                      .address, //'Address'//dataNewsModel.address,
                                ),
                                ElevatedButton(
                                  onPressed: (){
                                    provider.deleteProfile(displayUserData);
                                  },
                                   child: Text('Remove Data'),
                                   ),
                              ],
                            ),
                          ],
                        ),
                      );
                    } else {
                      return const CustomCaseValueProfileNull();
                    }
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

// import 'dart:js';

// import 'package:flutter/material.dart';
// import 'package:master/Views/Screens/nav_bar/nav_bar_screens/profile_screens/edit_profile_screen.dart';
// import 'package:master/Views/Widgets/custom_cart_profile.dart';
// import 'package:provider/provider.dart';
// class ProfileScreen extends StatelessWidget {
//    ProfileScreen({Key? key,  }) : super(key: key);
//   static String profileRoute = 'profileRoute';
//   //ProfileModel? dataNewsModel;
    
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.blue[800],
//       child: SafeArea(
//         child: Scaffold(
//           backgroundColor: Colors.transparent,
//           body: Stack(
//             children: [
//               Positioned(
//                 top: 25,
//                 right: 35,
//                 child: IconButton(
//                   onPressed: () {
//                     Navigator.pushNamed(
//                         context, EditeProfileScreen.editeProfileRoute);
//                   },
//                   icon: Icon(
//                     Icons.edit_note_outlined,
//                     size: 40,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               Column(
//                 children: [
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       CircleAvatar(
//                         backgroundImage:
//                         AssetImage('assets/images/Education.jpeg'),
//                         radius: 80,
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 30),
//                   Text(
//                     'MOHAMED AHMED',
//                     style: TextStyle(
//                       fontSize: 25,
//                       color: Colors.white,
//                       fontWeight: FontWeight.w600,
//                       letterSpacing: 2,
//                     ),
//                   ),
//                   SizedBox(height: 10),

//                   Text(
//                     'News_Admin@gmail.com',
//                     style: TextStyle(
//                       fontSize: 25,
//                       fontWeight: FontWeight.w600,
//                       fontStyle: FontStyle.italic,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           bottomNavigationBar: Container(
//             padding: EdgeInsets.only(
//               top: 20,
//               right: 20,
//               left: 20,
//             ),
//             height: MediaQuery.of(context).size.height / 2.2,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(40),
//                 topRight: Radius.circular(40),
//               ),
//             ),
//             child: ListView(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Column(
//                         children: [
//                           SizedBox(height: 30),
//                           CustomCartProfile(
//                             icon: Icons.flag_outlined,
//                             text: 'User Name',//dataNewsModel.userName,
//                           ),
//                           CustomCartProfile(
//                             icon: Icons.flag_outlined,
//                             text: 'Email',//dataNewsModel.email,
//                           ),
//                           CustomCartProfile(
//                             icon: Icons.phone_outlined,
//                             text: 'Phone Number',//dataNewsModel.phoneNumber.toString(),
//                           ),
//                           CustomCartProfile(
//                             icon: Icons.hdr_auto_sharp,
//                             text:'Age', //dataNewsModel.age.toString(),
//                           ),
//                           CustomCartProfile(
//                             icon: Icons.flag_outlined,
//                             text: 'Country',//dataNewsModel.country,
//                           ),
//                           CustomCartProfile(
//                             icon: Icons.apartment_outlined,
//                             text: 'Address'//dataNewsModel.address,
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
