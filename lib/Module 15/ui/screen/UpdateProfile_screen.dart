import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ostad_flutter/Module%2015/ui/widget/TM_App_bar_widget.dart';
import '../utils/asset_paths.dart';
import '../widget/Photo_picker_filleld.dart';

// প্রোফাইল আপডেট করার জন্য একটা StatefulWidget বানানো হয়েছে
class Update_Profile_Screen extends StatefulWidget {
  const Update_Profile_Screen({super.key});

  @override
  State<Update_Profile_Screen> createState() => _Update_Profile_ScreenState();
}


class _Update_Profile_ScreenState extends State<Update_Profile_Screen> {
  // টেক্সট ফিল্ড কন্ট্রোলার (ইনপুট ভ্যালু রাখার জন্য)
  TextEditingController _emailTEController = TextEditingController();
  TextEditingController _firstNameTEController = TextEditingController();
  TextEditingController _lastNameTEController = TextEditingController();
  TextEditingController _mobileTEController = TextEditingController();
  TextEditingController _passwordTEController = TextEditingController();

  // ফর্মের key (ভ্যালিডেশন করার জন্য কাজে লাগবে)
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // ইমেজ পিকার ব্যবহার করার জন্য অবজেক্ট বানানো হলো
  final ImagePicker _imagePicker = ImagePicker();

  // ইউজার যে ইমেজ সিলেক্ট করবে সেটি এখানে রাখা হবে
  XFile? _selectedimage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TM_App_Bar_Widget(isUpdateProfile: true),
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Stack(
            children: [
              // ব্যাকগ্রাউন্ড ইমেজ (SVG ফাইল থেকে)
              SvgPicture.asset(
                AssetPath.backgroundImg,
                fit: BoxFit.cover,
                width: double.maxFinite,
                height: double.maxFinite,
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 82),
                      Text(
                        'Update Profile Screen',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(height: 16),

                      // প্রোফাইল ফটো সেকশন
                      PhotoPickerFilled(
                        onTab: _pickImage, // বাটনে চাপ দিলে _pickImage() কল হবে
                        selectedPhoto: _selectedimage, // নির্বাচিত ইমেজ দেখাবে
                      ),

                      const SizedBox(height: 10),

                      // ইমেইল ফিল্ড
                      TextFormField(
                        controller: _emailTEController,
                        decoration: const InputDecoration(hintText: 'Email'),
                      ),
                      const SizedBox(height: 10),

                      // প্রথম নাম
                      TextFormField(
                        controller: _firstNameTEController,
                        decoration: const InputDecoration(hintText: 'First name'),
                      ),
                      const SizedBox(height: 10),

                      // শেষ নাম
                      TextFormField(
                        controller: _lastNameTEController,
                        decoration: const InputDecoration(hintText: 'Last Name'),
                      ),
                      const SizedBox(height: 10),

                      // মোবাইল নাম্বার
                      TextFormField(
                        controller: _mobileTEController,
                        decoration: const InputDecoration(hintText: 'Mobile'),
                      ),
                      const SizedBox(height: 10),

                      // পাসওয়ার্ড
                      TextFormField(
                        controller: _passwordTEController,
                        decoration: const InputDecoration(hintText: 'Password'),
                      ),
                      const SizedBox(height: 10),

                      // সাবমিট বাটন
                      FilledButton(
                        onPressed: () {
                          // এখানে ফর্ম সাবমিট/ডাটাবেজ আপডেট করার কোড লিখবে
                        },
                        child: const Icon(Icons.arrow_circle_right_outlined),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // গ্যালারি থেকে ইমেজ সিলেক্ট করার ফাংশন
  Future<void> _pickImage() async {
    XFile? pickImage = await _imagePicker.pickImage(
      source: ImageSource.camera,     // akane bivinno location thaka image select kora jai exam camera,gallery etc.
    );

    if (pickImage != null) {
      _selectedimage = pickImage;
      setState(() {}); // UI রিফ্রেশ করবে
    }
  }

  @override
  void dispose() {
    // সব কন্ট্রোলার ডিসপোজ করা হচ্ছে মেমোরি লিক এড়ানোর জন্য
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
