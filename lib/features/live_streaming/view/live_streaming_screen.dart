import 'package:flutter/material.dart';
import 'package:live_streaming_app/core/const/secret.dart';
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';

class LiveStreamingScreen extends StatelessWidget {
  final String userId;
  final String userName;
  final bool isHost;
  final String liveId;
  final String hostName;

  const LiveStreamingScreen({
    super.key,
    required this.userId,
    required this.userName,
    required this.isHost,
    required this.liveId,
    required this.hostName,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ZegoUIKitPrebuiltLiveStreaming(
          appID: appID,
          appSign: appSign,
          userID: userId,
          userName: userName,
          liveID: liveId,
          config: isHost
              ? ZegoUIKitPrebuiltLiveStreamingConfig.host()
              : ZegoUIKitPrebuiltLiveStreamingConfig.audience(),
        ),
    );
  }
}
