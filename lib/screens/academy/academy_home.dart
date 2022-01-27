import 'package:better_player/better_player.dart';
import 'package:crypto_app/responsive/size_config.dart';
import 'package:crypto_app/ressources/user_content_to_give.dart';
import 'package:crypto_app/utils/colors.dart';
import 'package:crypto_app/utils/constants.dart';
import 'package:flutter/material.dart';

class AcademyHome extends StatefulWidget {
  const AcademyHome({Key? key}) : super(key: key);

  @override
  _AcademyHomeState createState() => _AcademyHomeState();
}

class _AcademyHomeState extends State<AcademyHome> {
  late BetterPlayerController _betterPlayerController;
  String? _chosenValue;

  @override
  List<BetterPlayerDataSource> createDataSet() {
    List<BetterPlayerDataSource> dataSourceList = [];
    dataSourceList.add(
      BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
      ),
    );
    dataSourceList.add(
      BetterPlayerDataSource(BetterPlayerDataSourceType.network,
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"),
    );
    dataSourceList.add(
      BetterPlayerDataSource(BetterPlayerDataSourceType.network,
          "http://sample.vodobox.com/skate_phantom_flex_4k/skate_phantom_flex_4k.m3u8"),
    );
    return dataSourceList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: SizeConfig.widthMultiplier * 100,
          height: SizeConfig.heightMultiplier * 100,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(SizeConfig.widthMultiplier * 2),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: BetterPlayerPlaylist(
                      betterPlayerDataSourceList: createDataSet(),
                      betterPlayerPlaylistConfiguration:
                          const BetterPlayerPlaylistConfiguration(),
                      betterPlayerConfiguration:
                          const BetterPlayerConfiguration(),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: const BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(
                        defaultRadius * 5,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(0.0),
                        child: DropdownButton<String?>(
                          value: _chosenValue,
                          onChanged: (String? s) {
                            setState(() {
                              _chosenValue = s;
                            });
                          },
                          style: TextStyle(color: Colors.black, fontSize: 18),
                          //elevation: 5,
                          items: UserContentToGive().setLevelList(),
                          hint: const Text(
                            "Votre niveau",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
