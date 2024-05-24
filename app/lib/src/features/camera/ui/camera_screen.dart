import 'dart:io';

import 'package:camera/camera.dart';
import 'package:eb_resource/eb_resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_leaf_kit/flutter_leaf_kit.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _cameraController;
  List<CameraDescription> _cameras = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        _cameras = await availableCameras();
        _cameraController = CameraController(
          _cameras[0],
          ResolutionPreset.max,
          imageFormatGroup: ImageFormatGroup.jpeg,
        );
        _cameraController!.initialize().then((_) {
          setState(() {});
        });
      } catch (e) {
        if (e is CameraException) {
          switch (e.code) {
            case 'CameraAccessDenied':
              // Handle access errors here.
              break;
            default:
              // Handle other errors here.
              break;
          }
        }
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _cameraController?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: CameraPreview(_cameraController!),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: ImageCaptureArea(),
            ),
          ),
          Positioned(
            top: 45.0,
            right: 20.0,
            child: GestureDetector(
              onTap: () {
                LFNavigation.pop(context);
              },
              child: const SizedBox(
                width: 45.0,
                height: 45.0,
                child: Icon(Icons.close),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.camera),
        onPressed: () {
          _cameraController?.takePicture().then((value) {
            print('value: $value');
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context) => ImageDisplayWidget(
            //       imagePath: value.path,
            //     ),
            //   ),
            // );
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class ImageCaptureArea extends StatelessWidget {
  const ImageCaptureArea({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.8;
    double height = width * 0.8;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: EBColors.primary500, width: 2.0),
      ),
      width: width,
      height: height,
    );
  }
}

class ImageDisplayWidget extends StatelessWidget {
  final String imagePath;

  const ImageDisplayWidget({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.file(
          File(imagePath),
        ),
      ),
    );
  }
}

IconData getCameraLensIcon(
    CameraLensDirection direction, BuildContext context) {
  switch (direction) {
    case CameraLensDirection.back:
      return Icons.camera_rear;
    case CameraLensDirection.front:
      return Icons.camera_front;
    case CameraLensDirection.external:
      return Icons.camera;
  }
}
