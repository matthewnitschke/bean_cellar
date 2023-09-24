import 'package:bean_cellar/app_colors.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class TakeAvatarPhoto extends StatefulWidget {
  const TakeAvatarPhoto({super.key});

  @override
  State<TakeAvatarPhoto> createState() => _TakeAvatarPhotoState();
}

class _TakeAvatarPhotoState extends State<TakeAvatarPhoto> {
  CameraDescription? _cameraDescription;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AvatarPreview(camera: _cameraDescription);
  }
}

class AvatarPreview extends StatefulWidget {
  final CameraDescription? camera;

  const AvatarPreview({super.key, this.camera});

  @override
  State<AvatarPreview> createState() => _AvatarPreviewState();
}

class _AvatarPreviewState extends State<AvatarPreview> {
  CameraController? _controller;

  @override
  void initState() {
    super.initState();

    availableCameras()
        .then((cameras) => cameras.first)
        .then((camera) => CameraController(camera, ResolutionPreset.low, enableAudio: false))
        .then((controller) => setState(() => _controller = controller));
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null) return const CircularProgressIndicator();

    return FutureBuilder(
      future: _controller!.initialize(),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.done) {
          return ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(80)),
            child: SizedBox(
              width: 100,
              height: 100,
              child: AspectRatio(
                aspectRatio: 1,
                child: CameraPreview(_controller!),
              ),
            ),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
