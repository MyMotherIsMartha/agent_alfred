import 'package:agent37_flutter/components/v-loading.dart';
import 'package:agent37_flutter/utils/validate.dart';
import 'package:chewie/chewie.dart';
import 'package:agent37_flutter/api/marketing.dart';
import 'package:agent37_flutter/models/market-course.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:video_player/video_player.dart';

class MarketCoursePage extends StatefulWidget {
  final String id;
  MarketCoursePage(this.id);
  @override
  _MarketCoursePageState createState() => _MarketCoursePageState();
}

class _MarketCoursePageState extends State<MarketCoursePage> {
  var detailFuture;
  CourseModel detail;
  ContactVos currentCourse;
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;
  List<String> videoTime = [];
  int curIndex = 0;

  Future _getDetail() async {
    var result = await MarketingApi().detailCourse(widget.id);
    Map data = result.data['data'];
    setState(() {
      detail = CourseModel.fromJson(data);
      currentCourse = detail.contactVos[0];
    });
    _setVideo(detail.contactVos[0]);
    return 'end';
  }

  // 设置视频
  void _setVideo(ContactVos item) {
    _videoPlayerController = VideoPlayerController.network(item.linkUrl);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 750 / 420,
      autoPlay: false,
      looping: false,
      materialProgressColors: ChewieProgressColors(
        playedColor: hex('#5974FF'),
        handleColor: hex('#5974FF'),
        backgroundColor: hex('#999'),
        bufferedColor: hex('#999'),
      ),
      autoInitialize: true,
    );
  }

  // 播放器
  Widget _headerPlayer() {
    return Container(
        width: double.infinity,
        height: G.setWidth(420),
        color: hex('#999'),
        child: Stack(
          children: <Widget>[
            Container(
                width: double.infinity,
                height: G.setWidth(420),
                child: currentCourse.contactType == 1
                    ? _videoPlayerController != null
                        ? Chewie(
                            controller: _chewieController,
                          )
                        : Container()
                    : Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(detail.courseImg),
                                fit: BoxFit.fill)),
                      )
                // child: videoController != null && videoController.value.initialized ? VideoPlayer(videoController) : _buildInitingWidget(),
                ),
            Positioned(
              top: G.statusHeight,
              left: 0,
              child: Container(
                alignment: Alignment.center,
                child: IconButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    G.router.pop(context);
                  },
                  icon: Icon(
                    Icons.keyboard_arrow_left,
                    size: 32,
                    color: hex('#FFF'),
                  ),
                ),
              ),
            )
          ],
        ));
  }

  // 标题
  Widget _title() {
    return Container(
      padding: EdgeInsets.all(G.setWidth(30)),
      alignment: Alignment.centerLeft,
      child: Text(
        currentCourse?.videoName,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
        style: TextStyle(
            color: hex('#333'), fontSize: G.setSp(36), height: 50 / 36),
      ),
    );
  }

  Widget _courseItemVideo(int index) {
    ContactVos item = detail.contactVos[index];
    String timeStr;
    VideoPlayerController _playerController =
        VideoPlayerController.network(item.linkUrl);
    ChewieController _chewie = ChewieController(
      videoPlayerController: _playerController,
      aspectRatio: 252 / 142,
      autoPlay: false,
      looping: false,
      customControls: Container(),
      autoInitialize: true,
    );
    // _chewie.addListener(() {
    //   print('_chewie.addListener');
    //   if (_playerController.value.duration != null && videoTime[index] == '') {
    //     timeStr = _playerController.value.duration.toString().split('.')[0];
    //     setState(() {
    //       videoTime[index] = timeStr;
    //     });
    //   }
    // });
    _playerController.addListener(() {
      if (_playerController.value.duration != null && videoTime[index] == '') {
        timeStr = _playerController.value.duration.toString().split('.')[0];
        setState(() {
          videoTime[index] = timeStr;
        });
      }
    });
    return _videoPlayerController != null
        ? Container(
            width: G.setWidth(252),
            height: G.setWidth(142),
            child: Stack(
              children: <Widget>[
                Chewie(
                  controller: _chewie,
                ),
                Positioned(
                    bottom: G.setWidth(10),
                    right: G.setWidth(10),
                    child: Text(
                      videoTime[index],
                      style:
                          TextStyle(fontSize: G.setSp(24), color: hex('#FFF')),
                    ))
              ],
            ))
        : Container();
  }

  // 课程目录
  Widget _courseItem(int index) {
    videoTime.add('');
    ContactVos item = detail.contactVos[index];
    int courseCount = detail.contactVos.length;
    return InkWell(
        onTap: () {
          if (curIndex == index) {
            return;
          }
          setState(() {
            currentCourse = item;
            curIndex = index;
          });
          _videoPlayerController.pause();
          if (item.contactType == 1) {
            setState(() {
              _videoPlayerController =
                  VideoPlayerController.network(item.linkUrl);
              _chewieController = ChewieController(
                videoPlayerController: _videoPlayerController,
                aspectRatio: 750 / 420,
                autoPlay: false,
                looping: false,
                materialProgressColors: ChewieProgressColors(
                  playedColor: hex('#5974FF'),
                  handleColor: hex('#5974FF'),
                  backgroundColor: hex('#999'),
                  bufferedColor: hex('#999'),
                ),
                autoInitialize: true,
              );
            });
          } else {
            // _videoPlayerController.dispose();
            // _chewieController.dispose();
          }
        },
        child: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text((index + 1).toString() + '/' + courseCount.toString()),
            G.spacing(10),
            Container(
                width: G.setWidth(252),
                height: G.setWidth(142),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(G.setWidth(10)),
                    child: Stack(
                      children: <Widget>[
                        item.contactType == 1 && !Validate.isNon(item.linkUrl)
                            ? _courseItemVideo(index)
                            : Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(detail.courseImg),
                                        fit: BoxFit.fill)),
                              ),
                        curIndex == index
                            ? Positioned(
                                left: 0,
                                bottom: G.setWidth(10),
                                child: Image.asset(
                                    '${G.imgBaseUrl}pic-icon/cur-course.png',
                                    width: G.setWidth(48),
                                    height: G.setWidth(32)),
                              )
                            : Container()
                      ],
                    ))),
            G.spacing(15),
            Text(item.contactType == 1 ? item.videoName : item.imgName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: G.setSp(28),
                    color: hex('#333'),
                    height: 40 / 28)),
            Validate.isNon(item.tutorName)
                ? Container()
                : Container(
                    margin: EdgeInsets.only(top: G.setWidth(5)),
                    child: Text('导师：' + item.tutorName,
                        style: TextStyle(
                            fontSize: G.setSp(24), color: hex('#999'))),
                  )
          ],
        )));
  }

  // 课程目录
  Widget _courseMenu() {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: G.setWidth(30)),
      height: G.setWidth(375),
      child: ListView.separated(
          separatorBuilder: (context, index) {
            return G.spacing(20, dir: 'x');
          },
          scrollDirection: Axis.horizontal,
          itemCount: detail.contactVos.length,
          // itemExtent: G.setWidth(252),
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: G.setWidth(30)),
          itemBuilder: (context, index) {
            return _courseItem(index);
          }),
    );
  }

  // 内容详情
  Widget _contentHtml() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: G.setWidth(30), vertical: G.setWidth(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('内容详情',
              style: TextStyle(fontSize: G.setSp(28), color: hex('#333'))),
          Html(data: currentCourse.contactContent)
        ],
      ),
    );
  }

  // 导师
  Widget _tutor() {
    return Container(
      padding: EdgeInsets.all(G.setWidth(30)),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: hex('#F3F4F6'), width: G.setWidth(20)),
          bottom: BorderSide(color: hex('#F3F4F6'), width: G.setWidth(20)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: G.setWidth(120),
            height: G.setWidth(120),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: hex('#999'),
                borderRadius: BorderRadius.circular(G.setWidth(120)),
                image: DecorationImage(
                    image: Validate.isNon(currentCourse.tutorImg)
                        ? AssetImage(
                            '${G.imgBaseUrl}pic-icon/default_avatar.png')
                        : NetworkImage(currentCourse.tutorImg),
                    fit: BoxFit.fill)),
          ),
          Container(
              width: G.setWidth(550),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(currentCourse.tutorName ?? ''),
                  Text(currentCourse.tutorDesc ?? '')
                ],
              ))
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    detailFuture = _getDetail();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
            body: Container(
                height: G.setHeight(1334),
                child: FutureBuilder(
                  future: detailFuture,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        child: Column(
                          children: <Widget>[
                            _headerPlayer(),
                            Expanded(
                                child: SingleChildScrollView(
                              child: Column(
                                children: <Widget>[
                                  _title(),
                                  _courseMenu(),
                                  _tutor(),
                                  _contentHtml()
                                ],
                              ),
                            ))
                          ],
                        ),
                      );
                    } else {
                      return VLoading();
                    }
                  },
                ))));
  }
}