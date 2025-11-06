import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class FaceDetectionService {
  FaceDetectionService._() {
    init();
  }
  static FaceDetectionService instance = FaceDetectionService._();
  late FaceDetector faceDetector;

  void init() {
    final options = FaceDetectorOptions(
      enableContours: true,
      enableClassification: true, // Needed for eye open probability
    );
    faceDetector = FaceDetector(options: options);
  }

  void dispose() {
    faceDetector.close();
  }

  /// kit can't work in parallely
  Future<bool> isGoodImage(String imagePath) async {
    final List<Face> faces = await faceDetector.processImage(
      InputImage.fromFilePath(imagePath),
      // InputImage.
    );

    if (faces.length > 1) {
      // debugPrint("Error: multiple person are not allowed.");
      return false;
    }
    if (faces.length == 0) {
      // debugPrint("Error: No Face Detected");
      return false;
    }
    // print("face length ${faces.length}");

    Face face = faces[0];
    // debugPrint("right eyes : ${face.rightEyeOpenProbability.toString()}");

    final Rect boundingBox = face.boundingBox;

    final double? rotX =
        face.headEulerAngleX; // Head is tilted up and down rotX degrees
    final double? rotY =
        face.headEulerAngleY; // Head is rotated to the right rotY degrees
    final double? rotZ =
        face.headEulerAngleZ; // Head is tilted sideways rotZ degrees
    // If landmark detection was enabled with FaceDetectorOptions (mouth, ears,
    // eyes, cheeks, and nose available):
    final FaceLandmark? leftEar = face.landmarks[FaceLandmarkType.leftEar];
    final FaceLandmark? rightEar = face.landmarks[FaceLandmarkType.rightEar];
    if (leftEar != null) {
      final Point<int> leftEarPoint = leftEar.position;
    }
    if (rightEar != null) {
      final Point<int> rightEarPoint = rightEar.position;
    }

    // If classification was enabled with FaceDetectorOptions:
    if (face.smilingProbability != null) {
      final double? smileProb = face.smilingProbability;
    }

    // If face tracking was enabled with FaceDetectorOptions:
    if (face.trackingId != null) {
      final int? id = face.trackingId;
    }

    dispose(); // dispose after use.
    return true;
  }
}
