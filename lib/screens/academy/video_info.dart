import 'package:chewie/chewie.dart';
import 'package:crypto_app/models/video_model.dart';
import 'package:crypto_app/responsive/size_config.dart';
import 'package:crypto_app/ressources/video_method.dart';
import 'package:crypto_app/screens/academy/playlist_tile_widget.dart';
import 'package:crypto_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:video_player/video_player.dart';

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key, required this.level}) : super(key: key);
  final int level;

  @override
  _VideoInfoState createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  late String title;
  late int itemCount;
  bool isLoading = false;
  bool isPlaying = false;
  bool isDisposed = false;
  VideoPlayerController? _videoPlayerController;
  ChewieController? chewieController;

  @override
  void initState() {
    super.initState();
    _initData();

    //_onTapVideo(-1);
  }

  _initData() async {
    setState(() {
      isLoading = true;
    });
    title = await VideoMethod.getLevelTitle(level: widget.level);
    _videoPlayerController = VideoPlayerController.network("");

    setState(() {
      isLoading = false;
    });
  }

  _onTapVideo(String videoUrl) async {
    _videoPlayerController = VideoPlayerController.network(videoUrl);
    await _videoPlayerController?.initialize();

    ChewieController(videoPlayerController: _videoPlayerController!);

    setState(() {});
  }

  Widget _playView(BuildContext context) {
    if (_videoPlayerController!.value.isInitialized) {
      setState(() {
        chewieController =
            ChewieController(videoPlayerController: _videoPlayerController!);
      });
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: Chewie(
          controller: chewieController!,
        ),
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
    _videoPlayerController?.pause();
    _videoPlayerController?.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator.adaptive())
          : SizedBox(
              width: SizeConfig.widthMultiplier * 100,
              height: SizeConfig.heightMultiplier * 100,
              child: ListView(
                children: [
                  _playView(context),
                  SizedBox(
                    height: defaultPadding,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: SizeConfig.heightMultiplier * 2.6,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2,
                  ),
                  FutureBuilder(
                    future: VideoMethod.getVideoFromLevel(level: widget.level),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return Column(
                        children: List.generate(
                          snapshot.data.length,
                          (index) {
                            VideoModel videoModel =
                                VideoModel.fromJson(snapshot.data, index);
                            return PlaylistTileWidget(
                              videoModel: videoModel,
                              onTap: () {
                                _videoPlayerController?.pause();

                                _onTapVideo(videoModel.videoUrl);
                              },
                            );
                          },
                        ),
                      );
                    },
                  ),
                  // Expanded(child: buildBottom()),
                ],
              ),
            ),
    );
  }
}
