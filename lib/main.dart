import 'package:flutter/material.dart';

// import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

// void main() {runApp();
// }
// void main() {
//   runApp(
//     MaterialApp(
//       home: Scaffold(
//           backgroundColor: Colors.blueGrey,
//           appBar: AppBar(
//             title: const Text('I am super rich'),
//             backgroundColor: Colors.blueGrey[900],
//           ),
//           body: MyNewApp()),
//     ),
//   );
// }
void main() => runApp(MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0XFF0A0E21),
        scaffoldBackgroundColor: const Color(0XFF0A0E21),
      ),
      home: const HomePage(),
    ));

class MyNewApp extends StatelessWidget {
  @override
  // ignore: override_on_non_overriding_member
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      title: 'image picker',
      home: HomePage(),
    );
  }
}

class StatelessWidget {}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _image;

  final _picker = ImagePicker();
  // Implementing the image picker
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Kindacode.com'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(35),
            child: Column(children: [
              Center(
                child: ElevatedButton(
                  onPressed: _openImagePicker,
                  child: const Text('Select An Image'),
                ),
              ),
              const SizedBox(height: 35),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 300,
                color: Colors.grey[300],
                child: _image != null
                    ? Image.file(_image!, fit: BoxFit.cover)
                    : const Text('Please select an image'),
              )
            ]),
          ),
        ));
  }
}
// void main() {
//   runApp(
//     MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.blueGrey,
//         appBar: AppBar(
//           title: const Text('I am super rich'),
//           backgroundColor: Colors.blueGrey[900],
//         ),
//         body: Center(
//           child: Column(children: const [
//             Image(
//               image: AssetImage('images/diamond.png'),
//             ),
//           ]),
//         ),
//       ),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//
//           title: const Text('I am rich'),
//           backgroundColor: Colors.blueGrey[900],
//
//         ),
//       ),
//     );
//   }
// }
