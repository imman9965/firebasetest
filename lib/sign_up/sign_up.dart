// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controller/controller.dart';
// import '../widgets/customtextfield.dart';
//
// class SignupPage extends StatelessWidget {
//   final AuthController authController = Get.find();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Sign Up")),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             CustomTextField(
//               controller: authController.emailController,
//               labelText: "Email",
//             ),
//             SizedBox(height: 10),
//             CustomTextField(
//               controller: authController.passwordController,
//               labelText: "Password",
//               obscureText: true,
//             ),
//             SizedBox(height: 20),
//             Obx(
//               () =>
//                   authController.isLoading.value
//                       ? CircularProgressIndicator()
//                       : ElevatedButton(
//                         onPressed: authController.signup,
//                         child: Text("Sign Up"),
//                       )
//               ,
//             ),
//             TextButton(
//               onPressed: () => Get.back(),
//               child: Text("Already have an account? Login"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
