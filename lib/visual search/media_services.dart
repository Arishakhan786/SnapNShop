import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class MediaService {
  static final ImagePicker _picker = ImagePicker();

  static Future<String?> pickFromCamera() async {
    // Ask camera permission (Android/iOS)
    final status = await Permission.camera.request();
    if (!status.isGranted) return null;

    final XFile? file = await _picker.pickImage(source: ImageSource.camera);
    return file?.path;
  }

  static Future<String?> pickFromGallery() async {
    // On iOS it’s photos, on Android recent SDKs don’t require it via image_picker
    final photos = await Permission.photos.request();
    if (photos.isDenied || photos.isPermanentlyDenied) {
      // try storage for older Androids if needed
      await Permission.storage.request();
    }
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    return file?.path;
  }
}
