// ignore_for_file: deprecated_member_use
import 'dart:io';
import 'package:face_mask_detection/app_const/strings.dart';
import 'package:face_mask_detection/services/tensor_flow_lite_services.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TakeImage extends StatefulWidget {
  @override
  _TakeImageState createState() => _TakeImageState();
}

class _TakeImageState extends State<TakeImage> {
  final TensorFlowServices _tensorFlowServices = TensorFlowServices();
  File? _image;
  bool _loading = false;
  List? _recognitions;
  ImagePicker _picker = ImagePicker();
  String text = "";
  PickedFile? _imageFile;
  @override
  void initState() {
    super.initState();
    _loading = true;
    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  loadModel() async {
    _tensorFlowServices.loadModel();
  }

  selectImage() async {
    _imageFile = await _picker.getImage(source: ImageSource.camera);
    if (_imageFile == null) return;
    setState(() {
      _loading = true;
      _image = File(_imageFile!.path);
    });
    predictImage(_image!);
  }

  predictImage(File image) async {
    var recognitions = await _tensorFlowServices.predictImage(image);
    setState(() {
      _loading = false;
      _recognitions = recognitions;
      text = _recognitions![0][labelString];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.camera_alt,
          color: Colors.red,
        ),
        tooltip: pickIFC,
        backgroundColor: Colors.white,
        onPressed: selectImage,
      ),
      body: _loading
          ? Container(
              color: Colors.redAccent,
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )
          : Container(
              color: Colors.red.withOpacity(0.4),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _image == null
                      ? Container(
                          child: Text(
                            takeImageP,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontFamily: "gilroy",
                            ),
                          ),
                        )
                      : Image.file(
                          _image!,
                          height: MediaQuery.of(context).size.height / 2 + 60,
                          width: MediaQuery.of(context).size.width - 80,
                        ),
                  SizedBox(
                    height: 20,
                  ),
                  _recognitions != null
                      ? Text(
                          "$text",
                          style: TextStyle(
                              color: text == 'Without Mask'
                                  ? Colors.green
                                  : Colors.red,
                              fontSize: 20.0,
                              fontFamily: "gilroy"),
                        )
                      : Container()
                ],
              ),
            ),
    );
  }
}
