import 'package:agent37_flutter/api/marketing.dart';
import 'package:agent37_flutter/components/v-loading.dart';
import 'package:agent37_flutter/models/market-module.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';

class ModuleDetailPage extends StatefulWidget {
  final String sourceFrom;
  final String contentId;
  ModuleDetailPage(this.contentId, this.sourceFrom);

  @override
  _ModuleDetailPageState createState() => _ModuleDetailPageState();
}

class _ModuleDetailPageState extends State<ModuleDetailPage> {

  var detailFuture;
  ModuleModel moduleDetail;

  Future _getModule() async {
    var result;
    if (widget.sourceFrom == 'banner') {
      result = await MarketingApi().detailModule(widget.contentId);
    } else {
      result = await MarketingApi().moduleList(moduleId: widget.contentId);
    }
    List data = result.data['data'];
    if (result.data['code'] == 200) {
      if (data != null) {
        setState(() {
          moduleDetail = ModuleModel.fromJson(data[0]);
        });
      } else {
        G.toast('暂无分销管理首页数据');
      }
    }
    return 'end';
  }

  Widget _courseItem(FindIndexModuleItemVos item) {
    return InkWell(
      onTap: () {
        int type = item.moduleContactType;
        String id = item.contactId;
        if (type == 2) {
          G.navigateTo(context, '/market/course?id=' + id);
        }
        if (type == 1) {
          G.navigateTo(context, '/market/meeting?id=' + id);
        }
      },
    child: Container(
      padding: EdgeInsets.symmetric(vertical: G.setWidth(30)),
      height: G.setWidth(260),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: G.setWidth(1), color: hex('#eee')))),
      child: Row(
        children: <Widget>[
          Container(
            width: G.setWidth(300),
            height: G.setWidth(200),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(item.contactImg), fit: BoxFit.fill)),
          ),
          G.spacing(20, dir: 'x'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(item.contactName),
            ],
          )
        ],
      ),
    ));
  }

  @override
  void initState() { 
    super.initState();
    detailFuture = _getModule();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: detailFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              elevation: 0,
              title: Text(moduleDetail.name),
            ),
            body: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: G.setWidth(30)),
              child: ListView.builder(
                  itemCount: moduleDetail.itemVos.length,
                  itemBuilder: (context, index) {
                    return _courseItem(moduleDetail.itemVos[index]);
                  }),
            ),
          );
        } else {
          return Container(
            width: G.setWidth(750),
            height: G.setHeight(1334),
            child: VLoading(),
          );
        }
      },
    );
  }
}