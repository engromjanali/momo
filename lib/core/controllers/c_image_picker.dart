import 'package:image_picker/image_picker.dart';

Future<XFile> pickImage() async {
  ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(
    source: ImageSource.gallery,
    imageQuality: 80,
  );
  return image ?? XFile('');
}
