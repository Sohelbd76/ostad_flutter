import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// ফটো পিকার ফিল্ড (Custom Widget)
class PhotoPickerFilled extends StatelessWidget {
  const PhotoPickerFilled({
    super.key,
    required this.onTab, // ফটো পিক করার জন্য বাটনে চাপলে কোন ফাংশন চালু হবে
    this.selectedPhoto,  // ইউজার যে ফটো সিলেক্ট করেছে সেটি এখানে রাখা হবে
  });

  final VoidCallback onTab;
  final XFile? selectedPhoto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8), // চারদিকে প্যাডিং
      child: GestureDetector(
        onTap: onTab, // পুরো কন্টেইনারে চাপ দিলে ফটো পিক ফাংশন চালু হবে
        child: Container(
          height: 50,
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Row(
            children: [
              // বাম দিকের ছোট বক্স (শুধু "Photo" টেক্সট দেখানোর জন্য)
              Container(
                width: 50,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                ),
                child: const Text(
                  'Photo',
                  style: TextStyle(color: Colors.white),
                ),
              ),

              const SizedBox(width: 10),

              // ডান দিকের টেক্সট: ইউজার ফটো সিলেক্ট করলে ফাইল নাম দেখাবে
              Expanded(
                child: Text(
                  selectedPhoto == null
                      ? 'No photo selected'   // যদি ফটো না থাকে
                      : selectedPhoto!.name,  // যদি থাকে তবে নাম দেখাবে
                  maxLines: 1,
                  style: const TextStyle(color: Colors.grey),
                  overflow: TextOverflow.ellipsis, // নাম বড় হলে ... দেখাবে
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
