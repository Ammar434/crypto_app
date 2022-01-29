import 'package:crypto_app/models/video_model.dart';
import 'package:crypto_app/responsive/size_config.dart';
import 'package:crypto_app/ressources/video_method.dart';
import 'package:crypto_app/screens/academy/playlist_tile_widget.dart';
import 'package:crypto_app/utils/colors.dart';
import 'package:crypto_app/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:video_player/video_player.dart';

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  @override
  _VideoInfoState createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  late String title;
  late int itemCount;
  bool isLoading = false;
  bool isPlaying = true;
  bool isDisposed = false;
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _initData();
    _videoPlayerController = VideoPlayerController.network("");
    //_onTapVideo(-1);
  }

  _initData() async {
    setState(() {
      isLoading = true;
    });
    title = await VideoMethod.getLevelTitle(level: 0);

    setState(() {
      isLoading = false;
    });
  }

  _onTapVideo(String videoUrl) {
    final controller = VideoPlayerController.network(videoUrl);
    final old = _videoPlayerController;
    _videoPlayerController = controller;
    if (old != null) {
      old.removeListener(() {
        _onControllerUpdate();
        old.pause();
      });
    }
    setState(() {});
    controller.initialize().then(
      (value) {
        old.dispose();
        controller.addListener(() {
          _onControllerUpdate;
        });
        controller.play();
        setState(() {});
      },
    );
  }

  void _onControllerUpdate() async {
    if (isDisposed) {
      return;
    }
    isPlaying = _videoPlayerController.value.isPlaying;
  }

  Widget _playView(BuildContext context) {
    final controller = _videoPlayerController;
    if (controller.value.isInitialized) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: VideoPlayer(controller),
      );
    }
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: LottieBuilder.network(
        "https://assets9.lottiefiles.com/packages/lf20_kle1s9re.json",
      ),
    );
  }

  @override
  void dispose() {
    isDisposed = true;
    _videoPlayerController.pause();
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.arrow_back),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator.adaptive())
          : SingleChildScrollView(
              child: SizedBox(
                width: SizeConfig.widthMultiplier * 100,
                height: SizeConfig.heightMultiplier * 100,
                child: Column(
                  children: [
                    buildTop(context),
                    SizedBox(
                      height: defaultPadding,
                    ),
                    Expanded(child: buildBottom()),
                  ],
                ),
              ),
            ),
    );
  }

  Column buildTop(BuildContext context) {
    return Column(
      children: [
        _playView(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                isPlaying
                    ? _videoPlayerController.pause()
                    : _videoPlayerController.play();
              },
              child: const FaIcon(
                FontAwesomeIcons.backward,
              ),
            ),
            TextButton(
              onPressed: () {
                if (isPlaying) {
                  setState(
                    () {
                      isPlaying = false;
                    },
                  );
                  _videoPlayerController.pause();
                } else {
                  setState(
                    () {
                      isPlaying = true;
                    },
                  );
                  _videoPlayerController.play();
                }
              },
              child: FaIcon(
                isPlaying ? FontAwesomeIcons.pause : FontAwesomeIcons.play,
              ),
            ),
            TextButton(
              onPressed: () {
                isPlaying
                    ? _videoPlayerController.pause()
                    : _videoPlayerController.play();
              },
              child: const FaIcon(
                FontAwesomeIcons.forward,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const FaIcon(
                FontAwesomeIcons.expand,
              ),
            )
          ],
        )
      ],
    );
  }

  Container buildBottom() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(70),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: SizeConfig.heightMultiplier * 2.6,
                fontWeight: FontWeight.bold,
                color: backgroundColor,
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2,
            ),
            Expanded(
              child: FutureBuilder(
                future: VideoMethod.getVideoFromLevel(level: 0),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        VideoModel videoModel =
                            VideoModel.fromJson(snapshot.data, index);
                        return PlaylistTileWidget(
                          videoModel: videoModel,
                          onTap: () {
                            _onTapVideo(videoModel.videoUrl);
                          },
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
