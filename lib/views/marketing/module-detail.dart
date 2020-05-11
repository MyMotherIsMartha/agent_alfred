import 'package:agent37_flutter/api/marketing.dart';
import 'package:agent37_flutter/components/v-loading.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:flutter/material.dart';

class ModuleDetailPage extends StatefulWidget {
  final String contentId;
  ModuleDetailPage(this.contentId);

  @override
  _ModuleDetailPageState createState() => _ModuleDetailPageState();
}

class _ModuleDetailPageState extends State<ModuleDetailPage> {

  var detailFuture;

  Future getDetail() async {
    await MarketingApi().detailModule(widget.contentId);
  }

  @override
  void initState() { 
    super.initState();
    detailFuture = getDetail();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: detailFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(

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