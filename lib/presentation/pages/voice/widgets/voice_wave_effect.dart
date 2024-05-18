import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:smarthome/core/utils/color_resources.dart';

class VoiceWaveEffect extends StatefulWidget {
  final bool isListening;
  const VoiceWaveEffect({Key? key, required this.isListening}) : super(key: key);

  @override
  State<VoiceWaveEffect> createState() => _VoiceWaveEffectState();
}

class _VoiceWaveEffectState extends State<VoiceWaveEffect> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.isListening ?  LoadingAnimationWidget.staggeredDotsWave(
          color: ColorResources.PRIMARY_1,
          size: 100,
        ) : Container()
      ],
    );
  }
}
