import 'package:eb_components/eb_components.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart'
    as ml;
import 'package:image_picker/image_picker.dart';

class HomeMainView extends StatelessWidget {
  const HomeMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: ElevatedButton(
            onPressed: () async {
              getImage(ImageSource.camera);
              // await LFNavigation.pushNamed(
              //   context,
              //   '/CameraScreen',
              //   child: const CameraScreen(),
              //   pushType: LFNavigatorPushType.materialModal,
              // );
            },
            child: const EBText('Camera'),
          ),
        ),
      ],
    );
  }

  Future getImage(ImageSource imageSource) async {
    final XFile? pickedFile =
        await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      final image = XFile(pickedFile.path);
      getRecognizedText(image);
    }
  }

  void getRecognizedText(XFile image) async {
    final ml.InputImage inputImage = ml.InputImage.fromFilePath(image.path);

    final textRecognizer =
        ml.TextRecognizer(script: ml.TextRecognitionScript.latin);

    final recognizedText = await textRecognizer.processImage(inputImage);

    await textRecognizer.close();

    List<String> numbers = [];
    for (ml.TextBlock block in recognizedText.blocks) {
      for (ml.TextLine line in block.lines) {
        final texts = line.text.split(' ');
        for (String word in texts) {
          if (word.length == 2) {
            print('word: $word');
            word = word.replaceAll('O', '0').replaceAll('o', '0');
            final num = int.tryParse(word);
            if (num != null) {
              numbers.add(word);
            }
          }
        }
      }
    }
    print(numbers);
    print(numbers.length);
  }
}
