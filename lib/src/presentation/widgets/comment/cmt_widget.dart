import 'package:doob/Model/SongComments/songcomment.dart';
import 'package:doob/src/data/repositories/music_repo/comment_repository.dart';
import 'package:doob/src/domain/state/api_state.dart';
import 'package:doob/src/providers/music_provider/comment_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final cmtProvider = StateNotifierProvider<CommentProvider, ApiState>((ref) {
  final repository = ref.watch(commentRepositoryProvider);
  return CommentProvider(repository);
});

class CmtWidget extends ConsumerStatefulWidget {
  const CmtWidget({super.key, required this.id});
  final String? id;

  @override
  ConsumerState<CmtWidget> createState() => _CmtWidgetState();
}

class _CmtWidgetState extends ConsumerState<CmtWidget> {
  @override
  void initState() {
    super.initState();
    getCmtList(widget.id ?? "");
  }

  List<dynamic> cmtList = [];
  TextEditingController cmtTextController = TextEditingController();

  Future<dynamic> getCmtList(String id) async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final data = await ref.watch(cmtProvider.notifier).fetchComment(id);

      cmtList = data;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      color: Colors.transparent,
      child: Consumer(
        builder: (context, ref, child) {
          final SongComment = ref.watch(cmtProvider);

          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 10, right: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(left: 120),
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "${cmtList.length} comments",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Century'),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.cancel,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  padding: EdgeInsets.all(10),
                  height: 420,
                  child: ListView.builder(
                    itemCount: cmtList.length,
                    itemBuilder: (context, index) {
                      // return ListTile(title: Text("${cmtList[index]["comment_text"]}"));
                      return ListTile(
                        leading: GestureDetector(
                          onTap: () async {
                            print("Comment Clicked");
                          },
                          child: Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: new BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    new BorderRadius.all(Radius.circular(50))),
                            child: CircleAvatar(
                              radius: 40,

                              backgroundImage: NetworkImage(
                                  '${cmtList[index]['customer']['profile_photo']}'),

                              // imageUrl: "${songState.data[index].coverPhoto}",

                              //  CommentBox.commentImageParser(
                              //   imageURLorPath: songComment
                              //       .data![index].customer!.profile_photo!,

                              //   //data[i]['pic']
                              // )
                            ),
                          ),
                        ),
                        title: Text(
                          "${cmtList[index]["customer"]["name"]}",

                          // data[i]['name'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: cmtList[index]["comment_text"] != null
                            ? Text(
                                cmtList[index]["comment_text"],
                              )
                            : Text('test'),
                        // subtitle: Text(data[i]['message']),
                        //trailing: Text(data[i]['date'], style: TextStyle(fontSize: 10)),
                        // trailing: Text(songComment.data![index].customer!.phone!, style: TextStyle(fontSize: 10)),
                      );
                    },
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextField(
                    controller: cmtTextController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        // enabledBorder: OutlineInputBorder(
                        //     borderSide: BorderSide(color: Colors.grey)),
                        // focusedBorder: OutlineInputBorder(
                        //     borderSide: BorderSide(color: Colors.grey)),
                        labelText: '   Write your comment',
                        labelStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Container(
                              // color: Colors.grey,
                              // width: 20,
                              // height: 20,
                              child: ImageIcon(AssetImage(
                            'assets/Image/dooblogo.png',
                          ))),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.send,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            Map<String, dynamic> body = {};
                            body["comment"] = cmtTextController.text;
                            ref
                                .read(cmtProvider.notifier)
                                .addComment(widget.id ?? "", body: body);
                            setState(() {
                              getCmtList(widget.id ?? "");
                              // ref.watch(musicDetailProvider.notifier).fetchMusics();
                            });
                            cmtTextController.clear();
                          },
                        )),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
