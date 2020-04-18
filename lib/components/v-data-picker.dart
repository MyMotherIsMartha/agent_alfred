import 'package:agent37_flutter/utils/global.dart';
import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:date_format/date_format.dart';

final double kPickerHeight = G.setWidth(600);
final double kItemHeight = G.setWidth(100);
final Color kBtnColor = hex('#999'); //50
final Color kBtnConfirmColor = hex('#108EE9'); //50
const Color kTitleColor = Color(0xFF787878); //120
final double kTextFontSize = G.setSp(32);

typedef StringClickCallback = void Function(int selectIndex, Object selectStr);
typedef ArrayClickCallback = void Function(
    List<int> selecteds, List<dynamic> strData);
typedef DateClickCallback = void Function(
    dynamic selectDateStr, dynamic selectDate);

enum DateType {
  YMD, // y, m, d
  YM, // y ,m
  YMD_HM, // y, m, d, hh, mm
  YMD_AP_HM, // y, m, d, ap, hh, mm
}

class VDatePicker extends StatelessWidget {
  final DateTime value;
  final Function cb;
  final maxValue;
  final minValue;
  VDatePicker(this.value, this.cb, {this.maxValue, this.minValue});

  void openModalPicker(
    BuildContext context, {
    @required PickerAdapter adapter,
    String title,
    List<int> selecteds,
    @required PickerConfirmCallback clickCallBack,
  }) {
    Picker(
            adapter: adapter,
            title: Text(title ?? "",
                style: TextStyle(color: kTitleColor, fontSize: kTextFontSize)),
            selecteds: selecteds,
            cancelText: '取消',
            confirmText: '确定',
            cancelTextStyle:
                TextStyle(color: kBtnColor, fontSize: kTextFontSize),
            confirmTextStyle:
                TextStyle(color: kBtnConfirmColor, fontSize: kTextFontSize),
            textAlign: TextAlign.right,
            itemExtent: kItemHeight,
            height: kPickerHeight,
            selectedTextStyle: TextStyle(color: Colors.black),
            onConfirm: clickCallBack)
        .showModal(context);
  }

  void showDatePicker(
    BuildContext context, {
    DateType dateType,
    String title,
    // DateTime maxValue,
    // DateTime minValue,
    DateTime value,
    DateTimePickerAdapter adapter,
    @required DateClickCallback clickCallback,
  }) {
    int timeType;
    if (dateType == DateType.YM) {
      timeType = PickerDateTimeType.kYM;
    } else if (dateType == DateType.YMD_HM) {
      timeType = PickerDateTimeType.kYMDHM;
    } else if (dateType == DateType.YMD_AP_HM) {
      timeType = PickerDateTimeType.kYMD_AP_HM;
    } else {
      timeType = PickerDateTimeType.kYMD;
    }

    openModalPicker(context,
        adapter: adapter ??
            DateTimePickerAdapter(
              type: timeType,
              isNumberMonth: true,
              yearSuffix: "年",
              monthSuffix: "月",
              daySuffix: "日",
              strAMPM: const ["上午", "下午"],
              maxValue: maxValue??DateTime.now(),
              minValue: minValue,
              value: value ?? DateTime.now(),
            ),
        title: title, clickCallBack: (Picker picker, List<int> selecteds) {
      var time = (picker.adapter as DateTimePickerAdapter).value;
      var timeStr;
      if (dateType == DateType.YM) {
        timeStr = time.year.toString() + "年" + time.month.toString() + "月";
      } else if (dateType == DateType.YMD_HM) {
        timeStr = time.year.toString() +
            "年" +
            time.month.toString() +
            "月" +
            time.day.toString() +
            "日" +
            time.hour.toString() +
            "时" +
            time.minute.toString() +
            "分";
      } else if (dateType == DateType.YMD_AP_HM) {
        var str = formatDate(time, [am]) == "AM" ? "上午" : "下午";
        timeStr = time.year.toString() +
            "年" +
            time.month.toString() +
            "月" +
            time.day.toString() +
            "日" +
            str +
            time.hour.toString() +
            "时" +
            time.minute.toString() +
            "分";
      } else {
        timeStr = time.year.toString() +
            "年" +
            time.month.toString() +
            "月" +
            time.day.toString() +
            "日";
      }
//          print(formatDate(DateTime(1989, 02, 21), [yyyy, '-', mm, '-', dd]));
      clickCallback(timeStr, picker.adapter.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          showDatePicker(
            context,
            value: value,
            clickCallback: (var str, var time) {
              // print(time);
              cb(DateTime.parse(time));
              // cb(time);
          });
        },
        
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(G.setHeight(8))),
          padding: EdgeInsets.only(
              left: G.setWidth(20),
              top: G.setHeight(10),
              bottom: G.setHeight(10)),
          child: Row(children: [
            Text(
              formatDate(value, [yyyy, '-', mm, '-', dd]), 
              style: TextStyle(color: hex('#424242'))
            ),
            Icon(Icons.arrow_drop_down, color: hex('#CCCCCC'))
          ]),
        ));
  }
}
