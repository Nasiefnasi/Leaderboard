// ignore_for_file: sort_child_properties_last, unnecessary_const, sized_box_for_whitespace, unnecessary_import, unused_local_variable, unnecessary_string_interpolations, prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:leaderboardapp/model/storehive/storedata.dart';
import 'package:velocity_x/velocity_x.dart';

class StatusBar extends StatelessWidget {
  const StatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: Hive.box<GetModelshive>("hive_box").listenable(),
        builder: (context, Box<GetModelshive> box, child) {
          if (box.isEmpty) {
            return const Center(
              child: Text("No data available"),
            );
          } else {
            final data = box.get("key") as GetModelshive;
            final leaderss = data.leaderss;

            return ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                final leade = leaderss[index];
                Color color =
                    Colors.primaries[index * 1 % Colors.primaries.length];
                return Container(
                  width: double.infinity,
                  height: 250,
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                              child: SizedBox(
                            height: 250,
                            child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Bars(
                                    radiuss: const BorderRadius.horizontal(
                                        left: Radius.circular(15)),
                                    mediaquery: mediaquery,
                                    colors: Colors.grey.shade400,
                                    sizevalue: .15,
                                  ),
                                  Positioned(
                                    bottom: 20,
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          child: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                leaderss[0].profilePic),
                                            radius: 40,
                                            backgroundColor: Colors.black12,
                                          ),
                                          radius: 45,
                                        ),
                                        10.heightBox,
                                        "${leaderss[0].name}"
                                            .text
                                            .extraBlack
                                            .make(),
                                        // 5.heightBox,
                                        "${leaderss[0].points}".text.make(),
                                        10.heightBox,
                                      ],
                                    ),
                                  )
                                ]),
                          )),
                          Expanded(
                              child: SizedBox(
                            height: 250,
                            child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Bars(
                                    radiuss: const BorderRadius.vertical(
                                        top: Radius.circular(15)),
                                    mediaquery: mediaquery,
                                    colors: Colors.amber,
                                    sizevalue: .18,
                                  ),
                                  Positioned(
                                    // bottom: 80,
                                    top: 50,
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          child: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                leaderss[2].profilePic),
                                            radius: 40,
                                            backgroundColor: Colors.black12,
                                          ),
                                          radius: 45,
                                        ),
                                        10.heightBox,
                                        "${leaderss[1].name}"
                                            .text
                                            .extraBlack
                                            .make(),
                                        // 5.heightBox,
                                        "${leaderss[1].points}".text.make()
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: const Alignment(.6, -.8),
                                    child: Container(
                                      height: 60,
                                      width: 60,
                                      child: Image.asset("image/king.png"),
                                    ),
                                  )
                                ]),
                          )),
                          Expanded(
                              child: SizedBox(
                            height: 250,
                            child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Bars(
                                    radiuss: const BorderRadius.horizontal(
                                        right: Radius.circular(15)),
                                    mediaquery: mediaquery,
                                    colors: Colors.orangeAccent,
                                    sizevalue: .12,
                                  ),
                                  Positioned(
                                    top: 100,
                                    bottom: 2,
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          child: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                leaderss[3].profilePic),
                                            radius: 40,
                                            backgroundColor: Colors.black12,
                                          ),
                                          radius: 45,
                                        ),
                                        10.heightBox,
                                        leaderss[3].name.text.extraBlack.make(),
                                        // 5.heightBox,
                                        leaderss[3].points.text.make()
                                      ],
                                    ),
                                  )
                                ]),
                          )),
                        ],
                      )),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class Bars extends StatelessWidget {
  const Bars({
    super.key,
    required this.mediaquery,
    required this.colors,
    this.sizevalue,
    required this.radiuss,
  });

  final Color colors;
  final Size mediaquery;
  final sizevalue;
  final radiuss;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(borderRadius: radiuss, color: colors),
        height: mediaquery.height * sizevalue,
        // width: 90,
      ),
    );
  }
}
