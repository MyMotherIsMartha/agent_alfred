import 'package:flutter_picker/flutter_picker.dart';
import 'package:flutter/material.dart';

class AreaModle extends StatefulWidget {
  @override
  _AreaModleState createState() => _AreaModleState();
}

class _AreaModleState extends State<AreaModle> {
  List<PickerItem> provinceTreeData = <PickerItem<String>>[];

  formatData() {
    List provinceData = [
      {
        "areaId": "130000",
        "areaType": 2,
        "areaName": "河北省",
        "parentAreaId": "1",
        "zip": null,
        "childAreas": [
          {
            "areaId": "130200",
            "areaType": 3,
            "areaName": "唐山市",
            "parentAreaId": "130000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "130227",
                "areaType": 4,
                "areaName": "迁西县",
                "parentAreaId": "130200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130281",
                "areaType": 4,
                "areaName": "遵化市",
                "parentAreaId": "130200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130283",
                "areaType": 4,
                "areaName": "迁安市",
                "parentAreaId": "130200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130284",
                "areaType": 4,
                "areaName": "滦州市",
                "parentAreaId": "130200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130224",
                "areaType": 4,
                "areaName": "滦南县",
                "parentAreaId": "130200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130209",
                "areaType": 4,
                "areaName": "曹妃甸区",
                "parentAreaId": "130200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130225",
                "areaType": 4,
                "areaName": "乐亭县",
                "parentAreaId": "130200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130229",
                "areaType": 4,
                "areaName": "玉田县",
                "parentAreaId": "130200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130202",
                "areaType": 4,
                "areaName": "路南区",
                "parentAreaId": "130200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130207",
                "areaType": 4,
                "areaName": "丰南区",
                "parentAreaId": "130200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130203",
                "areaType": 4,
                "areaName": "路北区",
                "parentAreaId": "130200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130208",
                "areaType": 4,
                "areaName": "丰润区",
                "parentAreaId": "130200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130204",
                "areaType": 4,
                "areaName": "古冶区",
                "parentAreaId": "130200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130205",
                "areaType": 4,
                "areaName": "开平区",
                "parentAreaId": "130200",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "130800",
            "areaType": 3,
            "areaName": "承德市",
            "parentAreaId": "130000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "130828",
                "areaType": 4,
                "areaName": "围场满族蒙古族自治县",
                "parentAreaId": "130800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130826",
                "areaType": 4,
                "areaName": "丰宁满族自治县",
                "parentAreaId": "130800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130825",
                "areaType": 4,
                "areaName": "隆化县",
                "parentAreaId": "130800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130827",
                "areaType": 4,
                "areaName": "宽城满族自治县",
                "parentAreaId": "130800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130804",
                "areaType": 4,
                "areaName": "鹰手营子矿区",
                "parentAreaId": "130800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130822",
                "areaType": 4,
                "areaName": "兴隆县",
                "parentAreaId": "130800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130881",
                "areaType": 4,
                "areaName": "平泉市",
                "parentAreaId": "130800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130824",
                "areaType": 4,
                "areaName": "滦平县",
                "parentAreaId": "130800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130803",
                "areaType": 4,
                "areaName": "双滦区",
                "parentAreaId": "130800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130802",
                "areaType": 4,
                "areaName": "双桥区",
                "parentAreaId": "130800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130821",
                "areaType": 4,
                "areaName": "承德县",
                "parentAreaId": "130800",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "131000",
            "areaType": 3,
            "areaName": "廊坊市",
            "parentAreaId": "130000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "131028",
                "areaType": 4,
                "areaName": "大厂回族自治县",
                "parentAreaId": "131000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "131081",
                "areaType": 4,
                "areaName": "霸州市",
                "parentAreaId": "131000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "131025",
                "areaType": 4,
                "areaName": "大城县",
                "parentAreaId": "131000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "131023",
                "areaType": 4,
                "areaName": "永清县",
                "parentAreaId": "131000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "131022",
                "areaType": 4,
                "areaName": "固安县",
                "parentAreaId": "131000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "131024",
                "areaType": 4,
                "areaName": "香河县",
                "parentAreaId": "131000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "131026",
                "areaType": 4,
                "areaName": "文安县",
                "parentAreaId": "131000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "131082",
                "areaType": 4,
                "areaName": "三河市",
                "parentAreaId": "131000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "131003",
                "areaType": 4,
                "areaName": "广阳区",
                "parentAreaId": "131000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "131002",
                "areaType": 4,
                "areaName": "安次区",
                "parentAreaId": "131000",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "130300",
            "areaType": 3,
            "areaName": "秦皇岛市",
            "parentAreaId": "130000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "130321",
                "areaType": 4,
                "areaName": "青龙满族自治县",
                "parentAreaId": "130300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130324",
                "areaType": 4,
                "areaName": "卢龙县",
                "parentAreaId": "130300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130303",
                "areaType": 4,
                "areaName": "山海关区",
                "parentAreaId": "130300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130304",
                "areaType": 4,
                "areaName": "北戴河区",
                "parentAreaId": "130300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130306",
                "areaType": 4,
                "areaName": "抚宁区",
                "parentAreaId": "130300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130302",
                "areaType": 4,
                "areaName": "海港区",
                "parentAreaId": "130300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130322",
                "areaType": 4,
                "areaName": "昌黎县",
                "parentAreaId": "130300",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "130700",
            "areaType": 3,
            "areaName": "张家口市",
            "parentAreaId": "130000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "130708",
                "areaType": 4,
                "areaName": "万全区",
                "parentAreaId": "130700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130724",
                "areaType": 4,
                "areaName": "沽源县",
                "parentAreaId": "130700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130723",
                "areaType": 4,
                "areaName": "康保县",
                "parentAreaId": "130700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130722",
                "areaType": 4,
                "areaName": "张北县",
                "parentAreaId": "130700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130725",
                "areaType": 4,
                "areaName": "尚义县",
                "parentAreaId": "130700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130706",
                "areaType": 4,
                "areaName": "下花园区",
                "parentAreaId": "130700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130731",
                "areaType": 4,
                "areaName": "涿鹿县",
                "parentAreaId": "130700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130730",
                "areaType": 4,
                "areaName": "怀来县",
                "parentAreaId": "130700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130732",
                "areaType": 4,
                "areaName": "赤城县",
                "parentAreaId": "130700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130709",
                "areaType": 4,
                "areaName": "崇礼区",
                "parentAreaId": "130700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130702",
                "areaType": 4,
                "areaName": "桥东区",
                "parentAreaId": "130700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130705",
                "areaType": 4,
                "areaName": "宣化区",
                "parentAreaId": "130700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130703",
                "areaType": 4,
                "areaName": "桥西区",
                "parentAreaId": "130700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130728",
                "areaType": 4,
                "areaName": "怀安县",
                "parentAreaId": "130700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130726",
                "areaType": 4,
                "areaName": "蔚县",
                "parentAreaId": "130700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130727",
                "areaType": 4,
                "areaName": "阳原县",
                "parentAreaId": "130700",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "130900",
            "areaType": 3,
            "areaName": "沧州市",
            "parentAreaId": "130000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "130982",
                "areaType": 4,
                "areaName": "任丘市",
                "parentAreaId": "130900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130924",
                "areaType": 4,
                "areaName": "海兴县",
                "parentAreaId": "130900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130902",
                "areaType": 4,
                "areaName": "新华区",
                "parentAreaId": "130900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130927",
                "areaType": 4,
                "areaName": "南皮县",
                "parentAreaId": "130900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130929",
                "areaType": 4,
                "areaName": "献县",
                "parentAreaId": "130900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130903",
                "areaType": 4,
                "areaName": "运河区",
                "parentAreaId": "130900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130923",
                "areaType": 4,
                "areaName": "东光县",
                "parentAreaId": "130900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130928",
                "areaType": 4,
                "areaName": "吴桥县",
                "parentAreaId": "130900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130983",
                "areaType": 4,
                "areaName": "黄骅市",
                "parentAreaId": "130900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130922",
                "areaType": 4,
                "areaName": "青县",
                "parentAreaId": "130900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130921",
                "areaType": 4,
                "areaName": "沧县",
                "parentAreaId": "130900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130981",
                "areaType": 4,
                "areaName": "泊头市",
                "parentAreaId": "130900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130984",
                "areaType": 4,
                "areaName": "河间市",
                "parentAreaId": "130900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130926",
                "areaType": 4,
                "areaName": "肃宁县",
                "parentAreaId": "130900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130925",
                "areaType": 4,
                "areaName": "盐山县",
                "parentAreaId": "130900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130930",
                "areaType": 4,
                "areaName": "孟村回族自治县",
                "parentAreaId": "130900",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "130400",
            "areaType": 3,
            "areaName": "邯郸市",
            "parentAreaId": "130000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "130426",
                "areaType": 4,
                "areaName": "涉县",
                "parentAreaId": "130400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130481",
                "areaType": 4,
                "areaName": "武安市",
                "parentAreaId": "130400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130407",
                "areaType": 4,
                "areaName": "肥乡区",
                "parentAreaId": "130400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130406",
                "areaType": 4,
                "areaName": "峰峰矿区",
                "parentAreaId": "130400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130434",
                "areaType": 4,
                "areaName": "魏县",
                "parentAreaId": "130400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130432",
                "areaType": 4,
                "areaName": "广平县",
                "parentAreaId": "130400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130425",
                "areaType": 4,
                "areaName": "大名县",
                "parentAreaId": "130400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130423",
                "areaType": 4,
                "areaName": "临漳县",
                "parentAreaId": "130400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130435",
                "areaType": 4,
                "areaName": "曲周县",
                "parentAreaId": "130400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130431",
                "areaType": 4,
                "areaName": "鸡泽县",
                "parentAreaId": "130400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130408",
                "areaType": 4,
                "areaName": "永年区",
                "parentAreaId": "130400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130427",
                "areaType": 4,
                "areaName": "磁县",
                "parentAreaId": "130400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130403",
                "areaType": 4,
                "areaName": "丛台区",
                "parentAreaId": "130400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130404",
                "areaType": 4,
                "areaName": "复兴区",
                "parentAreaId": "130400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130402",
                "areaType": 4,
                "areaName": "邯山区",
                "parentAreaId": "130400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130424",
                "areaType": 4,
                "areaName": "成安县",
                "parentAreaId": "130400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130433",
                "areaType": 4,
                "areaName": "馆陶县",
                "parentAreaId": "130400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130430",
                "areaType": 4,
                "areaName": "邱县",
                "parentAreaId": "130400",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "130600",
            "areaType": 3,
            "areaName": "保定市",
            "parentAreaId": "130000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "130630",
                "areaType": 4,
                "areaName": "涞源县",
                "parentAreaId": "130600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130626",
                "areaType": 4,
                "areaName": "定兴县",
                "parentAreaId": "130600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130633",
                "areaType": 4,
                "areaName": "易县",
                "parentAreaId": "130600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130609",
                "areaType": 4,
                "areaName": "徐水区",
                "parentAreaId": "130600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130632",
                "areaType": 4,
                "areaName": "安新县",
                "parentAreaId": "130600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130638",
                "areaType": 4,
                "areaName": "雄县",
                "parentAreaId": "130600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130629",
                "areaType": 4,
                "areaName": "容城县",
                "parentAreaId": "130600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130636",
                "areaType": 4,
                "areaName": "顺平县",
                "parentAreaId": "130600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130628",
                "areaType": 4,
                "areaName": "高阳县",
                "parentAreaId": "130600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130602",
                "areaType": 4,
                "areaName": "竞秀区",
                "parentAreaId": "130600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130607",
                "areaType": 4,
                "areaName": "满城区",
                "parentAreaId": "130600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130683",
                "areaType": 4,
                "areaName": "安国市",
                "parentAreaId": "130600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130682",
                "areaType": 4,
                "areaName": "定州市",
                "parentAreaId": "130600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130606",
                "areaType": 4,
                "areaName": "莲池区",
                "parentAreaId": "130600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130623",
                "areaType": 4,
                "areaName": "涞水县",
                "parentAreaId": "130600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130681",
                "areaType": 4,
                "areaName": "涿州市",
                "parentAreaId": "130600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130684",
                "areaType": 4,
                "areaName": "高碑店市",
                "parentAreaId": "130600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130637",
                "areaType": 4,
                "areaName": "博野县",
                "parentAreaId": "130600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130635",
                "areaType": 4,
                "areaName": "蠡县",
                "parentAreaId": "130600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130624",
                "areaType": 4,
                "areaName": "阜平县",
                "parentAreaId": "130600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130631",
                "areaType": 4,
                "areaName": "望都县",
                "parentAreaId": "130600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130608",
                "areaType": 4,
                "areaName": "清苑区",
                "parentAreaId": "130600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130634",
                "areaType": 4,
                "areaName": "曲阳县",
                "parentAreaId": "130600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130627",
                "areaType": 4,
                "areaName": "唐县",
                "parentAreaId": "130600",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "130100",
            "areaType": 3,
            "areaName": "石家庄市",
            "parentAreaId": "130000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "130131",
                "areaType": 4,
                "areaName": "平山县",
                "parentAreaId": "130100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130126",
                "areaType": 4,
                "areaName": "灵寿县",
                "parentAreaId": "130100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130110",
                "areaType": 4,
                "areaName": "鹿泉区",
                "parentAreaId": "130100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130109",
                "areaType": 4,
                "areaName": "藁城区",
                "parentAreaId": "130100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130123",
                "areaType": 4,
                "areaName": "正定县",
                "parentAreaId": "130100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130130",
                "areaType": 4,
                "areaName": "无极县",
                "parentAreaId": "130100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130108",
                "areaType": 4,
                "areaName": "裕华区",
                "parentAreaId": "130100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130132",
                "areaType": 4,
                "areaName": "元氏县",
                "parentAreaId": "130100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130183",
                "areaType": 4,
                "areaName": "晋州市",
                "parentAreaId": "130100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130127",
                "areaType": 4,
                "areaName": "高邑县",
                "parentAreaId": "130100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130129",
                "areaType": 4,
                "areaName": "赞皇县",
                "parentAreaId": "130100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130181",
                "areaType": 4,
                "areaName": "辛集市",
                "parentAreaId": "130100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130184",
                "areaType": 4,
                "areaName": "新乐市",
                "parentAreaId": "130100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130105",
                "areaType": 4,
                "areaName": "新华区",
                "parentAreaId": "130100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130102",
                "areaType": 4,
                "areaName": "长安区",
                "parentAreaId": "130100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130104",
                "areaType": 4,
                "areaName": "桥西区",
                "parentAreaId": "130100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130107",
                "areaType": 4,
                "areaName": "井陉矿区",
                "parentAreaId": "130100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130121",
                "areaType": 4,
                "areaName": "井陉县",
                "parentAreaId": "130100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130128",
                "areaType": 4,
                "areaName": "深泽县",
                "parentAreaId": "130100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130111",
                "areaType": 4,
                "areaName": "栾城区",
                "parentAreaId": "130100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130133",
                "areaType": 4,
                "areaName": "赵县",
                "parentAreaId": "130100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130125",
                "areaType": 4,
                "areaName": "行唐县",
                "parentAreaId": "130100",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "130500",
            "areaType": 3,
            "areaName": "邢台市",
            "parentAreaId": "130000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "130524",
                "areaType": 4,
                "areaName": "柏乡县",
                "parentAreaId": "130500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130522",
                "areaType": 4,
                "areaName": "临城县",
                "parentAreaId": "130500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130527",
                "areaType": 4,
                "areaName": "南和县",
                "parentAreaId": "130500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130523",
                "areaType": 4,
                "areaName": "内丘县",
                "parentAreaId": "130500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130531",
                "areaType": 4,
                "areaName": "广宗县",
                "parentAreaId": "130500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130581",
                "areaType": 4,
                "areaName": "南宫市",
                "parentAreaId": "130500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130532",
                "areaType": 4,
                "areaName": "平乡县",
                "parentAreaId": "130500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130530",
                "areaType": 4,
                "areaName": "新河县",
                "parentAreaId": "130500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130529",
                "areaType": 4,
                "areaName": "巨鹿县",
                "parentAreaId": "130500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130525",
                "areaType": 4,
                "areaName": "隆尧县",
                "parentAreaId": "130500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130534",
                "areaType": 4,
                "areaName": "清河县",
                "parentAreaId": "130500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130582",
                "areaType": 4,
                "areaName": "沙河市",
                "parentAreaId": "130500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130503",
                "areaType": 4,
                "areaName": "桥西区",
                "parentAreaId": "130500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130526",
                "areaType": 4,
                "areaName": "任县",
                "parentAreaId": "130500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130502",
                "areaType": 4,
                "areaName": "桥东区",
                "parentAreaId": "130500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130521",
                "areaType": 4,
                "areaName": "邢台县",
                "parentAreaId": "130500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130533",
                "areaType": 4,
                "areaName": "威县",
                "parentAreaId": "130500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130535",
                "areaType": 4,
                "areaName": "临西县",
                "parentAreaId": "130500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "130528",
                "areaType": 4,
                "areaName": "宁晋县",
                "parentAreaId": "130500",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "131100",
            "areaType": 3,
            "areaName": "衡水市",
            "parentAreaId": "130000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "131122",
                "areaType": 4,
                "areaName": "武邑县",
                "parentAreaId": "131100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "131123",
                "areaType": 4,
                "areaName": "武强县",
                "parentAreaId": "131100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "131102",
                "areaType": 4,
                "areaName": "桃城区",
                "parentAreaId": "131100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "131121",
                "areaType": 4,
                "areaName": "枣强县",
                "parentAreaId": "131100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "131126",
                "areaType": 4,
                "areaName": "故城县",
                "parentAreaId": "131100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "131127",
                "areaType": 4,
                "areaName": "景县",
                "parentAreaId": "131100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "131182",
                "areaType": 4,
                "areaName": "深州市",
                "parentAreaId": "131100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "131128",
                "areaType": 4,
                "areaName": "阜城县",
                "parentAreaId": "131100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "131124",
                "areaType": 4,
                "areaName": "饶阳县",
                "parentAreaId": "131100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "131125",
                "areaType": 4,
                "areaName": "安平县",
                "parentAreaId": "131100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "131103",
                "areaType": 4,
                "areaName": "冀州区",
                "parentAreaId": "131100",
                "zip": null,
                "childAreas": null
              }
            ]
          }
        ]
      },
      {
        "areaId": "140000",
        "areaType": 2,
        "areaName": "山西省",
        "parentAreaId": "1",
        "zip": null,
        "childAreas": [
          {
            "areaId": "140300",
            "areaType": 3,
            "areaName": "阳泉市",
            "parentAreaId": "140000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "140321",
                "areaType": 4,
                "areaName": "平定县",
                "parentAreaId": "140300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140311",
                "areaType": 4,
                "areaName": "郊区",
                "parentAreaId": "140300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140303",
                "areaType": 4,
                "areaName": "矿区",
                "parentAreaId": "140300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140302",
                "areaType": 4,
                "areaName": "城区",
                "parentAreaId": "140300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140322",
                "areaType": 4,
                "areaName": "盂县",
                "parentAreaId": "140300",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "140100",
            "areaType": 3,
            "areaName": "太原市",
            "parentAreaId": "140000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "140110",
                "areaType": 4,
                "areaName": "晋源区",
                "parentAreaId": "140100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140123",
                "areaType": 4,
                "areaName": "娄烦县",
                "parentAreaId": "140100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140109",
                "areaType": 4,
                "areaName": "万柏林区",
                "parentAreaId": "140100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140107",
                "areaType": 4,
                "areaName": "杏花岭区",
                "parentAreaId": "140100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140108",
                "areaType": 4,
                "areaName": "尖草坪区",
                "parentAreaId": "140100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140105",
                "areaType": 4,
                "areaName": "小店区",
                "parentAreaId": "140100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140122",
                "areaType": 4,
                "areaName": "阳曲县",
                "parentAreaId": "140100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140106",
                "areaType": 4,
                "areaName": "迎泽区",
                "parentAreaId": "140100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140121",
                "areaType": 4,
                "areaName": "清徐县",
                "parentAreaId": "140100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140181",
                "areaType": 4,
                "areaName": "古交市",
                "parentAreaId": "140100",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "141000",
            "areaType": 3,
            "areaName": "临汾市",
            "parentAreaId": "140000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "141030",
                "areaType": 4,
                "areaName": "大宁县",
                "parentAreaId": "141000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "141031",
                "areaType": 4,
                "areaName": "隰县",
                "parentAreaId": "141000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "141025",
                "areaType": 4,
                "areaName": "古县",
                "parentAreaId": "141000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "141028",
                "areaType": 4,
                "areaName": "吉县",
                "parentAreaId": "141000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "141024",
                "areaType": 4,
                "areaName": "洪洞县",
                "parentAreaId": "141000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "141026",
                "areaType": 4,
                "areaName": "安泽县",
                "parentAreaId": "141000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "141002",
                "areaType": 4,
                "areaName": "尧都区",
                "parentAreaId": "141000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "141034",
                "areaType": 4,
                "areaName": "汾西县",
                "parentAreaId": "141000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "141032",
                "areaType": 4,
                "areaName": "永和县",
                "parentAreaId": "141000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "141021",
                "areaType": 4,
                "areaName": "曲沃县",
                "parentAreaId": "141000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "141082",
                "areaType": 4,
                "areaName": "霍州市",
                "parentAreaId": "141000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "141027",
                "areaType": 4,
                "areaName": "浮山县",
                "parentAreaId": "141000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "141022",
                "areaType": 4,
                "areaName": "翼城县",
                "parentAreaId": "141000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "141029",
                "areaType": 4,
                "areaName": "乡宁县",
                "parentAreaId": "141000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "141023",
                "areaType": 4,
                "areaName": "襄汾县",
                "parentAreaId": "141000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "141081",
                "areaType": 4,
                "areaName": "侯马市",
                "parentAreaId": "141000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "141033",
                "areaType": 4,
                "areaName": "蒲县",
                "parentAreaId": "141000",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "140800",
            "areaType": 3,
            "areaName": "运城市",
            "parentAreaId": "140000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "140821",
                "areaType": 4,
                "areaName": "临猗县",
                "parentAreaId": "140800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140823",
                "areaType": 4,
                "areaName": "闻喜县",
                "parentAreaId": "140800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140828",
                "areaType": 4,
                "areaName": "夏县",
                "parentAreaId": "140800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140802",
                "areaType": 4,
                "areaName": "盐湖区",
                "parentAreaId": "140800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140822",
                "areaType": 4,
                "areaName": "万荣县",
                "parentAreaId": "140800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140830",
                "areaType": 4,
                "areaName": "芮城县",
                "parentAreaId": "140800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140881",
                "areaType": 4,
                "areaName": "永济市",
                "parentAreaId": "140800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140829",
                "areaType": 4,
                "areaName": "平陆县",
                "parentAreaId": "140800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140827",
                "areaType": 4,
                "areaName": "垣曲县",
                "parentAreaId": "140800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140826",
                "areaType": 4,
                "areaName": "绛县",
                "parentAreaId": "140800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140825",
                "areaType": 4,
                "areaName": "新绛县",
                "parentAreaId": "140800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140824",
                "areaType": 4,
                "areaName": "稷山县",
                "parentAreaId": "140800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140882",
                "areaType": 4,
                "areaName": "河津市",
                "parentAreaId": "140800",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "140400",
            "areaType": 3,
            "areaName": "长治市",
            "parentAreaId": "140000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "140426",
                "areaType": 4,
                "areaName": "黎城县",
                "parentAreaId": "140400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140405",
                "areaType": 4,
                "areaName": "屯留区",
                "parentAreaId": "140400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140406",
                "areaType": 4,
                "areaName": "潞城区",
                "parentAreaId": "140400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140428",
                "areaType": 4,
                "areaName": "长子县",
                "parentAreaId": "140400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140427",
                "areaType": 4,
                "areaName": "壶关县",
                "parentAreaId": "140400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140404",
                "areaType": 4,
                "areaName": "上党区",
                "parentAreaId": "140400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140431",
                "areaType": 4,
                "areaName": "沁源县",
                "parentAreaId": "140400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140425",
                "areaType": 4,
                "areaName": "平顺县",
                "parentAreaId": "140400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140423",
                "areaType": 4,
                "areaName": "襄垣县",
                "parentAreaId": "140400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140403",
                "areaType": 4,
                "areaName": "潞州区",
                "parentAreaId": "140400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140430",
                "areaType": 4,
                "areaName": "沁县",
                "parentAreaId": "140400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140429",
                "areaType": 4,
                "areaName": "武乡县",
                "parentAreaId": "140400",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "140900",
            "areaType": 3,
            "areaName": "忻州市",
            "parentAreaId": "140000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "140922",
                "areaType": 4,
                "areaName": "五台县",
                "parentAreaId": "140900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140926",
                "areaType": 4,
                "areaName": "静乐县",
                "parentAreaId": "140900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140921",
                "areaType": 4,
                "areaName": "定襄县",
                "parentAreaId": "140900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140923",
                "areaType": 4,
                "areaName": "代县",
                "parentAreaId": "140900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140925",
                "areaType": 4,
                "areaName": "宁武县",
                "parentAreaId": "140900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140928",
                "areaType": 4,
                "areaName": "五寨县",
                "parentAreaId": "140900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140930",
                "areaType": 4,
                "areaName": "河曲县",
                "parentAreaId": "140900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140932",
                "areaType": 4,
                "areaName": "偏关县",
                "parentAreaId": "140900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140981",
                "areaType": 4,
                "areaName": "原平市",
                "parentAreaId": "140900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140902",
                "areaType": 4,
                "areaName": "忻府区",
                "parentAreaId": "140900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140929",
                "areaType": 4,
                "areaName": "岢岚县",
                "parentAreaId": "140900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140924",
                "areaType": 4,
                "areaName": "繁峙县",
                "parentAreaId": "140900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140927",
                "areaType": 4,
                "areaName": "神池县",
                "parentAreaId": "140900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140931",
                "areaType": 4,
                "areaName": "保德县",
                "parentAreaId": "140900",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "140600",
            "areaType": 3,
            "areaName": "朔州市",
            "parentAreaId": "140000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "140623",
                "areaType": 4,
                "areaName": "右玉县",
                "parentAreaId": "140600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140603",
                "areaType": 4,
                "areaName": "平鲁区",
                "parentAreaId": "140600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140621",
                "areaType": 4,
                "areaName": "山阴县",
                "parentAreaId": "140600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140681",
                "areaType": 4,
                "areaName": "怀仁市",
                "parentAreaId": "140600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140602",
                "areaType": 4,
                "areaName": "朔城区",
                "parentAreaId": "140600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140622",
                "areaType": 4,
                "areaName": "应县",
                "parentAreaId": "140600",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "140500",
            "areaType": 3,
            "areaName": "晋城市",
            "parentAreaId": "140000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "140502",
                "areaType": 4,
                "areaName": "城区",
                "parentAreaId": "140500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140581",
                "areaType": 4,
                "areaName": "高平市",
                "parentAreaId": "140500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140525",
                "areaType": 4,
                "areaName": "泽州县",
                "parentAreaId": "140500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140524",
                "areaType": 4,
                "areaName": "陵川县",
                "parentAreaId": "140500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140521",
                "areaType": 4,
                "areaName": "沁水县",
                "parentAreaId": "140500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140522",
                "areaType": 4,
                "areaName": "阳城县",
                "parentAreaId": "140500",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "140700",
            "areaType": 3,
            "areaName": "晋中市",
            "parentAreaId": "140000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "140724",
                "areaType": 4,
                "areaName": "昔阳县",
                "parentAreaId": "140700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140728",
                "areaType": 4,
                "areaName": "平遥县",
                "parentAreaId": "140700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140723",
                "areaType": 4,
                "areaName": "和顺县",
                "parentAreaId": "140700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140725",
                "areaType": 4,
                "areaName": "寿阳县",
                "parentAreaId": "140700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140702",
                "areaType": 4,
                "areaName": "榆次区",
                "parentAreaId": "140700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140721",
                "areaType": 4,
                "areaName": "榆社县",
                "parentAreaId": "140700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140781",
                "areaType": 4,
                "areaName": "介休市",
                "parentAreaId": "140700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140722",
                "areaType": 4,
                "areaName": "左权县",
                "parentAreaId": "140700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140729",
                "areaType": 4,
                "areaName": "灵石县",
                "parentAreaId": "140700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140727",
                "areaType": 4,
                "areaName": "祁县",
                "parentAreaId": "140700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140703",
                "areaType": 4,
                "areaName": "太谷区",
                "parentAreaId": "140700",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "141100",
            "areaType": 3,
            "areaName": "吕梁市",
            "parentAreaId": "140000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "141127",
                "areaType": 4,
                "areaName": "岚县",
                "parentAreaId": "141100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "141124",
                "areaType": 4,
                "areaName": "临县",
                "parentAreaId": "141100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "141128",
                "areaType": 4,
                "areaName": "方山县",
                "parentAreaId": "141100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "141125",
                "areaType": 4,
                "areaName": "柳林县",
                "parentAreaId": "141100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "141102",
                "areaType": 4,
                "areaName": "离石区",
                "parentAreaId": "141100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "141129",
                "areaType": 4,
                "areaName": "中阳县",
                "parentAreaId": "141100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "141130",
                "areaType": 4,
                "areaName": "交口县",
                "parentAreaId": "141100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "141123",
                "areaType": 4,
                "areaName": "兴县",
                "parentAreaId": "141100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "141126",
                "areaType": 4,
                "areaName": "石楼县",
                "parentAreaId": "141100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "141122",
                "areaType": 4,
                "areaName": "交城县",
                "parentAreaId": "141100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "141121",
                "areaType": 4,
                "areaName": "文水县",
                "parentAreaId": "141100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "141182",
                "areaType": 4,
                "areaName": "汾阳市",
                "parentAreaId": "141100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "141181",
                "areaType": 4,
                "areaName": "孝义市",
                "parentAreaId": "141100",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "140200",
            "areaType": 3,
            "areaName": "大同市",
            "parentAreaId": "140000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "140223",
                "areaType": 4,
                "areaName": "广灵县",
                "parentAreaId": "140200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140225",
                "areaType": 4,
                "areaName": "浑源县",
                "parentAreaId": "140200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140224",
                "areaType": 4,
                "areaName": "灵丘县",
                "parentAreaId": "140200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140221",
                "areaType": 4,
                "areaName": "阳高县",
                "parentAreaId": "140200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140212",
                "areaType": 4,
                "areaName": "新荣区",
                "parentAreaId": "140200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140214",
                "areaType": 4,
                "areaName": "云冈区",
                "parentAreaId": "140200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140215",
                "areaType": 4,
                "areaName": "云州区",
                "parentAreaId": "140200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140213",
                "areaType": 4,
                "areaName": "平城区",
                "parentAreaId": "140200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140222",
                "areaType": 4,
                "areaName": "天镇县",
                "parentAreaId": "140200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "140226",
                "areaType": 4,
                "areaName": "左云县",
                "parentAreaId": "140200",
                "zip": null,
                "childAreas": null
              }
            ]
          }
        ]
      },
      {
        "areaId": "210000",
        "areaType": 2,
        "areaName": "辽宁省",
        "parentAreaId": "1",
        "zip": null,
        "childAreas": [
          {
            "areaId": "211400",
            "areaType": 3,
            "areaName": "葫芦岛市",
            "parentAreaId": "210000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "211422",
                "areaType": 4,
                "areaName": "建昌县",
                "parentAreaId": "211400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "211481",
                "areaType": 4,
                "areaName": "兴城市",
                "parentAreaId": "211400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "211403",
                "areaType": 4,
                "areaName": "龙港区",
                "parentAreaId": "211400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "211421",
                "areaType": 4,
                "areaName": "绥中县",
                "parentAreaId": "211400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "211404",
                "areaType": 4,
                "areaName": "南票区",
                "parentAreaId": "211400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "211402",
                "areaType": 4,
                "areaName": "连山区",
                "parentAreaId": "211400",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "210200",
            "areaType": 3,
            "areaName": "大连市",
            "parentAreaId": "210000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "210281",
                "areaType": 4,
                "areaName": "瓦房店市",
                "parentAreaId": "210200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210283",
                "areaType": 4,
                "areaName": "庄河市",
                "parentAreaId": "210200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210214",
                "areaType": 4,
                "areaName": "普兰店区",
                "parentAreaId": "210200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210213",
                "areaType": 4,
                "areaName": "金州区",
                "parentAreaId": "210200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210224",
                "areaType": 4,
                "areaName": "长海县",
                "parentAreaId": "210200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210211",
                "areaType": 4,
                "areaName": "甘井子区",
                "parentAreaId": "210200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210202",
                "areaType": 4,
                "areaName": "中山区",
                "parentAreaId": "210200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210212",
                "areaType": 4,
                "areaName": "旅顺口区",
                "parentAreaId": "210200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210203",
                "areaType": 4,
                "areaName": "西岗区",
                "parentAreaId": "210200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210204",
                "areaType": 4,
                "areaName": "沙河口区",
                "parentAreaId": "210200",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "210600",
            "areaType": 3,
            "areaName": "丹东市",
            "parentAreaId": "210000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "210682",
                "areaType": 4,
                "areaName": "凤城市",
                "parentAreaId": "210600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210604",
                "areaType": 4,
                "areaName": "振安区",
                "parentAreaId": "210600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210681",
                "areaType": 4,
                "areaName": "东港市",
                "parentAreaId": "210600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210603",
                "areaType": 4,
                "areaName": "振兴区",
                "parentAreaId": "210600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210624",
                "areaType": 4,
                "areaName": "宽甸满族自治县",
                "parentAreaId": "210600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210602",
                "areaType": 4,
                "areaName": "元宝区",
                "parentAreaId": "210600",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "210700",
            "areaType": 3,
            "areaName": "锦州市",
            "parentAreaId": "210000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "210726",
                "areaType": 4,
                "areaName": "黑山县",
                "parentAreaId": "210700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210727",
                "areaType": 4,
                "areaName": "义县",
                "parentAreaId": "210700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210711",
                "areaType": 4,
                "areaName": "太和区",
                "parentAreaId": "210700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210781",
                "areaType": 4,
                "areaName": "凌海市",
                "parentAreaId": "210700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210782",
                "areaType": 4,
                "areaName": "北镇市",
                "parentAreaId": "210700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210703",
                "areaType": 4,
                "areaName": "凌河区",
                "parentAreaId": "210700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210702",
                "areaType": 4,
                "areaName": "古塔区",
                "parentAreaId": "210700",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "210400",
            "areaType": 3,
            "areaName": "抚顺市",
            "parentAreaId": "210000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "210423",
                "areaType": 4,
                "areaName": "清原满族自治县",
                "parentAreaId": "210400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210422",
                "areaType": 4,
                "areaName": "新宾满族自治县",
                "parentAreaId": "210400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210421",
                "areaType": 4,
                "areaName": "抚顺县",
                "parentAreaId": "210400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210403",
                "areaType": 4,
                "areaName": "东洲区",
                "parentAreaId": "210400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210402",
                "areaType": 4,
                "areaName": "新抚区",
                "parentAreaId": "210400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210404",
                "areaType": 4,
                "areaName": "望花区",
                "parentAreaId": "210400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210411",
                "areaType": 4,
                "areaName": "顺城区",
                "parentAreaId": "210400",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "210100",
            "areaType": 3,
            "areaName": "沈阳市",
            "parentAreaId": "210000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "210181",
                "areaType": 4,
                "areaName": "新民市",
                "parentAreaId": "210100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210105",
                "areaType": 4,
                "areaName": "皇姑区",
                "parentAreaId": "210100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210102",
                "areaType": 4,
                "areaName": "和平区",
                "parentAreaId": "210100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210114",
                "areaType": 4,
                "areaName": "于洪区",
                "parentAreaId": "210100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210111",
                "areaType": 4,
                "areaName": "苏家屯区",
                "parentAreaId": "210100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210123",
                "areaType": 4,
                "areaName": "康平县",
                "parentAreaId": "210100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210124",
                "areaType": 4,
                "areaName": "法库县",
                "parentAreaId": "210100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210104",
                "areaType": 4,
                "areaName": "大东区",
                "parentAreaId": "210100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210103",
                "areaType": 4,
                "areaName": "沈河区",
                "parentAreaId": "210100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210106",
                "areaType": 4,
                "areaName": "铁西区",
                "parentAreaId": "210100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210115",
                "areaType": 4,
                "areaName": "辽中区",
                "parentAreaId": "210100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210113",
                "areaType": 4,
                "areaName": "沈北新区",
                "parentAreaId": "210100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210112",
                "areaType": 4,
                "areaName": "浑南区",
                "parentAreaId": "210100",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "211200",
            "areaType": 3,
            "areaName": "铁岭市",
            "parentAreaId": "210000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "211282",
                "areaType": 4,
                "areaName": "开原市",
                "parentAreaId": "211200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "211204",
                "areaType": 4,
                "areaName": "清河区",
                "parentAreaId": "211200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "211281",
                "areaType": 4,
                "areaName": "调兵山市",
                "parentAreaId": "211200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "211221",
                "areaType": 4,
                "areaName": "铁岭县",
                "parentAreaId": "211200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "211202",
                "areaType": 4,
                "areaName": "银州区",
                "parentAreaId": "211200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "211223",
                "areaType": 4,
                "areaName": "西丰县",
                "parentAreaId": "211200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "211224",
                "areaType": 4,
                "areaName": "昌图县",
                "parentAreaId": "211200",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "210800",
            "areaType": 3,
            "areaName": "营口市",
            "parentAreaId": "210000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "210804",
                "areaType": 4,
                "areaName": "鲅鱼圈区",
                "parentAreaId": "210800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210882",
                "areaType": 4,
                "areaName": "大石桥市",
                "parentAreaId": "210800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210803",
                "areaType": 4,
                "areaName": "西市区",
                "parentAreaId": "210800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210881",
                "areaType": 4,
                "areaName": "盖州市",
                "parentAreaId": "210800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210811",
                "areaType": 4,
                "areaName": "老边区",
                "parentAreaId": "210800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210802",
                "areaType": 4,
                "areaName": "站前区",
                "parentAreaId": "210800",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "211100",
            "areaType": 3,
            "areaName": "盘锦市",
            "parentAreaId": "210000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "211104",
                "areaType": 4,
                "areaName": "大洼区",
                "parentAreaId": "211100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "211122",
                "areaType": 4,
                "areaName": "盘山县",
                "parentAreaId": "211100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "211103",
                "areaType": 4,
                "areaName": "兴隆台区",
                "parentAreaId": "211100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "211102",
                "areaType": 4,
                "areaName": "双台子区",
                "parentAreaId": "211100",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "210900",
            "areaType": 3,
            "areaName": "阜新市",
            "parentAreaId": "210000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "210904",
                "areaType": 4,
                "areaName": "太平区",
                "parentAreaId": "210900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210905",
                "areaType": 4,
                "areaName": "清河门区",
                "parentAreaId": "210900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210921",
                "areaType": 4,
                "areaName": "阜新蒙古族自治县",
                "parentAreaId": "210900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210903",
                "areaType": 4,
                "areaName": "新邱区",
                "parentAreaId": "210900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210922",
                "areaType": 4,
                "areaName": "彰武县",
                "parentAreaId": "210900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210911",
                "areaType": 4,
                "areaName": "细河区",
                "parentAreaId": "210900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210902",
                "areaType": 4,
                "areaName": "海州区",
                "parentAreaId": "210900",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "210500",
            "areaType": 3,
            "areaName": "本溪市",
            "parentAreaId": "210000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "210522",
                "areaType": 4,
                "areaName": "桓仁满族自治县",
                "parentAreaId": "210500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210503",
                "areaType": 4,
                "areaName": "溪湖区",
                "parentAreaId": "210500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210505",
                "areaType": 4,
                "areaName": "南芬区",
                "parentAreaId": "210500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210502",
                "areaType": 4,
                "areaName": "平山区",
                "parentAreaId": "210500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210504",
                "areaType": 4,
                "areaName": "明山区",
                "parentAreaId": "210500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210521",
                "areaType": 4,
                "areaName": "本溪满族自治县",
                "parentAreaId": "210500",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "211000",
            "areaType": 3,
            "areaName": "辽阳市",
            "parentAreaId": "210000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "211011",
                "areaType": 4,
                "areaName": "太子河区",
                "parentAreaId": "211000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "211021",
                "areaType": 4,
                "areaName": "辽阳县",
                "parentAreaId": "211000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "211002",
                "areaType": 4,
                "areaName": "白塔区",
                "parentAreaId": "211000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "211004",
                "areaType": 4,
                "areaName": "宏伟区",
                "parentAreaId": "211000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "211005",
                "areaType": 4,
                "areaName": "弓长岭区",
                "parentAreaId": "211000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "211081",
                "areaType": 4,
                "areaName": "灯塔市",
                "parentAreaId": "211000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "211003",
                "areaType": 4,
                "areaName": "文圣区",
                "parentAreaId": "211000",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "210300",
            "areaType": 3,
            "areaName": "鞍山市",
            "parentAreaId": "210000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "210321",
                "areaType": 4,
                "areaName": "台安县",
                "parentAreaId": "210300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210323",
                "areaType": 4,
                "areaName": "岫岩满族自治县",
                "parentAreaId": "210300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210311",
                "areaType": 4,
                "areaName": "千山区",
                "parentAreaId": "210300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210302",
                "areaType": 4,
                "areaName": "铁东区",
                "parentAreaId": "210300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210304",
                "areaType": 4,
                "areaName": "立山区",
                "parentAreaId": "210300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210303",
                "areaType": 4,
                "areaName": "铁西区",
                "parentAreaId": "210300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "210381",
                "areaType": 4,
                "areaName": "海城市",
                "parentAreaId": "210300",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "211300",
            "areaType": 3,
            "areaName": "朝阳市",
            "parentAreaId": "210000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "211322",
                "areaType": 4,
                "areaName": "建平县",
                "parentAreaId": "211300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "211381",
                "areaType": 4,
                "areaName": "北票市",
                "parentAreaId": "211300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "211321",
                "areaType": 4,
                "areaName": "朝阳县",
                "parentAreaId": "211300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "211302",
                "areaType": 4,
                "areaName": "双塔区",
                "parentAreaId": "211300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "211303",
                "areaType": 4,
                "areaName": "龙城区",
                "parentAreaId": "211300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "211324",
                "areaType": 4,
                "areaName": "喀喇沁左翼蒙古族自治县",
                "parentAreaId": "211300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "211382",
                "areaType": 4,
                "areaName": "凌源市",
                "parentAreaId": "211300",
                "zip": null,
                "childAreas": null
              }
            ]
          }
        ]
      },
      {
        "areaId": "220000",
        "areaType": 2,
        "areaName": "吉林省",
        "parentAreaId": "1",
        "zip": null,
        "childAreas": [
          {
            "areaId": "220200",
            "areaType": 3,
            "areaName": "吉林市",
            "parentAreaId": "220000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "220283",
                "areaType": 4,
                "areaName": "舒兰市",
                "parentAreaId": "220200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "220204",
                "areaType": 4,
                "areaName": "船营区",
                "parentAreaId": "220200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "220211",
                "areaType": 4,
                "areaName": "丰满区",
                "parentAreaId": "220200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "220282",
                "areaType": 4,
                "areaName": "桦甸市",
                "parentAreaId": "220200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "220281",
                "areaType": 4,
                "areaName": "蛟河市",
                "parentAreaId": "220200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "220203",
                "areaType": 4,
                "areaName": "龙潭区",
                "parentAreaId": "220200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "220202",
                "areaType": 4,
                "areaName": "昌邑区",
                "parentAreaId": "220200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "220221",
                "areaType": 4,
                "areaName": "永吉县",
                "parentAreaId": "220200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "220284",
                "areaType": 4,
                "areaName": "磐石市",
                "parentAreaId": "220200",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "220100",
            "areaType": 3,
            "areaName": "长春市",
            "parentAreaId": "220000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "220183",
                "areaType": 4,
                "areaName": "德惠市",
                "parentAreaId": "220100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "220182",
                "areaType": 4,
                "areaName": "榆树市",
                "parentAreaId": "220100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "220112",
                "areaType": 4,
                "areaName": "双阳区",
                "parentAreaId": "220100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "220122",
                "areaType": 4,
                "areaName": "农安县",
                "parentAreaId": "220100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "220104",
                "areaType": 4,
                "areaName": "朝阳区",
                "parentAreaId": "220100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "220106",
                "areaType": 4,
                "areaName": "绿园区",
                "parentAreaId": "220100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "220103",
                "areaType": 4,
                "areaName": "宽城区",
                "parentAreaId": "220100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "220105",
                "areaType": 4,
                "areaName": "二道区",
                "parentAreaId": "220100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "220113",
                "areaType": 4,
                "areaName": "九台区",
                "parentAreaId": "220100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "220102",
                "areaType": 4,
                "areaName": "南关区",
                "parentAreaId": "220100",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "220800",
            "areaType": 3,
            "areaName": "白城市",
            "parentAreaId": "220000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "220881",
                "areaType": 4,
                "areaName": "洮南市",
                "parentAreaId": "220800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "220882",
                "areaType": 4,
                "areaName": "大安市",
                "parentAreaId": "220800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "220822",
                "areaType": 4,
                "areaName": "通榆县",
                "parentAreaId": "220800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "220821",
                "areaType": 4,
                "areaName": "镇赉县",
                "parentAreaId": "220800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "220802",
                "areaType": 4,
                "areaName": "洮北区",
                "parentAreaId": "220800",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "220700",
            "areaType": 3,
            "areaName": "松原市",
            "parentAreaId": "220000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "220781",
                "areaType": 4,
                "areaName": "扶余市",
                "parentAreaId": "220700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "220702",
                "areaType": 4,
                "areaName": "宁江区",
                "parentAreaId": "220700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "220721",
                "areaType": 4,
                "areaName": "前郭尔罗斯蒙古族自治县",
                "parentAreaId": "220700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "220722",
                "areaType": 4,
                "areaName": "长岭县",
                "parentAreaId": "220700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "220723",
                "areaType": 4,
                "areaName": "乾安县",
                "parentAreaId": "220700",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "220400",
            "areaType": 3,
            "areaName": "辽源市",
            "parentAreaId": "220000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "220403",
                "areaType": 4,
                "areaName": "西安区",
                "parentAreaId": "220400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "220421",
                "areaType": 4,
                "areaName": "东丰县",
                "parentAreaId": "220400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "220422",
                "areaType": 4,
                "areaName": "东辽县",
                "parentAreaId": "220400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "220402",
                "areaType": 4,
                "areaName": "龙山区",
                "parentAreaId": "220400",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "220300",
            "areaType": 3,
            "areaName": "四平市",
            "parentAreaId": "220000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "220303",
                "areaType": 4,
                "areaName": "铁东区",
                "parentAreaId": "220300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "220382",
                "areaType": 4,
                "areaName": "双辽市",
                "parentAreaId": "220300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "220381",
                "areaType": 4,
                "areaName": "公主岭市",
                "parentAreaId": "220300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "220323",
                "areaType": 4,
                "areaName": "伊通满族自治县",
                "parentAreaId": "220300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "220302",
                "areaType": 4,
                "areaName": "铁西区",
                "parentAreaId": "220300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "220322",
                "areaType": 4,
                "areaName": "梨树县",
                "parentAreaId": "220300",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "222400",
            "areaType": 3,
            "areaName": "延边朝鲜族自治州",
            "parentAreaId": "220000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "222403",
                "areaType": 4,
                "areaName": "敦化市",
                "parentAreaId": "222400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "222404",
                "areaType": 4,
                "areaName": "珲春市",
                "parentAreaId": "222400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "222402",
                "areaType": 4,
                "areaName": "图们市",
                "parentAreaId": "222400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "222406",
                "areaType": 4,
                "areaName": "和龙市",
                "parentAreaId": "222400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "222424",
                "areaType": 4,
                "areaName": "汪清县",
                "parentAreaId": "222400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "222401",
                "areaType": 4,
                "areaName": "延吉市",
                "parentAreaId": "222400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "222426",
                "areaType": 4,
                "areaName": "安图县",
                "parentAreaId": "222400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "222405",
                "areaType": 4,
                "areaName": "龙井市",
                "parentAreaId": "222400",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "220600",
            "areaType": 3,
            "areaName": "白山市",
            "parentAreaId": "220000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "220622",
                "areaType": 4,
                "areaName": "靖宇县",
                "parentAreaId": "220600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "220605",
                "areaType": 4,
                "areaName": "江源区",
                "parentAreaId": "220600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "220623",
                "areaType": 4,
                "areaName": "长白朝鲜族自治县",
                "parentAreaId": "220600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "220621",
                "areaType": 4,
                "areaName": "抚松县",
                "parentAreaId": "220600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "220602",
                "areaType": 4,
                "areaName": "浑江区",
                "parentAreaId": "220600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "220681",
                "areaType": 4,
                "areaName": "临江市",
                "parentAreaId": "220600",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "220500",
            "areaType": 3,
            "areaName": "通化市",
            "parentAreaId": "220000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "220502",
                "areaType": 4,
                "areaName": "东昌区",
                "parentAreaId": "220500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "220521",
                "areaType": 4,
                "areaName": "通化县",
                "parentAreaId": "220500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "220524",
                "areaType": 4,
                "areaName": "柳河县",
                "parentAreaId": "220500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "220503",
                "areaType": 4,
                "areaName": "二道江区",
                "parentAreaId": "220500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "220581",
                "areaType": 4,
                "areaName": "梅河口市",
                "parentAreaId": "220500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "220523",
                "areaType": 4,
                "areaName": "辉南县",
                "parentAreaId": "220500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "220582",
                "areaType": 4,
                "areaName": "集安市",
                "parentAreaId": "220500",
                "zip": null,
                "childAreas": null
              }
            ]
          }
        ]
      },
      {
        "areaId": "230000",
        "areaType": 2,
        "areaName": "黑龙江省",
        "parentAreaId": "1",
        "zip": null,
        "childAreas": [
          {
            "areaId": "232700",
            "areaType": 3,
            "areaName": "大兴安岭地区",
            "parentAreaId": "230000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "232701",
                "areaType": 4,
                "areaName": "漠河市",
                "parentAreaId": "232700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "232722",
                "areaType": 4,
                "areaName": "塔河县",
                "parentAreaId": "232700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "232721",
                "areaType": 4,
                "areaName": "呼玛县",
                "parentAreaId": "232700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "232718",
                "areaType": 4,
                "areaName": "加格达奇区",
                "parentAreaId": "232700",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "230900",
            "areaType": 3,
            "areaName": "七台河市",
            "parentAreaId": "230000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "230903",
                "areaType": 4,
                "areaName": "桃山区",
                "parentAreaId": "230900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230921",
                "areaType": 4,
                "areaName": "勃利县",
                "parentAreaId": "230900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230904",
                "areaType": 4,
                "areaName": "茄子河区",
                "parentAreaId": "230900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230902",
                "areaType": 4,
                "areaName": "新兴区",
                "parentAreaId": "230900",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "230400",
            "areaType": 3,
            "areaName": "鹤岗市",
            "parentAreaId": "230000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "230422",
                "areaType": 4,
                "areaName": "绥滨县",
                "parentAreaId": "230400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230403",
                "areaType": 4,
                "areaName": "工农区",
                "parentAreaId": "230400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230402",
                "areaType": 4,
                "areaName": "向阳区",
                "parentAreaId": "230400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230407",
                "areaType": 4,
                "areaName": "兴山区",
                "parentAreaId": "230400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230404",
                "areaType": 4,
                "areaName": "南山区",
                "parentAreaId": "230400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230405",
                "areaType": 4,
                "areaName": "兴安区",
                "parentAreaId": "230400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230406",
                "areaType": 4,
                "areaName": "东山区",
                "parentAreaId": "230400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230421",
                "areaType": 4,
                "areaName": "萝北县",
                "parentAreaId": "230400",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "230700",
            "areaType": 3,
            "areaName": "伊春市",
            "parentAreaId": "230000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "230722",
                "areaType": 4,
                "areaName": "嘉荫县",
                "parentAreaId": "230700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230726",
                "areaType": 4,
                "areaName": "南岔县",
                "parentAreaId": "230700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230723",
                "areaType": 4,
                "areaName": "汤旺县",
                "parentAreaId": "230700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230717",
                "areaType": 4,
                "areaName": "伊美区",
                "parentAreaId": "230700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230718",
                "areaType": 4,
                "areaName": "乌翠区",
                "parentAreaId": "230700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230724",
                "areaType": 4,
                "areaName": "丰林县",
                "parentAreaId": "230700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230751",
                "areaType": 4,
                "areaName": "金林区",
                "parentAreaId": "230700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230719",
                "areaType": 4,
                "areaName": "友好区",
                "parentAreaId": "230700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230781",
                "areaType": 4,
                "areaName": "铁力市",
                "parentAreaId": "230700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230725",
                "areaType": 4,
                "areaName": "大箐山县",
                "parentAreaId": "230700",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "231200",
            "areaType": 3,
            "areaName": "绥化市",
            "parentAreaId": "230000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "231226",
                "areaType": 4,
                "areaName": "绥棱县",
                "parentAreaId": "231200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "231283",
                "areaType": 4,
                "areaName": "海伦市",
                "parentAreaId": "231200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "231224",
                "areaType": 4,
                "areaName": "庆安县",
                "parentAreaId": "231200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "231202",
                "areaType": 4,
                "areaName": "北林区",
                "parentAreaId": "231200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "231221",
                "areaType": 4,
                "areaName": "望奎县",
                "parentAreaId": "231200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "231223",
                "areaType": 4,
                "areaName": "青冈县",
                "parentAreaId": "231200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "231225",
                "areaType": 4,
                "areaName": "明水县",
                "parentAreaId": "231200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "231222",
                "areaType": 4,
                "areaName": "兰西县",
                "parentAreaId": "231200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "231282",
                "areaType": 4,
                "areaName": "肇东市",
                "parentAreaId": "231200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "231281",
                "areaType": 4,
                "areaName": "安达市",
                "parentAreaId": "231200",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "230100",
            "areaType": 3,
            "areaName": "哈尔滨市",
            "parentAreaId": "230000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "230126",
                "areaType": 4,
                "areaName": "巴彦县",
                "parentAreaId": "230100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230123",
                "areaType": 4,
                "areaName": "依兰县",
                "parentAreaId": "230100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230128",
                "areaType": 4,
                "areaName": "通河县",
                "parentAreaId": "230100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230127",
                "areaType": 4,
                "areaName": "木兰县",
                "parentAreaId": "230100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230124",
                "areaType": 4,
                "areaName": "方正县",
                "parentAreaId": "230100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230125",
                "areaType": 4,
                "areaName": "宾县",
                "parentAreaId": "230100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230129",
                "areaType": 4,
                "areaName": "延寿县",
                "parentAreaId": "230100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230113",
                "areaType": 4,
                "areaName": "双城区",
                "parentAreaId": "230100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230108",
                "areaType": 4,
                "areaName": "平房区",
                "parentAreaId": "230100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230183",
                "areaType": 4,
                "areaName": "尚志市",
                "parentAreaId": "230100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230110",
                "areaType": 4,
                "areaName": "香坊区",
                "parentAreaId": "230100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230102",
                "areaType": 4,
                "areaName": "道里区",
                "parentAreaId": "230100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230184",
                "areaType": 4,
                "areaName": "五常市",
                "parentAreaId": "230100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230112",
                "areaType": 4,
                "areaName": "阿城区",
                "parentAreaId": "230100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230111",
                "areaType": 4,
                "areaName": "呼兰区",
                "parentAreaId": "230100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230109",
                "areaType": 4,
                "areaName": "松北区",
                "parentAreaId": "230100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230104",
                "areaType": 4,
                "areaName": "道外区",
                "parentAreaId": "230100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230103",
                "areaType": 4,
                "areaName": "南岗区",
                "parentAreaId": "230100",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "231100",
            "areaType": 3,
            "areaName": "黑河市",
            "parentAreaId": "230000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "231102",
                "areaType": 4,
                "areaName": "爱辉区",
                "parentAreaId": "231100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "231183",
                "areaType": 4,
                "areaName": "嫩江市",
                "parentAreaId": "231100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "231181",
                "areaType": 4,
                "areaName": "北安市",
                "parentAreaId": "231100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "231124",
                "areaType": 4,
                "areaName": "孙吴县",
                "parentAreaId": "231100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "231123",
                "areaType": 4,
                "areaName": "逊克县",
                "parentAreaId": "231100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "231182",
                "areaType": 4,
                "areaName": "五大连池市",
                "parentAreaId": "231100",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "230200",
            "areaType": 3,
            "areaName": "齐齐哈尔市",
            "parentAreaId": "230000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "230281",
                "areaType": 4,
                "areaName": "讷河市",
                "parentAreaId": "230200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230229",
                "areaType": 4,
                "areaName": "克山县",
                "parentAreaId": "230200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230225",
                "areaType": 4,
                "areaName": "甘南县",
                "parentAreaId": "230200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230230",
                "areaType": 4,
                "areaName": "克东县",
                "parentAreaId": "230200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230223",
                "areaType": 4,
                "areaName": "依安县",
                "parentAreaId": "230200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230227",
                "areaType": 4,
                "areaName": "富裕县",
                "parentAreaId": "230200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230208",
                "areaType": 4,
                "areaName": "梅里斯达斡尔族区",
                "parentAreaId": "230200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230207",
                "areaType": 4,
                "areaName": "碾子山区",
                "parentAreaId": "230200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230221",
                "areaType": 4,
                "areaName": "龙江县",
                "parentAreaId": "230200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230203",
                "areaType": 4,
                "areaName": "建华区",
                "parentAreaId": "230200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230204",
                "areaType": 4,
                "areaName": "铁锋区",
                "parentAreaId": "230200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230206",
                "areaType": 4,
                "areaName": "富拉尔基区",
                "parentAreaId": "230200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230202",
                "areaType": 4,
                "areaName": "龙沙区",
                "parentAreaId": "230200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230205",
                "areaType": 4,
                "areaName": "昂昂溪区",
                "parentAreaId": "230200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230224",
                "areaType": 4,
                "areaName": "泰来县",
                "parentAreaId": "230200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230231",
                "areaType": 4,
                "areaName": "拜泉县",
                "parentAreaId": "230200",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "231000",
            "areaType": 3,
            "areaName": "牡丹江市",
            "parentAreaId": "230000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "231004",
                "areaType": 4,
                "areaName": "爱民区",
                "parentAreaId": "231000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "231002",
                "areaType": 4,
                "areaName": "东安区",
                "parentAreaId": "231000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "231081",
                "areaType": 4,
                "areaName": "绥芬河市",
                "parentAreaId": "231000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "231084",
                "areaType": 4,
                "areaName": "宁安市",
                "parentAreaId": "231000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "231086",
                "areaType": 4,
                "areaName": "东宁市",
                "parentAreaId": "231000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "231003",
                "areaType": 4,
                "areaName": "阳明区",
                "parentAreaId": "231000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "231085",
                "areaType": 4,
                "areaName": "穆棱市",
                "parentAreaId": "231000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "231025",
                "areaType": 4,
                "areaName": "林口县",
                "parentAreaId": "231000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "231005",
                "areaType": 4,
                "areaName": "西安区",
                "parentAreaId": "231000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "231083",
                "areaType": 4,
                "areaName": "海林市",
                "parentAreaId": "231000",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "230300",
            "areaType": 3,
            "areaName": "鸡西市",
            "parentAreaId": "230000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "230304",
                "areaType": 4,
                "areaName": "滴道区",
                "parentAreaId": "230300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230302",
                "areaType": 4,
                "areaName": "鸡冠区",
                "parentAreaId": "230300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230305",
                "areaType": 4,
                "areaName": "梨树区",
                "parentAreaId": "230300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230303",
                "areaType": 4,
                "areaName": "恒山区",
                "parentAreaId": "230300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230306",
                "areaType": 4,
                "areaName": "城子河区",
                "parentAreaId": "230300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230307",
                "areaType": 4,
                "areaName": "麻山区",
                "parentAreaId": "230300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230382",
                "areaType": 4,
                "areaName": "密山市",
                "parentAreaId": "230300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230321",
                "areaType": 4,
                "areaName": "鸡东县",
                "parentAreaId": "230300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230381",
                "areaType": 4,
                "areaName": "虎林市",
                "parentAreaId": "230300",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "230600",
            "areaType": 3,
            "areaName": "大庆市",
            "parentAreaId": "230000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "230604",
                "areaType": 4,
                "areaName": "让胡路区",
                "parentAreaId": "230600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230605",
                "areaType": 4,
                "areaName": "红岗区",
                "parentAreaId": "230600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230622",
                "areaType": 4,
                "areaName": "肇源县",
                "parentAreaId": "230600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230606",
                "areaType": 4,
                "areaName": "大同区",
                "parentAreaId": "230600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230624",
                "areaType": 4,
                "areaName": "杜尔伯特蒙古族自治县",
                "parentAreaId": "230600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230623",
                "areaType": 4,
                "areaName": "林甸县",
                "parentAreaId": "230600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230602",
                "areaType": 4,
                "areaName": "萨尔图区",
                "parentAreaId": "230600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230603",
                "areaType": 4,
                "areaName": "龙凤区",
                "parentAreaId": "230600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230621",
                "areaType": 4,
                "areaName": "肇州县",
                "parentAreaId": "230600",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "230500",
            "areaType": 3,
            "areaName": "双鸭山市",
            "parentAreaId": "230000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "230522",
                "areaType": 4,
                "areaName": "友谊县",
                "parentAreaId": "230500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230505",
                "areaType": 4,
                "areaName": "四方台区",
                "parentAreaId": "230500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230502",
                "areaType": 4,
                "areaName": "尖山区",
                "parentAreaId": "230500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230503",
                "areaType": 4,
                "areaName": "岭东区",
                "parentAreaId": "230500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230506",
                "areaType": 4,
                "areaName": "宝山区",
                "parentAreaId": "230500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230523",
                "areaType": 4,
                "areaName": "宝清县",
                "parentAreaId": "230500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230521",
                "areaType": 4,
                "areaName": "集贤县",
                "parentAreaId": "230500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230524",
                "areaType": 4,
                "areaName": "饶河县",
                "parentAreaId": "230500",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "230800",
            "areaType": 3,
            "areaName": "佳木斯市",
            "parentAreaId": "230000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "230881",
                "areaType": 4,
                "areaName": "同江市",
                "parentAreaId": "230800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230826",
                "areaType": 4,
                "areaName": "桦川县",
                "parentAreaId": "230800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230828",
                "areaType": 4,
                "areaName": "汤原县",
                "parentAreaId": "230800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230803",
                "areaType": 4,
                "areaName": "向阳区",
                "parentAreaId": "230800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230805",
                "areaType": 4,
                "areaName": "东风区",
                "parentAreaId": "230800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230804",
                "areaType": 4,
                "areaName": "前进区",
                "parentAreaId": "230800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230811",
                "areaType": 4,
                "areaName": "郊区",
                "parentAreaId": "230800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230883",
                "areaType": 4,
                "areaName": "抚远市",
                "parentAreaId": "230800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230822",
                "areaType": 4,
                "areaName": "桦南县",
                "parentAreaId": "230800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "230882",
                "areaType": 4,
                "areaName": "富锦市",
                "parentAreaId": "230800",
                "zip": null,
                "childAreas": null
              }
            ]
          }
        ]
      },
      {
        "areaId": "320000",
        "areaType": 2,
        "areaName": "江苏省",
        "parentAreaId": "1",
        "zip": null,
        "childAreas": [
          {
            "areaId": "320700",
            "areaType": 3,
            "areaName": "连云港市",
            "parentAreaId": "320000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "320703",
                "areaType": 4,
                "areaName": "连云区",
                "parentAreaId": "320700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320723",
                "areaType": 4,
                "areaName": "灌云县",
                "parentAreaId": "320700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320722",
                "areaType": 4,
                "areaName": "东海县",
                "parentAreaId": "320700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320724",
                "areaType": 4,
                "areaName": "灌南县",
                "parentAreaId": "320700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320706",
                "areaType": 4,
                "areaName": "海州区",
                "parentAreaId": "320700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320707",
                "areaType": 4,
                "areaName": "赣榆区",
                "parentAreaId": "320700",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "321300",
            "areaType": 3,
            "areaName": "宿迁市",
            "parentAreaId": "320000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "321322",
                "areaType": 4,
                "areaName": "沭阳县",
                "parentAreaId": "321300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "321323",
                "areaType": 4,
                "areaName": "泗阳县",
                "parentAreaId": "321300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "321324",
                "areaType": 4,
                "areaName": "泗洪县",
                "parentAreaId": "321300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "321311",
                "areaType": 4,
                "areaName": "宿豫区",
                "parentAreaId": "321300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "321302",
                "areaType": 4,
                "areaName": "宿城区",
                "parentAreaId": "321300",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "320100",
            "areaType": 3,
            "areaName": "南京市",
            "parentAreaId": "320000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "320111",
                "areaType": 4,
                "areaName": "浦口区",
                "parentAreaId": "320100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320115",
                "areaType": 4,
                "areaName": "江宁区",
                "parentAreaId": "320100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320114",
                "areaType": 4,
                "areaName": "雨花台区",
                "parentAreaId": "320100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320117",
                "areaType": 4,
                "areaName": "溧水区",
                "parentAreaId": "320100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320118",
                "areaType": 4,
                "areaName": "高淳区",
                "parentAreaId": "320100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320116",
                "areaType": 4,
                "areaName": "六合区",
                "parentAreaId": "320100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320106",
                "areaType": 4,
                "areaName": "鼓楼区",
                "parentAreaId": "320100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320105",
                "areaType": 4,
                "areaName": "建邺区",
                "parentAreaId": "320100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320104",
                "areaType": 4,
                "areaName": "秦淮区",
                "parentAreaId": "320100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320113",
                "areaType": 4,
                "areaName": "栖霞区",
                "parentAreaId": "320100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320102",
                "areaType": 4,
                "areaName": "玄武区",
                "parentAreaId": "320100",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "320600",
            "areaType": 3,
            "areaName": "南通市",
            "parentAreaId": "320000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "320682",
                "areaType": 4,
                "areaName": "如皋市",
                "parentAreaId": "320600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320684",
                "areaType": 4,
                "areaName": "海门市",
                "parentAreaId": "320600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320623",
                "areaType": 4,
                "areaName": "如东县",
                "parentAreaId": "320600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320681",
                "areaType": 4,
                "areaName": "启东市",
                "parentAreaId": "320600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320685",
                "areaType": 4,
                "areaName": "海安市",
                "parentAreaId": "320600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320612",
                "areaType": 4,
                "areaName": "通州区",
                "parentAreaId": "320600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320602",
                "areaType": 4,
                "areaName": "崇川区",
                "parentAreaId": "320600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320611",
                "areaType": 4,
                "areaName": "港闸区",
                "parentAreaId": "320600",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "320800",
            "areaType": 3,
            "areaName": "淮安市",
            "parentAreaId": "320000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "320804",
                "areaType": 4,
                "areaName": "淮阴区",
                "parentAreaId": "320800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320813",
                "areaType": 4,
                "areaName": "洪泽区",
                "parentAreaId": "320800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320830",
                "areaType": 4,
                "areaName": "盱眙县",
                "parentAreaId": "320800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320831",
                "areaType": 4,
                "areaName": "金湖县",
                "parentAreaId": "320800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320826",
                "areaType": 4,
                "areaName": "涟水县",
                "parentAreaId": "320800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320812",
                "areaType": 4,
                "areaName": "清江浦区",
                "parentAreaId": "320800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320803",
                "areaType": 4,
                "areaName": "淮安区",
                "parentAreaId": "320800",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "320200",
            "areaType": 3,
            "areaName": "无锡市",
            "parentAreaId": "320000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "320213",
                "areaType": 4,
                "areaName": "梁溪区",
                "parentAreaId": "320200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320214",
                "areaType": 4,
                "areaName": "新吴区",
                "parentAreaId": "320200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320206",
                "areaType": 4,
                "areaName": "惠山区",
                "parentAreaId": "320200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320281",
                "areaType": 4,
                "areaName": "江阴市",
                "parentAreaId": "320200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320211",
                "areaType": 4,
                "areaName": "滨湖区",
                "parentAreaId": "320200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320282",
                "areaType": 4,
                "areaName": "宜兴市",
                "parentAreaId": "320200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320205",
                "areaType": 4,
                "areaName": "锡山区",
                "parentAreaId": "320200",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "320400",
            "areaType": 3,
            "areaName": "常州市",
            "parentAreaId": "320000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "320412",
                "areaType": 4,
                "areaName": "武进区",
                "parentAreaId": "320400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320481",
                "areaType": 4,
                "areaName": "溧阳市",
                "parentAreaId": "320400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320411",
                "areaType": 4,
                "areaName": "新北区",
                "parentAreaId": "320400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320413",
                "areaType": 4,
                "areaName": "金坛区",
                "parentAreaId": "320400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320404",
                "areaType": 4,
                "areaName": "钟楼区",
                "parentAreaId": "320400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320402",
                "areaType": 4,
                "areaName": "天宁区",
                "parentAreaId": "320400",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "320300",
            "areaType": 3,
            "areaName": "徐州市",
            "parentAreaId": "320000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "320381",
                "areaType": 4,
                "areaName": "新沂市",
                "parentAreaId": "320300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320312",
                "areaType": 4,
                "areaName": "铜山区",
                "parentAreaId": "320300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320311",
                "areaType": 4,
                "areaName": "泉山区",
                "parentAreaId": "320300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320303",
                "areaType": 4,
                "areaName": "云龙区",
                "parentAreaId": "320300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320305",
                "areaType": 4,
                "areaName": "贾汪区",
                "parentAreaId": "320300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320302",
                "areaType": 4,
                "areaName": "鼓楼区",
                "parentAreaId": "320300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320321",
                "areaType": 4,
                "areaName": "丰县",
                "parentAreaId": "320300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320322",
                "areaType": 4,
                "areaName": "沛县",
                "parentAreaId": "320300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320324",
                "areaType": 4,
                "areaName": "睢宁县",
                "parentAreaId": "320300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320382",
                "areaType": 4,
                "areaName": "邳州市",
                "parentAreaId": "320300",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "321000",
            "areaType": 3,
            "areaName": "扬州市",
            "parentAreaId": "320000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "321003",
                "areaType": 4,
                "areaName": "邗江区",
                "parentAreaId": "321000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "321002",
                "areaType": 4,
                "areaName": "广陵区",
                "parentAreaId": "321000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "321081",
                "areaType": 4,
                "areaName": "仪征市",
                "parentAreaId": "321000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "321023",
                "areaType": 4,
                "areaName": "宝应县",
                "parentAreaId": "321000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "321084",
                "areaType": 4,
                "areaName": "高邮市",
                "parentAreaId": "321000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "321012",
                "areaType": 4,
                "areaName": "江都区",
                "parentAreaId": "321000",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "321200",
            "areaType": 3,
            "areaName": "泰州市",
            "parentAreaId": "320000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "321282",
                "areaType": 4,
                "areaName": "靖江市",
                "parentAreaId": "321200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "321283",
                "areaType": 4,
                "areaName": "泰兴市",
                "parentAreaId": "321200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "321281",
                "areaType": 4,
                "areaName": "兴化市",
                "parentAreaId": "321200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "321204",
                "areaType": 4,
                "areaName": "姜堰区",
                "parentAreaId": "321200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "321203",
                "areaType": 4,
                "areaName": "高港区",
                "parentAreaId": "321200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "321202",
                "areaType": 4,
                "areaName": "海陵区",
                "parentAreaId": "321200",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "320900",
            "areaType": 3,
            "areaName": "盐城市",
            "parentAreaId": "320000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "320922",
                "areaType": 4,
                "areaName": "滨海县",
                "parentAreaId": "320900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320924",
                "areaType": 4,
                "areaName": "射阳县",
                "parentAreaId": "320900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320923",
                "areaType": 4,
                "areaName": "阜宁县",
                "parentAreaId": "320900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320925",
                "areaType": 4,
                "areaName": "建湖县",
                "parentAreaId": "320900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320902",
                "areaType": 4,
                "areaName": "亭湖区",
                "parentAreaId": "320900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320903",
                "areaType": 4,
                "areaName": "盐都区",
                "parentAreaId": "320900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320904",
                "areaType": 4,
                "areaName": "大丰区",
                "parentAreaId": "320900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320981",
                "areaType": 4,
                "areaName": "东台市",
                "parentAreaId": "320900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320921",
                "areaType": 4,
                "areaName": "响水县",
                "parentAreaId": "320900",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "321100",
            "areaType": 3,
            "areaName": "镇江市",
            "parentAreaId": "320000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "321182",
                "areaType": 4,
                "areaName": "扬中市",
                "parentAreaId": "321100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "321111",
                "areaType": 4,
                "areaName": "润州区",
                "parentAreaId": "321100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "321102",
                "areaType": 4,
                "areaName": "京口区",
                "parentAreaId": "321100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "321112",
                "areaType": 4,
                "areaName": "丹徒区",
                "parentAreaId": "321100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "321181",
                "areaType": 4,
                "areaName": "丹阳市",
                "parentAreaId": "321100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "321183",
                "areaType": 4,
                "areaName": "句容市",
                "parentAreaId": "321100",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "320500",
            "areaType": 3,
            "areaName": "苏州市",
            "parentAreaId": "320000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "320582",
                "areaType": 4,
                "areaName": "张家港市",
                "parentAreaId": "320500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320585",
                "areaType": 4,
                "areaName": "太仓市",
                "parentAreaId": "320500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320505",
                "areaType": 4,
                "areaName": "虎丘区",
                "parentAreaId": "320500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320508",
                "areaType": 4,
                "areaName": "姑苏区",
                "parentAreaId": "320500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320509",
                "areaType": 4,
                "areaName": "吴江区",
                "parentAreaId": "320500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320507",
                "areaType": 4,
                "areaName": "相城区",
                "parentAreaId": "320500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320571",
                "areaType": 4,
                "areaName": "苏州工业园区",
                "parentAreaId": "320500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320581",
                "areaType": 4,
                "areaName": "常熟市",
                "parentAreaId": "320500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320506",
                "areaType": 4,
                "areaName": "吴中区",
                "parentAreaId": "320500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "320583",
                "areaType": 4,
                "areaName": "昆山市",
                "parentAreaId": "320500",
                "zip": null,
                "childAreas": null
              }
            ]
          }
        ]
      },
      {
        "areaId": "330000",
        "areaType": 2,
        "areaName": "浙江省",
        "parentAreaId": "1",
        "zip": null,
        "childAreas": [
          {
            "areaId": "330900",
            "areaType": 3,
            "areaName": "舟山市",
            "parentAreaId": "330000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "330922",
                "areaType": 4,
                "areaName": "嵊泗县",
                "parentAreaId": "330900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330921",
                "areaType": 4,
                "areaName": "岱山县",
                "parentAreaId": "330900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330902",
                "areaType": 4,
                "areaName": "定海区",
                "parentAreaId": "330900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330903",
                "areaType": 4,
                "areaName": "普陀区",
                "parentAreaId": "330900",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "330400",
            "areaType": 3,
            "areaName": "嘉兴市",
            "parentAreaId": "330000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "330482",
                "areaType": 4,
                "areaName": "平湖市",
                "parentAreaId": "330400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330402",
                "areaType": 4,
                "areaName": "南湖区",
                "parentAreaId": "330400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330421",
                "areaType": 4,
                "areaName": "嘉善县",
                "parentAreaId": "330400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330424",
                "areaType": 4,
                "areaName": "海盐县",
                "parentAreaId": "330400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330483",
                "areaType": 4,
                "areaName": "桐乡市",
                "parentAreaId": "330400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330481",
                "areaType": 4,
                "areaName": "海宁市",
                "parentAreaId": "330400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330411",
                "areaType": 4,
                "areaName": "秀洲区",
                "parentAreaId": "330400",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "330200",
            "areaType": 3,
            "areaName": "宁波市",
            "parentAreaId": "330000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "330225",
                "areaType": 4,
                "areaName": "象山县",
                "parentAreaId": "330200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330206",
                "areaType": 4,
                "areaName": "北仑区",
                "parentAreaId": "330200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330211",
                "areaType": 4,
                "areaName": "镇海区",
                "parentAreaId": "330200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330205",
                "areaType": 4,
                "areaName": "江北区",
                "parentAreaId": "330200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330213",
                "areaType": 4,
                "areaName": "奉化区",
                "parentAreaId": "330200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330226",
                "areaType": 4,
                "areaName": "宁海县",
                "parentAreaId": "330200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330203",
                "areaType": 4,
                "areaName": "海曙区",
                "parentAreaId": "330200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330212",
                "areaType": 4,
                "areaName": "鄞州区",
                "parentAreaId": "330200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330282",
                "areaType": 4,
                "areaName": "慈溪市",
                "parentAreaId": "330200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330281",
                "areaType": 4,
                "areaName": "余姚市",
                "parentAreaId": "330200",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "331000",
            "areaType": 3,
            "areaName": "台州市",
            "parentAreaId": "330000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "331082",
                "areaType": 4,
                "areaName": "临海市",
                "parentAreaId": "331000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "331002",
                "areaType": 4,
                "areaName": "椒江区",
                "parentAreaId": "331000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "331083",
                "areaType": 4,
                "areaName": "玉环市",
                "parentAreaId": "331000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "331004",
                "areaType": 4,
                "areaName": "路桥区",
                "parentAreaId": "331000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "331081",
                "areaType": 4,
                "areaName": "温岭市",
                "parentAreaId": "331000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "331022",
                "areaType": 4,
                "areaName": "三门县",
                "parentAreaId": "331000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "331023",
                "areaType": 4,
                "areaName": "天台县",
                "parentAreaId": "331000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "331003",
                "areaType": 4,
                "areaName": "黄岩区",
                "parentAreaId": "331000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "331024",
                "areaType": 4,
                "areaName": "仙居县",
                "parentAreaId": "331000",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "330300",
            "areaType": 3,
            "areaName": "温州市",
            "parentAreaId": "330000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "330305",
                "areaType": 4,
                "areaName": "洞头区",
                "parentAreaId": "330300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330327",
                "areaType": 4,
                "areaName": "苍南县",
                "parentAreaId": "330300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330381",
                "areaType": 4,
                "areaName": "瑞安市",
                "parentAreaId": "330300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330326",
                "areaType": 4,
                "areaName": "平阳县",
                "parentAreaId": "330300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330383",
                "areaType": 4,
                "areaName": "龙港市",
                "parentAreaId": "330300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330329",
                "areaType": 4,
                "areaName": "泰顺县",
                "parentAreaId": "330300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330328",
                "areaType": 4,
                "areaName": "文成县",
                "parentAreaId": "330300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330324",
                "areaType": 4,
                "areaName": "永嘉县",
                "parentAreaId": "330300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330382",
                "areaType": 4,
                "areaName": "乐清市",
                "parentAreaId": "330300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330304",
                "areaType": 4,
                "areaName": "瓯海区",
                "parentAreaId": "330300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330302",
                "areaType": 4,
                "areaName": "鹿城区",
                "parentAreaId": "330300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330303",
                "areaType": 4,
                "areaName": "龙湾区",
                "parentAreaId": "330300",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "331100",
            "areaType": 3,
            "areaName": "丽水市",
            "parentAreaId": "330000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "331102",
                "areaType": 4,
                "areaName": "莲都区",
                "parentAreaId": "331100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "331181",
                "areaType": 4,
                "areaName": "龙泉市",
                "parentAreaId": "331100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "331125",
                "areaType": 4,
                "areaName": "云和县",
                "parentAreaId": "331100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "331124",
                "areaType": 4,
                "areaName": "松阳县",
                "parentAreaId": "331100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "331123",
                "areaType": 4,
                "areaName": "遂昌县",
                "parentAreaId": "331100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "331127",
                "areaType": 4,
                "areaName": "景宁畲族自治县",
                "parentAreaId": "331100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "331122",
                "areaType": 4,
                "areaName": "缙云县",
                "parentAreaId": "331100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "331126",
                "areaType": 4,
                "areaName": "庆元县",
                "parentAreaId": "331100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "331121",
                "areaType": 4,
                "areaName": "青田县",
                "parentAreaId": "331100",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "330500",
            "areaType": 3,
            "areaName": "湖州市",
            "parentAreaId": "330000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "330521",
                "areaType": 4,
                "areaName": "德清县",
                "parentAreaId": "330500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330523",
                "areaType": 4,
                "areaName": "安吉县",
                "parentAreaId": "330500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330522",
                "areaType": 4,
                "areaName": "长兴县",
                "parentAreaId": "330500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330502",
                "areaType": 4,
                "areaName": "吴兴区",
                "parentAreaId": "330500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330503",
                "areaType": 4,
                "areaName": "南浔区",
                "parentAreaId": "330500",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "330800",
            "areaType": 3,
            "areaName": "衢州市",
            "parentAreaId": "330000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "330824",
                "areaType": 4,
                "areaName": "开化县",
                "parentAreaId": "330800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330803",
                "areaType": 4,
                "areaName": "衢江区",
                "parentAreaId": "330800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330802",
                "areaType": 4,
                "areaName": "柯城区",
                "parentAreaId": "330800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330822",
                "areaType": 4,
                "areaName": "常山县",
                "parentAreaId": "330800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330881",
                "areaType": 4,
                "areaName": "江山市",
                "parentAreaId": "330800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330825",
                "areaType": 4,
                "areaName": "龙游县",
                "parentAreaId": "330800",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "330700",
            "areaType": 3,
            "areaName": "金华市",
            "parentAreaId": "330000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "330726",
                "areaType": 4,
                "areaName": "浦江县",
                "parentAreaId": "330700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330784",
                "areaType": 4,
                "areaName": "永康市",
                "parentAreaId": "330700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330783",
                "areaType": 4,
                "areaName": "东阳市",
                "parentAreaId": "330700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330723",
                "areaType": 4,
                "areaName": "武义县",
                "parentAreaId": "330700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330781",
                "areaType": 4,
                "areaName": "兰溪市",
                "parentAreaId": "330700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330727",
                "areaType": 4,
                "areaName": "磐安县",
                "parentAreaId": "330700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330782",
                "areaType": 4,
                "areaName": "义乌市",
                "parentAreaId": "330700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330703",
                "areaType": 4,
                "areaName": "金东区",
                "parentAreaId": "330700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330702",
                "areaType": 4,
                "areaName": "婺城区",
                "parentAreaId": "330700",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "330100",
            "areaType": 3,
            "areaName": "杭州市",
            "parentAreaId": "330000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "330106",
                "areaType": 4,
                "areaName": "西湖区",
                "parentAreaId": "330100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330102",
                "areaType": 4,
                "areaName": "上城区",
                "parentAreaId": "330100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330111",
                "areaType": 4,
                "areaName": "富阳区",
                "parentAreaId": "330100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330122",
                "areaType": 4,
                "areaName": "桐庐县",
                "parentAreaId": "330100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330182",
                "areaType": 4,
                "areaName": "建德市",
                "parentAreaId": "330100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330110",
                "areaType": 4,
                "areaName": "余杭区",
                "parentAreaId": "330100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330112",
                "areaType": 4,
                "areaName": "临安区",
                "parentAreaId": "330100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330109",
                "areaType": 4,
                "areaName": "萧山区",
                "parentAreaId": "330100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330108",
                "areaType": 4,
                "areaName": "滨江区",
                "parentAreaId": "330100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330127",
                "areaType": 4,
                "areaName": "淳安县",
                "parentAreaId": "330100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330105",
                "areaType": 4,
                "areaName": "拱墅区",
                "parentAreaId": "330100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330103",
                "areaType": 4,
                "areaName": "下城区",
                "parentAreaId": "330100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330104",
                "areaType": 4,
                "areaName": "江干区",
                "parentAreaId": "330100",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "330600",
            "areaType": 3,
            "areaName": "绍兴市",
            "parentAreaId": "330000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "330683",
                "areaType": 4,
                "areaName": "嵊州市",
                "parentAreaId": "330600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330602",
                "areaType": 4,
                "areaName": "越城区",
                "parentAreaId": "330600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330603",
                "areaType": 4,
                "areaName": "柯桥区",
                "parentAreaId": "330600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330681",
                "areaType": 4,
                "areaName": "诸暨市",
                "parentAreaId": "330600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330624",
                "areaType": 4,
                "areaName": "新昌县",
                "parentAreaId": "330600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "330604",
                "areaType": 4,
                "areaName": "上虞区",
                "parentAreaId": "330600",
                "zip": null,
                "childAreas": null
              }
            ]
          }
        ]
      },
      {
        "areaId": "340000",
        "areaType": 2,
        "areaName": "安徽省",
        "parentAreaId": "1",
        "zip": null,
        "childAreas": [
          {
            "areaId": "340600",
            "areaType": 3,
            "areaName": "淮北市",
            "parentAreaId": "340000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "340602",
                "areaType": 4,
                "areaName": "杜集区",
                "parentAreaId": "340600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340621",
                "areaType": 4,
                "areaName": "濉溪县",
                "parentAreaId": "340600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340604",
                "areaType": 4,
                "areaName": "烈山区",
                "parentAreaId": "340600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340603",
                "areaType": 4,
                "areaName": "相山区",
                "parentAreaId": "340600",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "341200",
            "areaType": 3,
            "areaName": "阜阳市",
            "parentAreaId": "340000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "341222",
                "areaType": 4,
                "areaName": "太和县",
                "parentAreaId": "341200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "341204",
                "areaType": 4,
                "areaName": "颍泉区",
                "parentAreaId": "341200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "341203",
                "areaType": 4,
                "areaName": "颍东区",
                "parentAreaId": "341200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "341202",
                "areaType": 4,
                "areaName": "颍州区",
                "parentAreaId": "341200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "341221",
                "areaType": 4,
                "areaName": "临泉县",
                "parentAreaId": "341200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "341225",
                "areaType": 4,
                "areaName": "阜南县",
                "parentAreaId": "341200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "341226",
                "areaType": 4,
                "areaName": "颍上县",
                "parentAreaId": "341200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "341282",
                "areaType": 4,
                "areaName": "界首市",
                "parentAreaId": "341200",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "340500",
            "areaType": 3,
            "areaName": "马鞍山市",
            "parentAreaId": "340000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "340506",
                "areaType": 4,
                "areaName": "博望区",
                "parentAreaId": "340500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340521",
                "areaType": 4,
                "areaName": "当涂县",
                "parentAreaId": "340500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340504",
                "areaType": 4,
                "areaName": "雨山区",
                "parentAreaId": "340500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340503",
                "areaType": 4,
                "areaName": "花山区",
                "parentAreaId": "340500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340523",
                "areaType": 4,
                "areaName": "和县",
                "parentAreaId": "340500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340522",
                "areaType": 4,
                "areaName": "含山县",
                "parentAreaId": "340500",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "340700",
            "areaType": 3,
            "areaName": "铜陵市",
            "parentAreaId": "340000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "340705",
                "areaType": 4,
                "areaName": "铜官区",
                "parentAreaId": "340700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340711",
                "areaType": 4,
                "areaName": "郊区",
                "parentAreaId": "340700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340706",
                "areaType": 4,
                "areaName": "义安区",
                "parentAreaId": "340700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340722",
                "areaType": 4,
                "areaName": "枞阳县",
                "parentAreaId": "340700",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "341700",
            "areaType": 3,
            "areaName": "池州市",
            "parentAreaId": "340000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "341723",
                "areaType": 4,
                "areaName": "青阳县",
                "parentAreaId": "341700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "341721",
                "areaType": 4,
                "areaName": "东至县",
                "parentAreaId": "341700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "341702",
                "areaType": 4,
                "areaName": "贵池区",
                "parentAreaId": "341700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "341722",
                "areaType": 4,
                "areaName": "石台县",
                "parentAreaId": "341700",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "341600",
            "areaType": 3,
            "areaName": "亳州市",
            "parentAreaId": "340000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "341602",
                "areaType": 4,
                "areaName": "谯城区",
                "parentAreaId": "341600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "341623",
                "areaType": 4,
                "areaName": "利辛县",
                "parentAreaId": "341600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "341621",
                "areaType": 4,
                "areaName": "涡阳县",
                "parentAreaId": "341600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "341622",
                "areaType": 4,
                "areaName": "蒙城县",
                "parentAreaId": "341600",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "341100",
            "areaType": 3,
            "areaName": "滁州市",
            "parentAreaId": "340000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "341182",
                "areaType": 4,
                "areaName": "明光市",
                "parentAreaId": "341100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "341181",
                "areaType": 4,
                "areaName": "天长市",
                "parentAreaId": "341100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "341124",
                "areaType": 4,
                "areaName": "全椒县",
                "parentAreaId": "341100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "341126",
                "areaType": 4,
                "areaName": "凤阳县",
                "parentAreaId": "341100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "341122",
                "areaType": 4,
                "areaName": "来安县",
                "parentAreaId": "341100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "341125",
                "areaType": 4,
                "areaName": "定远县",
                "parentAreaId": "341100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "341103",
                "areaType": 4,
                "areaName": "南谯区",
                "parentAreaId": "341100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "341102",
                "areaType": 4,
                "areaName": "琅琊区",
                "parentAreaId": "341100",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "340800",
            "areaType": 3,
            "areaName": "安庆市",
            "parentAreaId": "340000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "340828",
                "areaType": 4,
                "areaName": "岳西县",
                "parentAreaId": "340800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340825",
                "areaType": 4,
                "areaName": "太湖县",
                "parentAreaId": "340800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340811",
                "areaType": 4,
                "areaName": "宜秀区",
                "parentAreaId": "340800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340882",
                "areaType": 4,
                "areaName": "潜山市",
                "parentAreaId": "340800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340802",
                "areaType": 4,
                "areaName": "迎江区",
                "parentAreaId": "340800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340881",
                "areaType": 4,
                "areaName": "桐城市",
                "parentAreaId": "340800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340827",
                "areaType": 4,
                "areaName": "望江县",
                "parentAreaId": "340800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340826",
                "areaType": 4,
                "areaName": "宿松县",
                "parentAreaId": "340800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340822",
                "areaType": 4,
                "areaName": "怀宁县",
                "parentAreaId": "340800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340803",
                "areaType": 4,
                "areaName": "大观区",
                "parentAreaId": "340800",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "341000",
            "areaType": 3,
            "areaName": "黄山市",
            "parentAreaId": "340000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "341003",
                "areaType": 4,
                "areaName": "黄山区",
                "parentAreaId": "341000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "341023",
                "areaType": 4,
                "areaName": "黟县",
                "parentAreaId": "341000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "341024",
                "areaType": 4,
                "areaName": "祁门县",
                "parentAreaId": "341000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "341021",
                "areaType": 4,
                "areaName": "歙县",
                "parentAreaId": "341000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "341022",
                "areaType": 4,
                "areaName": "休宁县",
                "parentAreaId": "341000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "341004",
                "areaType": 4,
                "areaName": "徽州区",
                "parentAreaId": "341000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "341002",
                "areaType": 4,
                "areaName": "屯溪区",
                "parentAreaId": "341000",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "341800",
            "areaType": 3,
            "areaName": "宣城市",
            "parentAreaId": "340000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "341882",
                "areaType": 4,
                "areaName": "广德市",
                "parentAreaId": "341800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "341823",
                "areaType": 4,
                "areaName": "泾县",
                "parentAreaId": "341800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "341825",
                "areaType": 4,
                "areaName": "旌德县",
                "parentAreaId": "341800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "341824",
                "areaType": 4,
                "areaName": "绩溪县",
                "parentAreaId": "341800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "341802",
                "areaType": 4,
                "areaName": "宣州区",
                "parentAreaId": "341800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "341881",
                "areaType": 4,
                "areaName": "宁国市",
                "parentAreaId": "341800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "341821",
                "areaType": 4,
                "areaName": "郎溪县",
                "parentAreaId": "341800",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "340200",
            "areaType": 3,
            "areaName": "芜湖市",
            "parentAreaId": "340000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "340222",
                "areaType": 4,
                "areaName": "繁昌县",
                "parentAreaId": "340200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340203",
                "areaType": 4,
                "areaName": "弋江区",
                "parentAreaId": "340200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340202",
                "areaType": 4,
                "areaName": "镜湖区",
                "parentAreaId": "340200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340281",
                "areaType": 4,
                "areaName": "无为市",
                "parentAreaId": "340200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340223",
                "areaType": 4,
                "areaName": "南陵县",
                "parentAreaId": "340200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340208",
                "areaType": 4,
                "areaName": "三山区",
                "parentAreaId": "340200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340207",
                "areaType": 4,
                "areaName": "鸠江区",
                "parentAreaId": "340200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340221",
                "areaType": 4,
                "areaName": "芜湖县",
                "parentAreaId": "340200",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "341500",
            "areaType": 3,
            "areaName": "六安市",
            "parentAreaId": "340000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "341525",
                "areaType": 4,
                "areaName": "霍山县",
                "parentAreaId": "341500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "341503",
                "areaType": 4,
                "areaName": "裕安区",
                "parentAreaId": "341500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "341524",
                "areaType": 4,
                "areaName": "金寨县",
                "parentAreaId": "341500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "341502",
                "areaType": 4,
                "areaName": "金安区",
                "parentAreaId": "341500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "341522",
                "areaType": 4,
                "areaName": "霍邱县",
                "parentAreaId": "341500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "341504",
                "areaType": 4,
                "areaName": "叶集区",
                "parentAreaId": "341500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "341523",
                "areaType": 4,
                "areaName": "舒城县",
                "parentAreaId": "341500",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "340100",
            "areaType": 3,
            "areaName": "合肥市",
            "parentAreaId": "340000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "340124",
                "areaType": 4,
                "areaName": "庐江县",
                "parentAreaId": "340100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340111",
                "areaType": 4,
                "areaName": "包河区",
                "parentAreaId": "340100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340181",
                "areaType": 4,
                "areaName": "巢湖市",
                "parentAreaId": "340100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340123",
                "areaType": 4,
                "areaName": "肥西县",
                "parentAreaId": "340100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340104",
                "areaType": 4,
                "areaName": "蜀山区",
                "parentAreaId": "340100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340122",
                "areaType": 4,
                "areaName": "肥东县",
                "parentAreaId": "340100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340102",
                "areaType": 4,
                "areaName": "瑶海区",
                "parentAreaId": "340100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340103",
                "areaType": 4,
                "areaName": "庐阳区",
                "parentAreaId": "340100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340121",
                "areaType": 4,
                "areaName": "长丰县",
                "parentAreaId": "340100",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "340400",
            "areaType": 3,
            "areaName": "淮南市",
            "parentAreaId": "340000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "340421",
                "areaType": 4,
                "areaName": "凤台县",
                "parentAreaId": "340400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340405",
                "areaType": 4,
                "areaName": "八公山区",
                "parentAreaId": "340400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340406",
                "areaType": 4,
                "areaName": "潘集区",
                "parentAreaId": "340400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340402",
                "areaType": 4,
                "areaName": "大通区",
                "parentAreaId": "340400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340404",
                "areaType": 4,
                "areaName": "谢家集区",
                "parentAreaId": "340400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340403",
                "areaType": 4,
                "areaName": "田家庵区",
                "parentAreaId": "340400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340422",
                "areaType": 4,
                "areaName": "寿县",
                "parentAreaId": "340400",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "340300",
            "areaType": 3,
            "areaName": "蚌埠市",
            "parentAreaId": "340000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "340311",
                "areaType": 4,
                "areaName": "淮上区",
                "parentAreaId": "340300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340322",
                "areaType": 4,
                "areaName": "五河县",
                "parentAreaId": "340300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340321",
                "areaType": 4,
                "areaName": "怀远县",
                "parentAreaId": "340300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340304",
                "areaType": 4,
                "areaName": "禹会区",
                "parentAreaId": "340300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340303",
                "areaType": 4,
                "areaName": "蚌山区",
                "parentAreaId": "340300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340302",
                "areaType": 4,
                "areaName": "龙子湖区",
                "parentAreaId": "340300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "340323",
                "areaType": 4,
                "areaName": "固镇县",
                "parentAreaId": "340300",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "341300",
            "areaType": 3,
            "areaName": "宿州市",
            "parentAreaId": "340000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "341302",
                "areaType": 4,
                "areaName": "埇桥区",
                "parentAreaId": "341300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "341324",
                "areaType": 4,
                "areaName": "泗县",
                "parentAreaId": "341300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "341322",
                "areaType": 4,
                "areaName": "萧县",
                "parentAreaId": "341300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "341323",
                "areaType": 4,
                "areaName": "灵璧县",
                "parentAreaId": "341300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "341321",
                "areaType": 4,
                "areaName": "砀山县",
                "parentAreaId": "341300",
                "zip": null,
                "childAreas": null
              }
            ]
          }
        ]
      },
      {
        "areaId": "350000",
        "areaType": 2,
        "areaName": "福建省",
        "parentAreaId": "1",
        "zip": null,
        "childAreas": [
          {
            "areaId": "350900",
            "areaType": 3,
            "areaName": "宁德市",
            "parentAreaId": "350000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "350924",
                "areaType": 4,
                "areaName": "寿宁县",
                "parentAreaId": "350900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350981",
                "areaType": 4,
                "areaName": "福安市",
                "parentAreaId": "350900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350926",
                "areaType": 4,
                "areaName": "柘荣县",
                "parentAreaId": "350900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350925",
                "areaType": 4,
                "areaName": "周宁县",
                "parentAreaId": "350900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350923",
                "areaType": 4,
                "areaName": "屏南县",
                "parentAreaId": "350900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350982",
                "areaType": 4,
                "areaName": "福鼎市",
                "parentAreaId": "350900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350922",
                "areaType": 4,
                "areaName": "古田县",
                "parentAreaId": "350900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350902",
                "areaType": 4,
                "areaName": "蕉城区",
                "parentAreaId": "350900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350921",
                "areaType": 4,
                "areaName": "霞浦县",
                "parentAreaId": "350900",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "350100",
            "areaType": 3,
            "areaName": "福州市",
            "parentAreaId": "350000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "350124",
                "areaType": 4,
                "areaName": "闽清县",
                "parentAreaId": "350100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350121",
                "areaType": 4,
                "areaName": "闽侯县",
                "parentAreaId": "350100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350123",
                "areaType": 4,
                "areaName": "罗源县",
                "parentAreaId": "350100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350122",
                "areaType": 4,
                "areaName": "连江县",
                "parentAreaId": "350100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350125",
                "areaType": 4,
                "areaName": "永泰县",
                "parentAreaId": "350100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350104",
                "areaType": 4,
                "areaName": "仓山区",
                "parentAreaId": "350100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350112",
                "areaType": 4,
                "areaName": "长乐区",
                "parentAreaId": "350100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350181",
                "areaType": 4,
                "areaName": "福清市",
                "parentAreaId": "350100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350128",
                "areaType": 4,
                "areaName": "平潭县",
                "parentAreaId": "350100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350103",
                "areaType": 4,
                "areaName": "台江区",
                "parentAreaId": "350100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350102",
                "areaType": 4,
                "areaName": "鼓楼区",
                "parentAreaId": "350100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350105",
                "areaType": 4,
                "areaName": "马尾区",
                "parentAreaId": "350100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350111",
                "areaType": 4,
                "areaName": "晋安区",
                "parentAreaId": "350100",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "350800",
            "areaType": 3,
            "areaName": "龙岩市",
            "parentAreaId": "350000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "350881",
                "areaType": 4,
                "areaName": "漳平市",
                "parentAreaId": "350800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350824",
                "areaType": 4,
                "areaName": "武平县",
                "parentAreaId": "350800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350823",
                "areaType": 4,
                "areaName": "上杭县",
                "parentAreaId": "350800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350803",
                "areaType": 4,
                "areaName": "永定区",
                "parentAreaId": "350800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350802",
                "areaType": 4,
                "areaName": "新罗区",
                "parentAreaId": "350800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350821",
                "areaType": 4,
                "areaName": "长汀县",
                "parentAreaId": "350800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350825",
                "areaType": 4,
                "areaName": "连城县",
                "parentAreaId": "350800",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "350300",
            "areaType": 3,
            "areaName": "莆田市",
            "parentAreaId": "350000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "350322",
                "areaType": 4,
                "areaName": "仙游县",
                "parentAreaId": "350300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350302",
                "areaType": 4,
                "areaName": "城厢区",
                "parentAreaId": "350300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350304",
                "areaType": 4,
                "areaName": "荔城区",
                "parentAreaId": "350300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350305",
                "areaType": 4,
                "areaName": "秀屿区",
                "parentAreaId": "350300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350303",
                "areaType": 4,
                "areaName": "涵江区",
                "parentAreaId": "350300",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "350500",
            "areaType": 3,
            "areaName": "泉州市",
            "parentAreaId": "350000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "350526",
                "areaType": 4,
                "areaName": "德化县",
                "parentAreaId": "350500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350524",
                "areaType": 4,
                "areaName": "安溪县",
                "parentAreaId": "350500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350525",
                "areaType": 4,
                "areaName": "永春县",
                "parentAreaId": "350500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350583",
                "areaType": 4,
                "areaName": "南安市",
                "parentAreaId": "350500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350504",
                "areaType": 4,
                "areaName": "洛江区",
                "parentAreaId": "350500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350505",
                "areaType": 4,
                "areaName": "泉港区",
                "parentAreaId": "350500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350503",
                "areaType": 4,
                "areaName": "丰泽区",
                "parentAreaId": "350500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350527",
                "areaType": 4,
                "areaName": "金门县",
                "parentAreaId": "350500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350582",
                "areaType": 4,
                "areaName": "晋江市",
                "parentAreaId": "350500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350581",
                "areaType": 4,
                "areaName": "石狮市",
                "parentAreaId": "350500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350521",
                "areaType": 4,
                "areaName": "惠安县",
                "parentAreaId": "350500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350502",
                "areaType": 4,
                "areaName": "鲤城区",
                "parentAreaId": "350500",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "350200",
            "areaType": 3,
            "areaName": "厦门市",
            "parentAreaId": "350000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "350206",
                "areaType": 4,
                "areaName": "湖里区",
                "parentAreaId": "350200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350203",
                "areaType": 4,
                "areaName": "思明区",
                "parentAreaId": "350200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350213",
                "areaType": 4,
                "areaName": "翔安区",
                "parentAreaId": "350200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350205",
                "areaType": 4,
                "areaName": "海沧区",
                "parentAreaId": "350200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350211",
                "areaType": 4,
                "areaName": "集美区",
                "parentAreaId": "350200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350212",
                "areaType": 4,
                "areaName": "同安区",
                "parentAreaId": "350200",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "350700",
            "areaType": 3,
            "areaName": "南平市",
            "parentAreaId": "350000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "350722",
                "areaType": 4,
                "areaName": "浦城县",
                "parentAreaId": "350700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350782",
                "areaType": 4,
                "areaName": "武夷山市",
                "parentAreaId": "350700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350723",
                "areaType": 4,
                "areaName": "光泽县",
                "parentAreaId": "350700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350724",
                "areaType": 4,
                "areaName": "松溪县",
                "parentAreaId": "350700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350703",
                "areaType": 4,
                "areaName": "建阳区",
                "parentAreaId": "350700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350725",
                "areaType": 4,
                "areaName": "政和县",
                "parentAreaId": "350700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350781",
                "areaType": 4,
                "areaName": "邵武市",
                "parentAreaId": "350700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350721",
                "areaType": 4,
                "areaName": "顺昌县",
                "parentAreaId": "350700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350783",
                "areaType": 4,
                "areaName": "建瓯市",
                "parentAreaId": "350700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350702",
                "areaType": 4,
                "areaName": "延平区",
                "parentAreaId": "350700",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "350600",
            "areaType": 3,
            "areaName": "漳州市",
            "parentAreaId": "350000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "350629",
                "areaType": 4,
                "areaName": "华安县",
                "parentAreaId": "350600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350627",
                "areaType": 4,
                "areaName": "南靖县",
                "parentAreaId": "350600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350681",
                "areaType": 4,
                "areaName": "龙海市",
                "parentAreaId": "350600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350624",
                "areaType": 4,
                "areaName": "诏安县",
                "parentAreaId": "350600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350626",
                "areaType": 4,
                "areaName": "东山县",
                "parentAreaId": "350600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350623",
                "areaType": 4,
                "areaName": "漳浦县",
                "parentAreaId": "350600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350602",
                "areaType": 4,
                "areaName": "芗城区",
                "parentAreaId": "350600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350603",
                "areaType": 4,
                "areaName": "龙文区",
                "parentAreaId": "350600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350622",
                "areaType": 4,
                "areaName": "云霄县",
                "parentAreaId": "350600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350628",
                "areaType": 4,
                "areaName": "平和县",
                "parentAreaId": "350600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350625",
                "areaType": 4,
                "areaName": "长泰县",
                "parentAreaId": "350600",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "350400",
            "areaType": 3,
            "areaName": "三明市",
            "parentAreaId": "350000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "350429",
                "areaType": 4,
                "areaName": "泰宁县",
                "parentAreaId": "350400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350424",
                "areaType": 4,
                "areaName": "宁化县",
                "parentAreaId": "350400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350403",
                "areaType": 4,
                "areaName": "三元区",
                "parentAreaId": "350400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350423",
                "areaType": 4,
                "areaName": "清流县",
                "parentAreaId": "350400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350402",
                "areaType": 4,
                "areaName": "梅列区",
                "parentAreaId": "350400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350481",
                "areaType": 4,
                "areaName": "永安市",
                "parentAreaId": "350400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350425",
                "areaType": 4,
                "areaName": "大田县",
                "parentAreaId": "350400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350430",
                "areaType": 4,
                "areaName": "建宁县",
                "parentAreaId": "350400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350427",
                "areaType": 4,
                "areaName": "沙县",
                "parentAreaId": "350400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350426",
                "areaType": 4,
                "areaName": "尤溪县",
                "parentAreaId": "350400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350421",
                "areaType": 4,
                "areaName": "明溪县",
                "parentAreaId": "350400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "350428",
                "areaType": 4,
                "areaName": "将乐县",
                "parentAreaId": "350400",
                "zip": null,
                "childAreas": null
              }
            ]
          }
        ]
      },
      {
        "areaId": "360000",
        "areaType": 2,
        "areaName": "江西省",
        "parentAreaId": "1",
        "zip": null,
        "childAreas": [
          {
            "areaId": "361000",
            "areaType": 3,
            "areaName": "抚州市",
            "parentAreaId": "360000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "361003",
                "areaType": 4,
                "areaName": "东乡区",
                "parentAreaId": "361000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "361002",
                "areaType": 4,
                "areaName": "临川区",
                "parentAreaId": "361000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "361025",
                "areaType": 4,
                "areaName": "乐安县",
                "parentAreaId": "361000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "361024",
                "areaType": 4,
                "areaName": "崇仁县",
                "parentAreaId": "361000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "361021",
                "areaType": 4,
                "areaName": "南城县",
                "parentAreaId": "361000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "361028",
                "areaType": 4,
                "areaName": "资溪县",
                "parentAreaId": "361000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "361027",
                "areaType": 4,
                "areaName": "金溪县",
                "parentAreaId": "361000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "361026",
                "areaType": 4,
                "areaName": "宜黄县",
                "parentAreaId": "361000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "361022",
                "areaType": 4,
                "areaName": "黎川县",
                "parentAreaId": "361000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "361023",
                "areaType": 4,
                "areaName": "南丰县",
                "parentAreaId": "361000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "361030",
                "areaType": 4,
                "areaName": "广昌县",
                "parentAreaId": "361000",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "360500",
            "areaType": 3,
            "areaName": "新余市",
            "parentAreaId": "360000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "360521",
                "areaType": 4,
                "areaName": "分宜县",
                "parentAreaId": "360500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360502",
                "areaType": 4,
                "areaName": "渝水区",
                "parentAreaId": "360500",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "360400",
            "areaType": 3,
            "areaName": "九江市",
            "parentAreaId": "360000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "360430",
                "areaType": 4,
                "areaName": "彭泽县",
                "parentAreaId": "360400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360428",
                "areaType": 4,
                "areaName": "都昌县",
                "parentAreaId": "360400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360404",
                "areaType": 4,
                "areaName": "柴桑区",
                "parentAreaId": "360400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360429",
                "areaType": 4,
                "areaName": "湖口县",
                "parentAreaId": "360400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360423",
                "areaType": 4,
                "areaName": "武宁县",
                "parentAreaId": "360400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360424",
                "areaType": 4,
                "areaName": "修水县",
                "parentAreaId": "360400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360402",
                "areaType": 4,
                "areaName": "濂溪区",
                "parentAreaId": "360400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360483",
                "areaType": 4,
                "areaName": "庐山市",
                "parentAreaId": "360400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360425",
                "areaType": 4,
                "areaName": "永修县",
                "parentAreaId": "360400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360403",
                "areaType": 4,
                "areaName": "浔阳区",
                "parentAreaId": "360400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360482",
                "areaType": 4,
                "areaName": "共青城市",
                "parentAreaId": "360400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360481",
                "areaType": 4,
                "areaName": "瑞昌市",
                "parentAreaId": "360400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360426",
                "areaType": 4,
                "areaName": "德安县",
                "parentAreaId": "360400",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "360600",
            "areaType": 3,
            "areaName": "鹰潭市",
            "parentAreaId": "360000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "360681",
                "areaType": 4,
                "areaName": "贵溪市",
                "parentAreaId": "360600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360603",
                "areaType": 4,
                "areaName": "余江区",
                "parentAreaId": "360600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360602",
                "areaType": 4,
                "areaName": "月湖区",
                "parentAreaId": "360600",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "360700",
            "areaType": 3,
            "areaName": "赣州市",
            "parentAreaId": "360000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "360730",
                "areaType": 4,
                "areaName": "宁都县",
                "parentAreaId": "360700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360735",
                "areaType": 4,
                "areaName": "石城县",
                "parentAreaId": "360700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360732",
                "areaType": 4,
                "areaName": "兴国县",
                "parentAreaId": "360700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360731",
                "areaType": 4,
                "areaName": "于都县",
                "parentAreaId": "360700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360781",
                "areaType": 4,
                "areaName": "瑞金市",
                "parentAreaId": "360700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360724",
                "areaType": 4,
                "areaName": "上犹县",
                "parentAreaId": "360700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360733",
                "areaType": 4,
                "areaName": "会昌县",
                "parentAreaId": "360700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360725",
                "areaType": 4,
                "areaName": "崇义县",
                "parentAreaId": "360700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360726",
                "areaType": 4,
                "areaName": "安远县",
                "parentAreaId": "360700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360729",
                "areaType": 4,
                "areaName": "全南县",
                "parentAreaId": "360700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360734",
                "areaType": 4,
                "areaName": "寻乌县",
                "parentAreaId": "360700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360722",
                "areaType": 4,
                "areaName": "信丰县",
                "parentAreaId": "360700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360723",
                "areaType": 4,
                "areaName": "大余县",
                "parentAreaId": "360700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360728",
                "areaType": 4,
                "areaName": "定南县",
                "parentAreaId": "360700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360727",
                "areaType": 4,
                "areaName": "龙南县",
                "parentAreaId": "360700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360704",
                "areaType": 4,
                "areaName": "赣县区",
                "parentAreaId": "360700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360703",
                "areaType": 4,
                "areaName": "南康区",
                "parentAreaId": "360700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360702",
                "areaType": 4,
                "areaName": "章贡区",
                "parentAreaId": "360700",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "360100",
            "areaType": 3,
            "areaName": "南昌市",
            "parentAreaId": "360000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "360123",
                "areaType": 4,
                "areaName": "安义县",
                "parentAreaId": "360100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360124",
                "areaType": 4,
                "areaName": "进贤县",
                "parentAreaId": "360100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360104",
                "areaType": 4,
                "areaName": "青云谱区",
                "parentAreaId": "360100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360121",
                "areaType": 4,
                "areaName": "南昌县",
                "parentAreaId": "360100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360103",
                "areaType": 4,
                "areaName": "西湖区",
                "parentAreaId": "360100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360111",
                "areaType": 4,
                "areaName": "青山湖区",
                "parentAreaId": "360100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360102",
                "areaType": 4,
                "areaName": "东湖区",
                "parentAreaId": "360100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360112",
                "areaType": 4,
                "areaName": "新建区",
                "parentAreaId": "360100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360113",
                "areaType": 4,
                "areaName": "红谷滩区",
                "parentAreaId": "360100",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "360900",
            "areaType": 3,
            "areaName": "宜春市",
            "parentAreaId": "360000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "360925",
                "areaType": 4,
                "areaName": "靖安县",
                "parentAreaId": "360900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360921",
                "areaType": 4,
                "areaName": "奉新县",
                "parentAreaId": "360900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360924",
                "areaType": 4,
                "areaName": "宜丰县",
                "parentAreaId": "360900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360983",
                "areaType": 4,
                "areaName": "高安市",
                "parentAreaId": "360900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360923",
                "areaType": 4,
                "areaName": "上高县",
                "parentAreaId": "360900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360981",
                "areaType": 4,
                "areaName": "丰城市",
                "parentAreaId": "360900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360926",
                "areaType": 4,
                "areaName": "铜鼓县",
                "parentAreaId": "360900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360922",
                "areaType": 4,
                "areaName": "万载县",
                "parentAreaId": "360900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360902",
                "areaType": 4,
                "areaName": "袁州区",
                "parentAreaId": "360900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360982",
                "areaType": 4,
                "areaName": "樟树市",
                "parentAreaId": "360900",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "360800",
            "areaType": 3,
            "areaName": "吉安市",
            "parentAreaId": "360000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "360823",
                "areaType": 4,
                "areaName": "峡江县",
                "parentAreaId": "360800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360821",
                "areaType": 4,
                "areaName": "吉安县",
                "parentAreaId": "360800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360802",
                "areaType": 4,
                "areaName": "吉州区",
                "parentAreaId": "360800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360830",
                "areaType": 4,
                "areaName": "永新县",
                "parentAreaId": "360800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360822",
                "areaType": 4,
                "areaName": "吉水县",
                "parentAreaId": "360800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360825",
                "areaType": 4,
                "areaName": "永丰县",
                "parentAreaId": "360800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360803",
                "areaType": 4,
                "areaName": "青原区",
                "parentAreaId": "360800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360826",
                "areaType": 4,
                "areaName": "泰和县",
                "parentAreaId": "360800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360881",
                "areaType": 4,
                "areaName": "井冈山市",
                "parentAreaId": "360800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360828",
                "areaType": 4,
                "areaName": "万安县",
                "parentAreaId": "360800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360827",
                "areaType": 4,
                "areaName": "遂川县",
                "parentAreaId": "360800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360824",
                "areaType": 4,
                "areaName": "新干县",
                "parentAreaId": "360800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360829",
                "areaType": 4,
                "areaName": "安福县",
                "parentAreaId": "360800",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "360200",
            "areaType": 3,
            "areaName": "景德镇市",
            "parentAreaId": "360000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "360202",
                "areaType": 4,
                "areaName": "昌江区",
                "parentAreaId": "360200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360222",
                "areaType": 4,
                "areaName": "浮梁县",
                "parentAreaId": "360200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360203",
                "areaType": 4,
                "areaName": "珠山区",
                "parentAreaId": "360200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360281",
                "areaType": 4,
                "areaName": "乐平市",
                "parentAreaId": "360200",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "361100",
            "areaType": 3,
            "areaName": "上饶市",
            "parentAreaId": "360000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "361130",
                "areaType": 4,
                "areaName": "婺源县",
                "parentAreaId": "361100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "361181",
                "areaType": 4,
                "areaName": "德兴市",
                "parentAreaId": "361100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "361127",
                "areaType": 4,
                "areaName": "余干县",
                "parentAreaId": "361100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "361104",
                "areaType": 4,
                "areaName": "广信区",
                "parentAreaId": "361100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "361126",
                "areaType": 4,
                "areaName": "弋阳县",
                "parentAreaId": "361100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "361125",
                "areaType": 4,
                "areaName": "横峰县",
                "parentAreaId": "361100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "361102",
                "areaType": 4,
                "areaName": "信州区",
                "parentAreaId": "361100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "361103",
                "areaType": 4,
                "areaName": "广丰区",
                "parentAreaId": "361100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "361124",
                "areaType": 4,
                "areaName": "铅山县",
                "parentAreaId": "361100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "361123",
                "areaType": 4,
                "areaName": "玉山县",
                "parentAreaId": "361100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "361128",
                "areaType": 4,
                "areaName": "鄱阳县",
                "parentAreaId": "361100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "361129",
                "areaType": 4,
                "areaName": "万年县",
                "parentAreaId": "361100",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "360300",
            "areaType": 3,
            "areaName": "萍乡市",
            "parentAreaId": "360000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "360302",
                "areaType": 4,
                "areaName": "安源区",
                "parentAreaId": "360300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360322",
                "areaType": 4,
                "areaName": "上栗县",
                "parentAreaId": "360300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360321",
                "areaType": 4,
                "areaName": "莲花县",
                "parentAreaId": "360300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360323",
                "areaType": 4,
                "areaName": "芦溪县",
                "parentAreaId": "360300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "360313",
                "areaType": 4,
                "areaName": "湘东区",
                "parentAreaId": "360300",
                "zip": null,
                "childAreas": null
              }
            ]
          }
        ]
      },
      {
        "areaId": "370000",
        "areaType": 2,
        "areaName": "山东省",
        "parentAreaId": "1",
        "zip": null,
        "childAreas": [
          {
            "areaId": "370600",
            "areaType": 3,
            "areaName": "烟台市",
            "parentAreaId": "370000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "370634",
                "areaType": 4,
                "areaName": "长岛县",
                "parentAreaId": "370600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370602",
                "areaType": 4,
                "areaName": "芝罘区",
                "parentAreaId": "370600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370683",
                "areaType": 4,
                "areaName": "莱州市",
                "parentAreaId": "370600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370687",
                "areaType": 4,
                "areaName": "海阳市",
                "parentAreaId": "370600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370681",
                "areaType": 4,
                "areaName": "龙口市",
                "parentAreaId": "370600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370682",
                "areaType": 4,
                "areaName": "莱阳市",
                "parentAreaId": "370600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370684",
                "areaType": 4,
                "areaName": "蓬莱市",
                "parentAreaId": "370600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370685",
                "areaType": 4,
                "areaName": "招远市",
                "parentAreaId": "370600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370611",
                "areaType": 4,
                "areaName": "福山区",
                "parentAreaId": "370600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370613",
                "areaType": 4,
                "areaName": "莱山区",
                "parentAreaId": "370600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370686",
                "areaType": 4,
                "areaName": "栖霞市",
                "parentAreaId": "370600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370612",
                "areaType": 4,
                "areaName": "牟平区",
                "parentAreaId": "370600",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "371000",
            "areaType": 3,
            "areaName": "威海市",
            "parentAreaId": "370000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "371002",
                "areaType": 4,
                "areaName": "环翠区",
                "parentAreaId": "371000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371082",
                "areaType": 4,
                "areaName": "荣成市",
                "parentAreaId": "371000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371003",
                "areaType": 4,
                "areaName": "文登区",
                "parentAreaId": "371000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371083",
                "areaType": 4,
                "areaName": "乳山市",
                "parentAreaId": "371000",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "370200",
            "areaType": 3,
            "areaName": "青岛市",
            "parentAreaId": "370000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "370285",
                "areaType": 4,
                "areaName": "莱西市",
                "parentAreaId": "370200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370283",
                "areaType": 4,
                "areaName": "平度市",
                "parentAreaId": "370200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370215",
                "areaType": 4,
                "areaName": "即墨区",
                "parentAreaId": "370200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370214",
                "areaType": 4,
                "areaName": "城阳区",
                "parentAreaId": "370200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370213",
                "areaType": 4,
                "areaName": "李沧区",
                "parentAreaId": "370200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370212",
                "areaType": 4,
                "areaName": "崂山区",
                "parentAreaId": "370200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370211",
                "areaType": 4,
                "areaName": "黄岛区",
                "parentAreaId": "370200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370281",
                "areaType": 4,
                "areaName": "胶州市",
                "parentAreaId": "370200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370203",
                "areaType": 4,
                "areaName": "市北区",
                "parentAreaId": "370200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370202",
                "areaType": 4,
                "areaName": "市南区",
                "parentAreaId": "370200",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "370300",
            "areaType": 3,
            "areaName": "淄博市",
            "parentAreaId": "370000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "370322",
                "areaType": 4,
                "areaName": "高青县",
                "parentAreaId": "370300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370321",
                "areaType": 4,
                "areaName": "桓台县",
                "parentAreaId": "370300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370305",
                "areaType": 4,
                "areaName": "临淄区",
                "parentAreaId": "370300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370303",
                "areaType": 4,
                "areaName": "张店区",
                "parentAreaId": "370300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370304",
                "areaType": 4,
                "areaName": "博山区",
                "parentAreaId": "370300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370323",
                "areaType": 4,
                "areaName": "沂源县",
                "parentAreaId": "370300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370302",
                "areaType": 4,
                "areaName": "淄川区",
                "parentAreaId": "370300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370306",
                "areaType": 4,
                "areaName": "周村区",
                "parentAreaId": "370300",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "371500",
            "areaType": 3,
            "areaName": "聊城市",
            "parentAreaId": "370000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "371525",
                "areaType": 4,
                "areaName": "冠县",
                "parentAreaId": "371500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371522",
                "areaType": 4,
                "areaName": "莘县",
                "parentAreaId": "371500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371503",
                "areaType": 4,
                "areaName": "茌平区",
                "parentAreaId": "371500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371502",
                "areaType": 4,
                "areaName": "东昌府区",
                "parentAreaId": "371500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371581",
                "areaType": 4,
                "areaName": "临清市",
                "parentAreaId": "371500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371526",
                "areaType": 4,
                "areaName": "高唐县",
                "parentAreaId": "371500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371524",
                "areaType": 4,
                "areaName": "东阿县",
                "parentAreaId": "371500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371521",
                "areaType": 4,
                "areaName": "阳谷县",
                "parentAreaId": "371500",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "371300",
            "areaType": 3,
            "areaName": "临沂市",
            "parentAreaId": "370000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "371323",
                "areaType": 4,
                "areaName": "沂水县",
                "parentAreaId": "371300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371328",
                "areaType": 4,
                "areaName": "蒙阴县",
                "parentAreaId": "371300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371326",
                "areaType": 4,
                "areaName": "平邑县",
                "parentAreaId": "371300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371302",
                "areaType": 4,
                "areaName": "兰山区",
                "parentAreaId": "371300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371322",
                "areaType": 4,
                "areaName": "郯城县",
                "parentAreaId": "371300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371327",
                "areaType": 4,
                "areaName": "莒南县",
                "parentAreaId": "371300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371321",
                "areaType": 4,
                "areaName": "沂南县",
                "parentAreaId": "371300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371311",
                "areaType": 4,
                "areaName": "罗庄区",
                "parentAreaId": "371300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371329",
                "areaType": 4,
                "areaName": "临沭县",
                "parentAreaId": "371300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371312",
                "areaType": 4,
                "areaName": "河东区",
                "parentAreaId": "371300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371325",
                "areaType": 4,
                "areaName": "费县",
                "parentAreaId": "371300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371324",
                "areaType": 4,
                "areaName": "兰陵县",
                "parentAreaId": "371300",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "370700",
            "areaType": 3,
            "areaName": "潍坊市",
            "parentAreaId": "370000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "370702",
                "areaType": 4,
                "areaName": "潍城区",
                "parentAreaId": "370700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370784",
                "areaType": 4,
                "areaName": "安丘市",
                "parentAreaId": "370700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370705",
                "areaType": 4,
                "areaName": "奎文区",
                "parentAreaId": "370700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370724",
                "areaType": 4,
                "areaName": "临朐县",
                "parentAreaId": "370700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370782",
                "areaType": 4,
                "areaName": "诸城市",
                "parentAreaId": "370700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370783",
                "areaType": 4,
                "areaName": "寿光市",
                "parentAreaId": "370700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370786",
                "areaType": 4,
                "areaName": "昌邑市",
                "parentAreaId": "370700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370703",
                "areaType": 4,
                "areaName": "寒亭区",
                "parentAreaId": "370700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370781",
                "areaType": 4,
                "areaName": "青州市",
                "parentAreaId": "370700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370725",
                "areaType": 4,
                "areaName": "昌乐县",
                "parentAreaId": "370700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370785",
                "areaType": 4,
                "areaName": "高密市",
                "parentAreaId": "370700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370704",
                "areaType": 4,
                "areaName": "坊子区",
                "parentAreaId": "370700",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "370500",
            "areaType": 3,
            "areaName": "东营市",
            "parentAreaId": "370000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "370522",
                "areaType": 4,
                "areaName": "利津县",
                "parentAreaId": "370500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370523",
                "areaType": 4,
                "areaName": "广饶县",
                "parentAreaId": "370500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370502",
                "areaType": 4,
                "areaName": "东营区",
                "parentAreaId": "370500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370503",
                "areaType": 4,
                "areaName": "河口区",
                "parentAreaId": "370500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370505",
                "areaType": 4,
                "areaName": "垦利区",
                "parentAreaId": "370500",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "371600",
            "areaType": 3,
            "areaName": "滨州市",
            "parentAreaId": "370000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "371603",
                "areaType": 4,
                "areaName": "沾化区",
                "parentAreaId": "371600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371602",
                "areaType": 4,
                "areaName": "滨城区",
                "parentAreaId": "371600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371625",
                "areaType": 4,
                "areaName": "博兴县",
                "parentAreaId": "371600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371681",
                "areaType": 4,
                "areaName": "邹平市",
                "parentAreaId": "371600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371623",
                "areaType": 4,
                "areaName": "无棣县",
                "parentAreaId": "371600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371622",
                "areaType": 4,
                "areaName": "阳信县",
                "parentAreaId": "371600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371621",
                "areaType": 4,
                "areaName": "惠民县",
                "parentAreaId": "371600",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "371100",
            "areaType": 3,
            "areaName": "日照市",
            "parentAreaId": "370000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "371121",
                "areaType": 4,
                "areaName": "五莲县",
                "parentAreaId": "371100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371122",
                "areaType": 4,
                "areaName": "莒县",
                "parentAreaId": "371100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371102",
                "areaType": 4,
                "areaName": "东港区",
                "parentAreaId": "371100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371103",
                "areaType": 4,
                "areaName": "岚山区",
                "parentAreaId": "371100",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "370900",
            "areaType": 3,
            "areaName": "泰安市",
            "parentAreaId": "370000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "370982",
                "areaType": 4,
                "areaName": "新泰市",
                "parentAreaId": "370900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370983",
                "areaType": 4,
                "areaName": "肥城市",
                "parentAreaId": "370900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370923",
                "areaType": 4,
                "areaName": "东平县",
                "parentAreaId": "370900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370921",
                "areaType": 4,
                "areaName": "宁阳县",
                "parentAreaId": "370900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370911",
                "areaType": 4,
                "areaName": "岱岳区",
                "parentAreaId": "370900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370902",
                "areaType": 4,
                "areaName": "泰山区",
                "parentAreaId": "370900",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "370800",
            "areaType": 3,
            "areaName": "济宁市",
            "parentAreaId": "370000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "370830",
                "areaType": 4,
                "areaName": "汶上县",
                "parentAreaId": "370800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370831",
                "areaType": 4,
                "areaName": "泗水县",
                "parentAreaId": "370800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370883",
                "areaType": 4,
                "areaName": "邹城市",
                "parentAreaId": "370800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370881",
                "areaType": 4,
                "areaName": "曲阜市",
                "parentAreaId": "370800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370811",
                "areaType": 4,
                "areaName": "任城区",
                "parentAreaId": "370800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370829",
                "areaType": 4,
                "areaName": "嘉祥县",
                "parentAreaId": "370800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370812",
                "areaType": 4,
                "areaName": "兖州区",
                "parentAreaId": "370800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370832",
                "areaType": 4,
                "areaName": "梁山县",
                "parentAreaId": "370800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370826",
                "areaType": 4,
                "areaName": "微山县",
                "parentAreaId": "370800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370828",
                "areaType": 4,
                "areaName": "金乡县",
                "parentAreaId": "370800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370827",
                "areaType": 4,
                "areaName": "鱼台县",
                "parentAreaId": "370800",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "370100",
            "areaType": 3,
            "areaName": "济南市",
            "parentAreaId": "370000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "370113",
                "areaType": 4,
                "areaName": "长清区",
                "parentAreaId": "370100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370116",
                "areaType": 4,
                "areaName": "莱芜区",
                "parentAreaId": "370100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370117",
                "areaType": 4,
                "areaName": "钢城区",
                "parentAreaId": "370100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370124",
                "areaType": 4,
                "areaName": "平阴县",
                "parentAreaId": "370100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370114",
                "areaType": 4,
                "areaName": "章丘区",
                "parentAreaId": "370100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370126",
                "areaType": 4,
                "areaName": "商河县",
                "parentAreaId": "370100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370104",
                "areaType": 4,
                "areaName": "槐荫区",
                "parentAreaId": "370100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370103",
                "areaType": 4,
                "areaName": "市中区",
                "parentAreaId": "370100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370105",
                "areaType": 4,
                "areaName": "天桥区",
                "parentAreaId": "370100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370115",
                "areaType": 4,
                "areaName": "济阳区",
                "parentAreaId": "370100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370112",
                "areaType": 4,
                "areaName": "历城区",
                "parentAreaId": "370100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370102",
                "areaType": 4,
                "areaName": "历下区",
                "parentAreaId": "370100",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "370400",
            "areaType": 3,
            "areaName": "枣庄市",
            "parentAreaId": "370000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "370406",
                "areaType": 4,
                "areaName": "山亭区",
                "parentAreaId": "370400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370402",
                "areaType": 4,
                "areaName": "市中区",
                "parentAreaId": "370400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370403",
                "areaType": 4,
                "areaName": "薛城区",
                "parentAreaId": "370400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370404",
                "areaType": 4,
                "areaName": "峄城区",
                "parentAreaId": "370400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370481",
                "areaType": 4,
                "areaName": "滕州市",
                "parentAreaId": "370400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "370405",
                "areaType": 4,
                "areaName": "台儿庄区",
                "parentAreaId": "370400",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "371400",
            "areaType": 3,
            "areaName": "德州市",
            "parentAreaId": "370000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "371481",
                "areaType": 4,
                "areaName": "乐陵市",
                "parentAreaId": "371400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371422",
                "areaType": 4,
                "areaName": "宁津县",
                "parentAreaId": "371400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371402",
                "areaType": 4,
                "areaName": "德城区",
                "parentAreaId": "371400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371428",
                "areaType": 4,
                "areaName": "武城县",
                "parentAreaId": "371400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371423",
                "areaType": 4,
                "areaName": "庆云县",
                "parentAreaId": "371400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371427",
                "areaType": 4,
                "areaName": "夏津县",
                "parentAreaId": "371400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371424",
                "areaType": 4,
                "areaName": "临邑县",
                "parentAreaId": "371400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371425",
                "areaType": 4,
                "areaName": "齐河县",
                "parentAreaId": "371400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371482",
                "areaType": 4,
                "areaName": "禹城市",
                "parentAreaId": "371400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371403",
                "areaType": 4,
                "areaName": "陵城区",
                "parentAreaId": "371400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371426",
                "areaType": 4,
                "areaName": "平原县",
                "parentAreaId": "371400",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "371700",
            "areaType": 3,
            "areaName": "菏泽市",
            "parentAreaId": "370000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "371702",
                "areaType": 4,
                "areaName": "牡丹区",
                "parentAreaId": "371700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371726",
                "areaType": 4,
                "areaName": "鄄城县",
                "parentAreaId": "371700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371728",
                "areaType": 4,
                "areaName": "东明县",
                "parentAreaId": "371700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371721",
                "areaType": 4,
                "areaName": "曹县",
                "parentAreaId": "371700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371703",
                "areaType": 4,
                "areaName": "定陶区",
                "parentAreaId": "371700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371725",
                "areaType": 4,
                "areaName": "郓城县",
                "parentAreaId": "371700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371723",
                "areaType": 4,
                "areaName": "成武县",
                "parentAreaId": "371700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371724",
                "areaType": 4,
                "areaName": "巨野县",
                "parentAreaId": "371700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "371722",
                "areaType": 4,
                "areaName": "单县",
                "parentAreaId": "371700",
                "zip": null,
                "childAreas": null
              }
            ]
          }
        ]
      },
      {
        "areaId": "410000",
        "areaType": 2,
        "areaName": "河南省",
        "parentAreaId": "1",
        "zip": null,
        "childAreas": [
          {
            "areaId": "410300",
            "areaType": 3,
            "areaName": "洛阳市",
            "parentAreaId": "410000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "410324",
                "areaType": 4,
                "areaName": "栾川县",
                "parentAreaId": "410300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410323",
                "areaType": 4,
                "areaName": "新安县",
                "parentAreaId": "410300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410326",
                "areaType": 4,
                "areaName": "汝阳县",
                "parentAreaId": "410300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410329",
                "areaType": 4,
                "areaName": "伊川县",
                "parentAreaId": "410300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410327",
                "areaType": 4,
                "areaName": "宜阳县",
                "parentAreaId": "410300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410306",
                "areaType": 4,
                "areaName": "吉利区",
                "parentAreaId": "410300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410328",
                "areaType": 4,
                "areaName": "洛宁县",
                "parentAreaId": "410300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410381",
                "areaType": 4,
                "areaName": "偃师市",
                "parentAreaId": "410300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410304",
                "areaType": 4,
                "areaName": "瀍河回族区",
                "parentAreaId": "410300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410302",
                "areaType": 4,
                "areaName": "老城区",
                "parentAreaId": "410300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410303",
                "areaType": 4,
                "areaName": "西工区",
                "parentAreaId": "410300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410325",
                "areaType": 4,
                "areaName": "嵩县",
                "parentAreaId": "410300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410322",
                "areaType": 4,
                "areaName": "孟津县",
                "parentAreaId": "410300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410311",
                "areaType": 4,
                "areaName": "洛龙区",
                "parentAreaId": "410300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410305",
                "areaType": 4,
                "areaName": "涧西区",
                "parentAreaId": "410300",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "411200",
            "areaType": 3,
            "areaName": "三门峡市",
            "parentAreaId": "410000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "411202",
                "areaType": 4,
                "areaName": "湖滨区",
                "parentAreaId": "411200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411281",
                "areaType": 4,
                "areaName": "义马市",
                "parentAreaId": "411200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411224",
                "areaType": 4,
                "areaName": "卢氏县",
                "parentAreaId": "411200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411221",
                "areaType": 4,
                "areaName": "渑池县",
                "parentAreaId": "411200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411282",
                "areaType": 4,
                "areaName": "灵宝市",
                "parentAreaId": "411200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411203",
                "areaType": 4,
                "areaName": "陕州区",
                "parentAreaId": "411200",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "411100",
            "areaType": 3,
            "areaName": "漯河市",
            "parentAreaId": "410000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "411122",
                "areaType": 4,
                "areaName": "临颍县",
                "parentAreaId": "411100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411104",
                "areaType": 4,
                "areaName": "召陵区",
                "parentAreaId": "411100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411103",
                "areaType": 4,
                "areaName": "郾城区",
                "parentAreaId": "411100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411102",
                "areaType": 4,
                "areaName": "源汇区",
                "parentAreaId": "411100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411121",
                "areaType": 4,
                "areaName": "舞阳县",
                "parentAreaId": "411100",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "411000",
            "areaType": 3,
            "areaName": "许昌市",
            "parentAreaId": "410000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "411003",
                "areaType": 4,
                "areaName": "建安区",
                "parentAreaId": "411000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411002",
                "areaType": 4,
                "areaName": "魏都区",
                "parentAreaId": "411000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411082",
                "areaType": 4,
                "areaName": "长葛市",
                "parentAreaId": "411000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411081",
                "areaType": 4,
                "areaName": "禹州市",
                "parentAreaId": "411000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411024",
                "areaType": 4,
                "areaName": "鄢陵县",
                "parentAreaId": "411000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411025",
                "areaType": 4,
                "areaName": "襄城县",
                "parentAreaId": "411000",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "411300",
            "areaType": 3,
            "areaName": "南阳市",
            "parentAreaId": "410000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "411303",
                "areaType": 4,
                "areaName": "卧龙区",
                "parentAreaId": "411300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411321",
                "areaType": 4,
                "areaName": "南召县",
                "parentAreaId": "411300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411323",
                "areaType": 4,
                "areaName": "西峡县",
                "parentAreaId": "411300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411328",
                "areaType": 4,
                "areaName": "唐河县",
                "parentAreaId": "411300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411330",
                "areaType": 4,
                "areaName": "桐柏县",
                "parentAreaId": "411300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411327",
                "areaType": 4,
                "areaName": "社旗县",
                "parentAreaId": "411300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411322",
                "areaType": 4,
                "areaName": "方城县",
                "parentAreaId": "411300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411381",
                "areaType": 4,
                "areaName": "邓州市",
                "parentAreaId": "411300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411329",
                "areaType": 4,
                "areaName": "新野县",
                "parentAreaId": "411300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411302",
                "areaType": 4,
                "areaName": "宛城区",
                "parentAreaId": "411300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411325",
                "areaType": 4,
                "areaName": "内乡县",
                "parentAreaId": "411300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411324",
                "areaType": 4,
                "areaName": "镇平县",
                "parentAreaId": "411300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411326",
                "areaType": 4,
                "areaName": "淅川县",
                "parentAreaId": "411300",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "411500",
            "areaType": 3,
            "areaName": "信阳市",
            "parentAreaId": "410000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "411521",
                "areaType": 4,
                "areaName": "罗山县",
                "parentAreaId": "411500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411526",
                "areaType": 4,
                "areaName": "潢川县",
                "parentAreaId": "411500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411527",
                "areaType": 4,
                "areaName": "淮滨县",
                "parentAreaId": "411500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411522",
                "areaType": 4,
                "areaName": "光山县",
                "parentAreaId": "411500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411525",
                "areaType": 4,
                "areaName": "固始县",
                "parentAreaId": "411500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411502",
                "areaType": 4,
                "areaName": "浉河区",
                "parentAreaId": "411500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411524",
                "areaType": 4,
                "areaName": "商城县",
                "parentAreaId": "411500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411523",
                "areaType": 4,
                "areaName": "新县",
                "parentAreaId": "411500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411528",
                "areaType": 4,
                "areaName": "息县",
                "parentAreaId": "411500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411503",
                "areaType": 4,
                "areaName": "平桥区",
                "parentAreaId": "411500",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "419001",
            "areaType": 3,
            "areaName": "济源市",
            "parentAreaId": "410000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "4190011",
                "areaType": 4,
                "areaName": "济源市坡头镇",
                "parentAreaId": "419001",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4190012",
                "areaType": 4,
                "areaName": "济源市梨林镇",
                "parentAreaId": "419001",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4190013",
                "areaType": 4,
                "areaName": "济源市思礼镇",
                "parentAreaId": "419001",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4190014",
                "areaType": 4,
                "areaName": "济源市大峪镇",
                "parentAreaId": "419001",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4190015",
                "areaType": 4,
                "areaName": "济源市五龙口镇",
                "parentAreaId": "419001",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4190016",
                "areaType": 4,
                "areaName": "济源市王屋镇",
                "parentAreaId": "419001",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4190017",
                "areaType": 4,
                "areaName": "济源市玉泉街道",
                "parentAreaId": "419001",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4190018",
                "areaType": 4,
                "areaName": "济源市轵城镇",
                "parentAreaId": "419001",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4190019",
                "areaType": 4,
                "areaName": "济源市济水街道",
                "parentAreaId": "419001",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "41900110",
                "areaType": 4,
                "areaName": "济源市沁园街道",
                "parentAreaId": "419001",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "41900111",
                "areaType": 4,
                "areaName": "济源市下冶镇",
                "parentAreaId": "419001",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "41900112",
                "areaType": 4,
                "areaName": "济源市克井镇",
                "parentAreaId": "419001",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "41900113",
                "areaType": 4,
                "areaName": "济源市天坛街道",
                "parentAreaId": "419001",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "41900114",
                "areaType": 4,
                "areaName": "济源市邵原镇",
                "parentAreaId": "419001",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "41900115",
                "areaType": 4,
                "areaName": "济源市北海街道",
                "parentAreaId": "419001",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "41900116",
                "areaType": 4,
                "areaName": "济源市承留镇",
                "parentAreaId": "419001",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "411700",
            "areaType": 3,
            "areaName": "驻马店市",
            "parentAreaId": "410000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "411722",
                "areaType": 4,
                "areaName": "上蔡县",
                "parentAreaId": "411700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411721",
                "areaType": 4,
                "areaName": "西平县",
                "parentAreaId": "411700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411727",
                "areaType": 4,
                "areaName": "汝南县",
                "parentAreaId": "411700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411729",
                "areaType": 4,
                "areaName": "新蔡县",
                "parentAreaId": "411700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411723",
                "areaType": 4,
                "areaName": "平舆县",
                "parentAreaId": "411700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411728",
                "areaType": 4,
                "areaName": "遂平县",
                "parentAreaId": "411700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411726",
                "areaType": 4,
                "areaName": "泌阳县",
                "parentAreaId": "411700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411725",
                "areaType": 4,
                "areaName": "确山县",
                "parentAreaId": "411700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411702",
                "areaType": 4,
                "areaName": "驿城区",
                "parentAreaId": "411700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411724",
                "areaType": 4,
                "areaName": "正阳县",
                "parentAreaId": "411700",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "410900",
            "areaType": 3,
            "areaName": "濮阳市",
            "parentAreaId": "410000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "410923",
                "areaType": 4,
                "areaName": "南乐县",
                "parentAreaId": "410900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410927",
                "areaType": 4,
                "areaName": "台前县",
                "parentAreaId": "410900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410928",
                "areaType": 4,
                "areaName": "濮阳县",
                "parentAreaId": "410900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410926",
                "areaType": 4,
                "areaName": "范县",
                "parentAreaId": "410900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410922",
                "areaType": 4,
                "areaName": "清丰县",
                "parentAreaId": "410900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410902",
                "areaType": 4,
                "areaName": "华龙区",
                "parentAreaId": "410900",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "410800",
            "areaType": 3,
            "areaName": "焦作市",
            "parentAreaId": "410000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "410804",
                "areaType": 4,
                "areaName": "马村区",
                "parentAreaId": "410800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410882",
                "areaType": 4,
                "areaName": "沁阳市",
                "parentAreaId": "410800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410825",
                "areaType": 4,
                "areaName": "温县",
                "parentAreaId": "410800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410883",
                "areaType": 4,
                "areaName": "孟州市",
                "parentAreaId": "410800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410823",
                "areaType": 4,
                "areaName": "武陟县",
                "parentAreaId": "410800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410822",
                "areaType": 4,
                "areaName": "博爱县",
                "parentAreaId": "410800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410821",
                "areaType": 4,
                "areaName": "修武县",
                "parentAreaId": "410800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410802",
                "areaType": 4,
                "areaName": "解放区",
                "parentAreaId": "410800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410811",
                "areaType": 4,
                "areaName": "山阳区",
                "parentAreaId": "410800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410803",
                "areaType": 4,
                "areaName": "中站区",
                "parentAreaId": "410800",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "411600",
            "areaType": 3,
            "areaName": "周口市",
            "parentAreaId": "410000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "411624",
                "areaType": 4,
                "areaName": "沈丘县",
                "parentAreaId": "411600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411621",
                "areaType": 4,
                "areaName": "扶沟县",
                "parentAreaId": "411600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411681",
                "areaType": 4,
                "areaName": "项城市",
                "parentAreaId": "411600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411623",
                "areaType": 4,
                "areaName": "商水县",
                "parentAreaId": "411600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411602",
                "areaType": 4,
                "areaName": "川汇区",
                "parentAreaId": "411600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411627",
                "areaType": 4,
                "areaName": "太康县",
                "parentAreaId": "411600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411628",
                "areaType": 4,
                "areaName": "鹿邑县",
                "parentAreaId": "411600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411625",
                "areaType": 4,
                "areaName": "郸城县",
                "parentAreaId": "411600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411603",
                "areaType": 4,
                "areaName": "淮阳区",
                "parentAreaId": "411600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411622",
                "areaType": 4,
                "areaName": "西华县",
                "parentAreaId": "411600",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "410100",
            "areaType": 3,
            "areaName": "郑州市",
            "parentAreaId": "410000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "410185",
                "areaType": 4,
                "areaName": "登封市",
                "parentAreaId": "410100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410105",
                "areaType": 4,
                "areaName": "金水区",
                "parentAreaId": "410100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410108",
                "areaType": 4,
                "areaName": "惠济区",
                "parentAreaId": "410100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410102",
                "areaType": 4,
                "areaName": "中原区",
                "parentAreaId": "410100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410183",
                "areaType": 4,
                "areaName": "新密市",
                "parentAreaId": "410100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410184",
                "areaType": 4,
                "areaName": "新郑市",
                "parentAreaId": "410100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410122",
                "areaType": 4,
                "areaName": "中牟县",
                "parentAreaId": "410100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410181",
                "areaType": 4,
                "areaName": "巩义市",
                "parentAreaId": "410100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410106",
                "areaType": 4,
                "areaName": "上街区",
                "parentAreaId": "410100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410182",
                "areaType": 4,
                "areaName": "荥阳市",
                "parentAreaId": "410100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410104",
                "areaType": 4,
                "areaName": "管城回族区",
                "parentAreaId": "410100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410103",
                "areaType": 4,
                "areaName": "二七区",
                "parentAreaId": "410100",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "410600",
            "areaType": 3,
            "areaName": "鹤壁市",
            "parentAreaId": "410000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "410602",
                "areaType": 4,
                "areaName": "鹤山区",
                "parentAreaId": "410600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410603",
                "areaType": 4,
                "areaName": "山城区",
                "parentAreaId": "410600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410622",
                "areaType": 4,
                "areaName": "淇县",
                "parentAreaId": "410600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410611",
                "areaType": 4,
                "areaName": "淇滨区",
                "parentAreaId": "410600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410621",
                "areaType": 4,
                "areaName": "浚县",
                "parentAreaId": "410600",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "410500",
            "areaType": 3,
            "areaName": "安阳市",
            "parentAreaId": "410000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "410505",
                "areaType": 4,
                "areaName": "殷都区",
                "parentAreaId": "410500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410523",
                "areaType": 4,
                "areaName": "汤阴县",
                "parentAreaId": "410500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410581",
                "areaType": 4,
                "areaName": "林州市",
                "parentAreaId": "410500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410506",
                "areaType": 4,
                "areaName": "龙安区",
                "parentAreaId": "410500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410527",
                "areaType": 4,
                "areaName": "内黄县",
                "parentAreaId": "410500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410522",
                "areaType": 4,
                "areaName": "安阳县",
                "parentAreaId": "410500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410503",
                "areaType": 4,
                "areaName": "北关区",
                "parentAreaId": "410500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410502",
                "areaType": 4,
                "areaName": "文峰区",
                "parentAreaId": "410500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410526",
                "areaType": 4,
                "areaName": "滑县",
                "parentAreaId": "410500",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "410700",
            "areaType": 3,
            "areaName": "新乡市",
            "parentAreaId": "410000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "410782",
                "areaType": 4,
                "areaName": "辉县市",
                "parentAreaId": "410700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410704",
                "areaType": 4,
                "areaName": "凤泉区",
                "parentAreaId": "410700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410724",
                "areaType": 4,
                "areaName": "获嘉县",
                "parentAreaId": "410700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410727",
                "areaType": 4,
                "areaName": "封丘县",
                "parentAreaId": "410700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410783",
                "areaType": 4,
                "areaName": "长垣市",
                "parentAreaId": "410700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410725",
                "areaType": 4,
                "areaName": "原阳县",
                "parentAreaId": "410700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410781",
                "areaType": 4,
                "areaName": "卫辉市",
                "parentAreaId": "410700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410711",
                "areaType": 4,
                "areaName": "牧野区",
                "parentAreaId": "410700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410721",
                "areaType": 4,
                "areaName": "新乡县",
                "parentAreaId": "410700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410703",
                "areaType": 4,
                "areaName": "卫滨区",
                "parentAreaId": "410700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410702",
                "areaType": 4,
                "areaName": "红旗区",
                "parentAreaId": "410700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410726",
                "areaType": 4,
                "areaName": "延津县",
                "parentAreaId": "410700",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "410400",
            "areaType": 3,
            "areaName": "平顶山市",
            "parentAreaId": "410000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "410404",
                "areaType": 4,
                "areaName": "石龙区",
                "parentAreaId": "410400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410403",
                "areaType": 4,
                "areaName": "卫东区",
                "parentAreaId": "410400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410411",
                "areaType": 4,
                "areaName": "湛河区",
                "parentAreaId": "410400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410423",
                "areaType": 4,
                "areaName": "鲁山县",
                "parentAreaId": "410400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410481",
                "areaType": 4,
                "areaName": "舞钢市",
                "parentAreaId": "410400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410402",
                "areaType": 4,
                "areaName": "新华区",
                "parentAreaId": "410400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410421",
                "areaType": 4,
                "areaName": "宝丰县",
                "parentAreaId": "410400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410482",
                "areaType": 4,
                "areaName": "汝州市",
                "parentAreaId": "410400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410425",
                "areaType": 4,
                "areaName": "郏县",
                "parentAreaId": "410400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410422",
                "areaType": 4,
                "areaName": "叶县",
                "parentAreaId": "410400",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "410200",
            "areaType": 3,
            "areaName": "开封市",
            "parentAreaId": "410000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "410212",
                "areaType": 4,
                "areaName": "祥符区",
                "parentAreaId": "410200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410203",
                "areaType": 4,
                "areaName": "顺河回族区",
                "parentAreaId": "410200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410205",
                "areaType": 4,
                "areaName": "禹王台区",
                "parentAreaId": "410200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410222",
                "areaType": 4,
                "areaName": "通许县",
                "parentAreaId": "410200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410204",
                "areaType": 4,
                "areaName": "鼓楼区",
                "parentAreaId": "410200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410202",
                "areaType": 4,
                "areaName": "龙亭区",
                "parentAreaId": "410200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410223",
                "areaType": 4,
                "areaName": "尉氏县",
                "parentAreaId": "410200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410225",
                "areaType": 4,
                "areaName": "兰考县",
                "parentAreaId": "410200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "410221",
                "areaType": 4,
                "areaName": "杞县",
                "parentAreaId": "410200",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "411400",
            "areaType": 3,
            "areaName": "商丘市",
            "parentAreaId": "410000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "411424",
                "areaType": 4,
                "areaName": "柘城县",
                "parentAreaId": "411400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411423",
                "areaType": 4,
                "areaName": "宁陵县",
                "parentAreaId": "411400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411402",
                "areaType": 4,
                "areaName": "梁园区",
                "parentAreaId": "411400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411403",
                "areaType": 4,
                "areaName": "睢阳区",
                "parentAreaId": "411400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411425",
                "areaType": 4,
                "areaName": "虞城县",
                "parentAreaId": "411400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411426",
                "areaType": 4,
                "areaName": "夏邑县",
                "parentAreaId": "411400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411481",
                "areaType": 4,
                "areaName": "永城市",
                "parentAreaId": "411400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411421",
                "areaType": 4,
                "areaName": "民权县",
                "parentAreaId": "411400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "411422",
                "areaType": 4,
                "areaName": "睢县",
                "parentAreaId": "411400",
                "zip": null,
                "childAreas": null
              }
            ]
          }
        ]
      },
      {
        "areaId": "420000",
        "areaType": 2,
        "areaName": "湖北省",
        "parentAreaId": "1",
        "zip": null,
        "childAreas": [
          {
            "areaId": "420300",
            "areaType": 3,
            "areaName": "十堰市",
            "parentAreaId": "420000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "420304",
                "areaType": 4,
                "areaName": "郧阳区",
                "parentAreaId": "420300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420302",
                "areaType": 4,
                "areaName": "茅箭区",
                "parentAreaId": "420300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420303",
                "areaType": 4,
                "areaName": "张湾区",
                "parentAreaId": "420300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420381",
                "areaType": 4,
                "areaName": "丹江口市",
                "parentAreaId": "420300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420324",
                "areaType": 4,
                "areaName": "竹溪县",
                "parentAreaId": "420300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420323",
                "areaType": 4,
                "areaName": "竹山县",
                "parentAreaId": "420300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420325",
                "areaType": 4,
                "areaName": "房县",
                "parentAreaId": "420300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420322",
                "areaType": 4,
                "areaName": "郧西县",
                "parentAreaId": "420300",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "420600",
            "areaType": 3,
            "areaName": "襄阳市",
            "parentAreaId": "420000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "420682",
                "areaType": 4,
                "areaName": "老河口市",
                "parentAreaId": "420600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420626",
                "areaType": 4,
                "areaName": "保康县",
                "parentAreaId": "420600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420625",
                "areaType": 4,
                "areaName": "谷城县",
                "parentAreaId": "420600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420683",
                "areaType": 4,
                "areaName": "枣阳市",
                "parentAreaId": "420600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420624",
                "areaType": 4,
                "areaName": "南漳县",
                "parentAreaId": "420600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420684",
                "areaType": 4,
                "areaName": "宜城市",
                "parentAreaId": "420600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420602",
                "areaType": 4,
                "areaName": "襄城区",
                "parentAreaId": "420600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420607",
                "areaType": 4,
                "areaName": "襄州区",
                "parentAreaId": "420600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420606",
                "areaType": 4,
                "areaName": "樊城区",
                "parentAreaId": "420600",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "420900",
            "areaType": 3,
            "areaName": "孝感市",
            "parentAreaId": "420000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "420982",
                "areaType": 4,
                "areaName": "安陆市",
                "parentAreaId": "420900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420923",
                "areaType": 4,
                "areaName": "云梦县",
                "parentAreaId": "420900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420981",
                "areaType": 4,
                "areaName": "应城市",
                "parentAreaId": "420900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420902",
                "areaType": 4,
                "areaName": "孝南区",
                "parentAreaId": "420900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420984",
                "areaType": 4,
                "areaName": "汉川市",
                "parentAreaId": "420900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420921",
                "areaType": 4,
                "areaName": "孝昌县",
                "parentAreaId": "420900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420922",
                "areaType": 4,
                "areaName": "大悟县",
                "parentAreaId": "420900",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "421100",
            "areaType": 3,
            "areaName": "黄冈市",
            "parentAreaId": "420000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "421181",
                "areaType": 4,
                "areaName": "麻城市",
                "parentAreaId": "421100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "421121",
                "areaType": 4,
                "areaName": "团风县",
                "parentAreaId": "421100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "421126",
                "areaType": 4,
                "areaName": "蕲春县",
                "parentAreaId": "421100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "421102",
                "areaType": 4,
                "areaName": "黄州区",
                "parentAreaId": "421100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "421127",
                "areaType": 4,
                "areaName": "黄梅县",
                "parentAreaId": "421100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "421182",
                "areaType": 4,
                "areaName": "武穴市",
                "parentAreaId": "421100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "421125",
                "areaType": 4,
                "areaName": "浠水县",
                "parentAreaId": "421100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "421123",
                "areaType": 4,
                "areaName": "罗田县",
                "parentAreaId": "421100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "421124",
                "areaType": 4,
                "areaName": "英山县",
                "parentAreaId": "421100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "421122",
                "areaType": 4,
                "areaName": "红安县",
                "parentAreaId": "421100",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "420800",
            "areaType": 3,
            "areaName": "荆门市",
            "parentAreaId": "420000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "420802",
                "areaType": 4,
                "areaName": "东宝区",
                "parentAreaId": "420800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420882",
                "areaType": 4,
                "areaName": "京山市",
                "parentAreaId": "420800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420881",
                "areaType": 4,
                "areaName": "钟祥市",
                "parentAreaId": "420800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420822",
                "areaType": 4,
                "areaName": "沙洋县",
                "parentAreaId": "420800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420804",
                "areaType": 4,
                "areaName": "掇刀区",
                "parentAreaId": "420800",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "420100",
            "areaType": 3,
            "areaName": "武汉市",
            "parentAreaId": "420000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "420116",
                "areaType": 4,
                "areaName": "黄陂区",
                "parentAreaId": "420100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420117",
                "areaType": 4,
                "areaName": "新洲区",
                "parentAreaId": "420100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420114",
                "areaType": 4,
                "areaName": "蔡甸区",
                "parentAreaId": "420100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420113",
                "areaType": 4,
                "areaName": "汉南区",
                "parentAreaId": "420100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420115",
                "areaType": 4,
                "areaName": "江夏区",
                "parentAreaId": "420100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420106",
                "areaType": 4,
                "areaName": "武昌区",
                "parentAreaId": "420100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420104",
                "areaType": 4,
                "areaName": "硚口区",
                "parentAreaId": "420100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420112",
                "areaType": 4,
                "areaName": "东西湖区",
                "parentAreaId": "420100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420105",
                "areaType": 4,
                "areaName": "汉阳区",
                "parentAreaId": "420100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420107",
                "areaType": 4,
                "areaName": "青山区",
                "parentAreaId": "420100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420102",
                "areaType": 4,
                "areaName": "江岸区",
                "parentAreaId": "420100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420103",
                "areaType": 4,
                "areaName": "江汉区",
                "parentAreaId": "420100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420111",
                "areaType": 4,
                "areaName": "洪山区",
                "parentAreaId": "420100",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "420500",
            "areaType": 3,
            "areaName": "宜昌市",
            "parentAreaId": "420000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "420526",
                "areaType": 4,
                "areaName": "兴山县",
                "parentAreaId": "420500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420525",
                "areaType": 4,
                "areaName": "远安县",
                "parentAreaId": "420500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420582",
                "areaType": 4,
                "areaName": "当阳市",
                "parentAreaId": "420500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420527",
                "areaType": 4,
                "areaName": "秭归县",
                "parentAreaId": "420500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420504",
                "areaType": 4,
                "areaName": "点军区",
                "parentAreaId": "420500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420528",
                "areaType": 4,
                "areaName": "长阳土家族自治县",
                "parentAreaId": "420500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420503",
                "areaType": 4,
                "areaName": "伍家岗区",
                "parentAreaId": "420500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420583",
                "areaType": 4,
                "areaName": "枝江市",
                "parentAreaId": "420500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420505",
                "areaType": 4,
                "areaName": "猇亭区",
                "parentAreaId": "420500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420581",
                "areaType": 4,
                "areaName": "宜都市",
                "parentAreaId": "420500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420529",
                "areaType": 4,
                "areaName": "五峰土家族自治县",
                "parentAreaId": "420500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420502",
                "areaType": 4,
                "areaName": "西陵区",
                "parentAreaId": "420500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420506",
                "areaType": 4,
                "areaName": "夷陵区",
                "parentAreaId": "420500",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "429006",
            "areaType": 3,
            "areaName": "天门市",
            "parentAreaId": "420000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "4290061",
                "areaType": 4,
                "areaName": "胡市镇",
                "parentAreaId": "429006",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4290062",
                "areaType": 4,
                "areaName": "黄潭镇",
                "parentAreaId": "429006",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4290063",
                "areaType": 4,
                "areaName": "多祥镇",
                "parentAreaId": "429006",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4290064",
                "areaType": 4,
                "areaName": "沉湖管委会",
                "parentAreaId": "429006",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4290065",
                "areaType": 4,
                "areaName": "干驿镇",
                "parentAreaId": "429006",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4290066",
                "areaType": 4,
                "areaName": "横林镇",
                "parentAreaId": "429006",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4290067",
                "areaType": 4,
                "areaName": "马湾镇",
                "parentAreaId": "429006",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4290068",
                "areaType": 4,
                "areaName": "蒋湖农场",
                "parentAreaId": "429006",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4290069",
                "areaType": 4,
                "areaName": "小板镇",
                "parentAreaId": "429006",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900610",
                "areaType": 4,
                "areaName": "岳口镇",
                "parentAreaId": "429006",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900611",
                "areaType": 4,
                "areaName": "多宝镇",
                "parentAreaId": "429006",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900612",
                "areaType": 4,
                "areaName": "蒋场镇",
                "parentAreaId": "429006",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900613",
                "areaType": 4,
                "areaName": "石家河镇",
                "parentAreaId": "429006",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900614",
                "areaType": 4,
                "areaName": "彭市镇",
                "parentAreaId": "429006",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900615",
                "areaType": 4,
                "areaName": "佛子山镇",
                "parentAreaId": "429006",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900616",
                "areaType": 4,
                "areaName": "九真镇",
                "parentAreaId": "429006",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900617",
                "areaType": 4,
                "areaName": "竟陵街道",
                "parentAreaId": "429006",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900618",
                "areaType": 4,
                "areaName": "侨乡街道开发区",
                "parentAreaId": "429006",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900619",
                "areaType": 4,
                "areaName": "麻洋镇",
                "parentAreaId": "429006",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900620",
                "areaType": 4,
                "areaName": "杨林街道",
                "parentAreaId": "429006",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900621",
                "areaType": 4,
                "areaName": "白茅湖农场",
                "parentAreaId": "429006",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900622",
                "areaType": 4,
                "areaName": "汪场镇",
                "parentAreaId": "429006",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900623",
                "areaType": 4,
                "areaName": "张港镇",
                "parentAreaId": "429006",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900624",
                "areaType": 4,
                "areaName": "渔薪镇",
                "parentAreaId": "429006",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900625",
                "areaType": 4,
                "areaName": "皂市镇",
                "parentAreaId": "429006",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900626",
                "areaType": 4,
                "areaName": "拖市镇",
                "parentAreaId": "429006",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900627",
                "areaType": 4,
                "areaName": "净潭乡",
                "parentAreaId": "429006",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900628",
                "areaType": 4,
                "areaName": "卢市镇",
                "parentAreaId": "429006",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "429005",
            "areaType": 3,
            "areaName": "潜江市",
            "parentAreaId": "420000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "4290051",
                "areaType": 4,
                "areaName": "积玉口镇",
                "parentAreaId": "429005",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4290052",
                "areaType": 4,
                "areaName": "泰丰街道",
                "parentAreaId": "429005",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4290053",
                "areaType": 4,
                "areaName": "广华街道",
                "parentAreaId": "429005",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4290054",
                "areaType": 4,
                "areaName": "潜江经济开发区",
                "parentAreaId": "429005",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4290055",
                "areaType": 4,
                "areaName": "周矶管理区",
                "parentAreaId": "429005",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4290056",
                "areaType": 4,
                "areaName": "高场街道",
                "parentAreaId": "429005",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4290057",
                "areaType": 4,
                "areaName": "周矶街道",
                "parentAreaId": "429005",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4290058",
                "areaType": 4,
                "areaName": "总口管理区",
                "parentAreaId": "429005",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4290059",
                "areaType": 4,
                "areaName": "运粮湖管理区",
                "parentAreaId": "429005",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900510",
                "areaType": 4,
                "areaName": "王场镇",
                "parentAreaId": "429005",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900511",
                "areaType": 4,
                "areaName": "园林街道",
                "parentAreaId": "429005",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900512",
                "areaType": 4,
                "areaName": "白鹭湖管理区",
                "parentAreaId": "429005",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900513",
                "areaType": 4,
                "areaName": "竹根滩镇",
                "parentAreaId": "429005",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900514",
                "areaType": 4,
                "areaName": "渔洋镇",
                "parentAreaId": "429005",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900515",
                "areaType": 4,
                "areaName": "熊口镇",
                "parentAreaId": "429005",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900516",
                "areaType": 4,
                "areaName": "熊口管理区",
                "parentAreaId": "429005",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900517",
                "areaType": 4,
                "areaName": "后湖管理区",
                "parentAreaId": "429005",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900518",
                "areaType": 4,
                "areaName": "江汉石油管理局",
                "parentAreaId": "429005",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900519",
                "areaType": 4,
                "areaName": "张金镇",
                "parentAreaId": "429005",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900520",
                "areaType": 4,
                "areaName": "杨市街道",
                "parentAreaId": "429005",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900521",
                "areaType": 4,
                "areaName": "老新镇",
                "parentAreaId": "429005",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900522",
                "areaType": 4,
                "areaName": "龙湾镇",
                "parentAreaId": "429005",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900523",
                "areaType": 4,
                "areaName": "浩口镇",
                "parentAreaId": "429005",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900524",
                "areaType": 4,
                "areaName": "浩口原种场",
                "parentAreaId": "429005",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900525",
                "areaType": 4,
                "areaName": "高石碑镇",
                "parentAreaId": "429005",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "422800",
            "areaType": 3,
            "areaName": "恩施土家族苗族自治州",
            "parentAreaId": "420000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "422822",
                "areaType": 4,
                "areaName": "建始县",
                "parentAreaId": "422800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "422801",
                "areaType": 4,
                "areaName": "恩施市",
                "parentAreaId": "422800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "422802",
                "areaType": 4,
                "areaName": "利川市",
                "parentAreaId": "422800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "422828",
                "areaType": 4,
                "areaName": "鹤峰县",
                "parentAreaId": "422800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "422827",
                "areaType": 4,
                "areaName": "来凤县",
                "parentAreaId": "422800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "422825",
                "areaType": 4,
                "areaName": "宣恩县",
                "parentAreaId": "422800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "422823",
                "areaType": 4,
                "areaName": "巴东县",
                "parentAreaId": "422800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "422826",
                "areaType": 4,
                "areaName": "咸丰县",
                "parentAreaId": "422800",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "429004",
            "areaType": 3,
            "areaName": "仙桃市",
            "parentAreaId": "420000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "4290041",
                "areaType": 4,
                "areaName": "畜禽良种场",
                "parentAreaId": "429004",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4290042",
                "areaType": 4,
                "areaName": "工业园区",
                "parentAreaId": "429004",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4290043",
                "areaType": 4,
                "areaName": "豆河镇",
                "parentAreaId": "429004",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4290044",
                "areaType": 4,
                "areaName": "沙湖镇",
                "parentAreaId": "429004",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4290045",
                "areaType": 4,
                "areaName": "通海口镇",
                "parentAreaId": "429004",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4290046",
                "areaType": 4,
                "areaName": "长倘口镇",
                "parentAreaId": "429004",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4290047",
                "areaType": 4,
                "areaName": "胡场镇",
                "parentAreaId": "429004",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4290048",
                "areaType": 4,
                "areaName": "五湖渔场",
                "parentAreaId": "429004",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4290049",
                "areaType": 4,
                "areaName": "干河街道",
                "parentAreaId": "429004",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900410",
                "areaType": 4,
                "areaName": "杨林尾镇",
                "parentAreaId": "429004",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900411",
                "areaType": 4,
                "areaName": "西流河镇",
                "parentAreaId": "429004",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900412",
                "areaType": 4,
                "areaName": "赵西垸林场",
                "parentAreaId": "429004",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900413",
                "areaType": 4,
                "areaName": "九合垸原种场",
                "parentAreaId": "429004",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900414",
                "areaType": 4,
                "areaName": "彭场镇",
                "parentAreaId": "429004",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900415",
                "areaType": 4,
                "areaName": "沔城回族镇",
                "parentAreaId": "429004",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900416",
                "areaType": 4,
                "areaName": "龙华山街道",
                "parentAreaId": "429004",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900417",
                "areaType": 4,
                "areaName": "沙湖原种场",
                "parentAreaId": "429004",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900418",
                "areaType": 4,
                "areaName": "陈场镇",
                "parentAreaId": "429004",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900419",
                "areaType": 4,
                "areaName": "郑场镇",
                "parentAreaId": "429004",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900420",
                "areaType": 4,
                "areaName": "郭河镇",
                "parentAreaId": "429004",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900421",
                "areaType": 4,
                "areaName": "排湖风景区",
                "parentAreaId": "429004",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900422",
                "areaType": 4,
                "areaName": "沙嘴街道",
                "parentAreaId": "429004",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900423",
                "areaType": 4,
                "areaName": "毛嘴镇",
                "parentAreaId": "429004",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900424",
                "areaType": 4,
                "areaName": "张沟镇",
                "parentAreaId": "429004",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "42900425",
                "areaType": 4,
                "areaName": "三伏潭镇",
                "parentAreaId": "429004",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "421000",
            "areaType": 3,
            "areaName": "荆州市",
            "parentAreaId": "420000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "421003",
                "areaType": 4,
                "areaName": "荆州区",
                "parentAreaId": "421000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "421024",
                "areaType": 4,
                "areaName": "江陵县",
                "parentAreaId": "421000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "421083",
                "areaType": 4,
                "areaName": "洪湖市",
                "parentAreaId": "421000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "421081",
                "areaType": 4,
                "areaName": "石首市",
                "parentAreaId": "421000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "421023",
                "areaType": 4,
                "areaName": "监利县",
                "parentAreaId": "421000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "421002",
                "areaType": 4,
                "areaName": "沙市区",
                "parentAreaId": "421000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "421087",
                "areaType": 4,
                "areaName": "松滋市",
                "parentAreaId": "421000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "421022",
                "areaType": 4,
                "areaName": "公安县",
                "parentAreaId": "421000",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "421200",
            "areaType": 3,
            "areaName": "咸宁市",
            "parentAreaId": "420000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "421221",
                "areaType": 4,
                "areaName": "嘉鱼县",
                "parentAreaId": "421200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "421202",
                "areaType": 4,
                "areaName": "咸安区",
                "parentAreaId": "421200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "421224",
                "areaType": 4,
                "areaName": "通山县",
                "parentAreaId": "421200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "421223",
                "areaType": 4,
                "areaName": "崇阳县",
                "parentAreaId": "421200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "421281",
                "areaType": 4,
                "areaName": "赤壁市",
                "parentAreaId": "421200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "421222",
                "areaType": 4,
                "areaName": "通城县",
                "parentAreaId": "421200",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "429021",
            "areaType": 3,
            "areaName": "神农架林区",
            "parentAreaId": "420000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "4290211",
                "areaType": 4,
                "areaName": "木鱼镇",
                "parentAreaId": "429021",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4290212",
                "areaType": 4,
                "areaName": "下谷坪土家族乡",
                "parentAreaId": "429021",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4290213",
                "areaType": 4,
                "areaName": "新华镇",
                "parentAreaId": "429021",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4290214",
                "areaType": 4,
                "areaName": "九湖镇",
                "parentAreaId": "429021",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4290215",
                "areaType": 4,
                "areaName": "宋洛乡",
                "parentAreaId": "429021",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4290216",
                "areaType": 4,
                "areaName": "松柏镇",
                "parentAreaId": "429021",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4290217",
                "areaType": 4,
                "areaName": "红坪镇",
                "parentAreaId": "429021",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4290218",
                "areaType": 4,
                "areaName": "阳日镇",
                "parentAreaId": "429021",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "421300",
            "areaType": 3,
            "areaName": "随州市",
            "parentAreaId": "420000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "421381",
                "areaType": 4,
                "areaName": "广水市",
                "parentAreaId": "421300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "421303",
                "areaType": 4,
                "areaName": "曾都区",
                "parentAreaId": "421300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "421321",
                "areaType": 4,
                "areaName": "随县",
                "parentAreaId": "421300",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "420700",
            "areaType": 3,
            "areaName": "鄂州市",
            "parentAreaId": "420000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "420703",
                "areaType": 4,
                "areaName": "华容区",
                "parentAreaId": "420700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420702",
                "areaType": 4,
                "areaName": "梁子湖区",
                "parentAreaId": "420700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420704",
                "areaType": 4,
                "areaName": "鄂城区",
                "parentAreaId": "420700",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "420200",
            "areaType": 3,
            "areaName": "黄石市",
            "parentAreaId": "420000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "420205",
                "areaType": 4,
                "areaName": "铁山区",
                "parentAreaId": "420200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420203",
                "areaType": 4,
                "areaName": "西塞山区",
                "parentAreaId": "420200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420204",
                "areaType": 4,
                "areaName": "下陆区",
                "parentAreaId": "420200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420222",
                "areaType": 4,
                "areaName": "阳新县",
                "parentAreaId": "420200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420281",
                "areaType": 4,
                "areaName": "大冶市",
                "parentAreaId": "420200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "420202",
                "areaType": 4,
                "areaName": "黄石港区",
                "parentAreaId": "420200",
                "zip": null,
                "childAreas": null
              }
            ]
          }
        ]
      },
      {
        "areaId": "430000",
        "areaType": 2,
        "areaName": "湖南省",
        "parentAreaId": "1",
        "zip": null,
        "childAreas": [
          {
            "areaId": "430600",
            "areaType": 3,
            "areaName": "岳阳市",
            "parentAreaId": "430000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "430623",
                "areaType": 4,
                "areaName": "华容县",
                "parentAreaId": "430600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430611",
                "areaType": 4,
                "areaName": "君山区",
                "parentAreaId": "430600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430603",
                "areaType": 4,
                "areaName": "云溪区",
                "parentAreaId": "430600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430602",
                "areaType": 4,
                "areaName": "岳阳楼区",
                "parentAreaId": "430600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430681",
                "areaType": 4,
                "areaName": "汨罗市",
                "parentAreaId": "430600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430624",
                "areaType": 4,
                "areaName": "湘阴县",
                "parentAreaId": "430600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430621",
                "areaType": 4,
                "areaName": "岳阳县",
                "parentAreaId": "430600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430626",
                "areaType": 4,
                "areaName": "平江县",
                "parentAreaId": "430600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430682",
                "areaType": 4,
                "areaName": "临湘市",
                "parentAreaId": "430600",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "430900",
            "areaType": 3,
            "areaName": "益阳市",
            "parentAreaId": "430000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "430921",
                "areaType": 4,
                "areaName": "南县",
                "parentAreaId": "430900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430981",
                "areaType": 4,
                "areaName": "沅江市",
                "parentAreaId": "430900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430902",
                "areaType": 4,
                "areaName": "资阳区",
                "parentAreaId": "430900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430922",
                "areaType": 4,
                "areaName": "桃江县",
                "parentAreaId": "430900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430903",
                "areaType": 4,
                "areaName": "赫山区",
                "parentAreaId": "430900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430923",
                "areaType": 4,
                "areaName": "安化县",
                "parentAreaId": "430900",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "430400",
            "areaType": 3,
            "areaName": "衡阳市",
            "parentAreaId": "430000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "430423",
                "areaType": 4,
                "areaName": "衡山县",
                "parentAreaId": "430400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430424",
                "areaType": 4,
                "areaName": "衡东县",
                "parentAreaId": "430400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430421",
                "areaType": 4,
                "areaName": "衡阳县",
                "parentAreaId": "430400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430412",
                "areaType": 4,
                "areaName": "南岳区",
                "parentAreaId": "430400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430407",
                "areaType": 4,
                "areaName": "石鼓区",
                "parentAreaId": "430400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430426",
                "areaType": 4,
                "areaName": "祁东县",
                "parentAreaId": "430400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430405",
                "areaType": 4,
                "areaName": "珠晖区",
                "parentAreaId": "430400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430406",
                "areaType": 4,
                "areaName": "雁峰区",
                "parentAreaId": "430400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430422",
                "areaType": 4,
                "areaName": "衡南县",
                "parentAreaId": "430400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430481",
                "areaType": 4,
                "areaName": "耒阳市",
                "parentAreaId": "430400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430408",
                "areaType": 4,
                "areaName": "蒸湘区",
                "parentAreaId": "430400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430482",
                "areaType": 4,
                "areaName": "常宁市",
                "parentAreaId": "430400",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "431300",
            "areaType": 3,
            "areaName": "娄底市",
            "parentAreaId": "430000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "431381",
                "areaType": 4,
                "areaName": "冷水江市",
                "parentAreaId": "431300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "431322",
                "areaType": 4,
                "areaName": "新化县",
                "parentAreaId": "431300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "431382",
                "areaType": 4,
                "areaName": "涟源市",
                "parentAreaId": "431300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "431321",
                "areaType": 4,
                "areaName": "双峰县",
                "parentAreaId": "431300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "431302",
                "areaType": 4,
                "areaName": "娄星区",
                "parentAreaId": "431300",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "430100",
            "areaType": 3,
            "areaName": "长沙市",
            "parentAreaId": "430000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "430104",
                "areaType": 4,
                "areaName": "岳麓区",
                "parentAreaId": "430100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430105",
                "areaType": 4,
                "areaName": "开福区",
                "parentAreaId": "430100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430181",
                "areaType": 4,
                "areaName": "浏阳市",
                "parentAreaId": "430100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430103",
                "areaType": 4,
                "areaName": "天心区",
                "parentAreaId": "430100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430121",
                "areaType": 4,
                "areaName": "长沙县",
                "parentAreaId": "430100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430182",
                "areaType": 4,
                "areaName": "宁乡市",
                "parentAreaId": "430100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430112",
                "areaType": 4,
                "areaName": "望城区",
                "parentAreaId": "430100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430102",
                "areaType": 4,
                "areaName": "芙蓉区",
                "parentAreaId": "430100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430111",
                "areaType": 4,
                "areaName": "雨花区",
                "parentAreaId": "430100",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "430800",
            "areaType": 3,
            "areaName": "张家界市",
            "parentAreaId": "430000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "430821",
                "areaType": 4,
                "areaName": "慈利县",
                "parentAreaId": "430800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430811",
                "areaType": 4,
                "areaName": "武陵源区",
                "parentAreaId": "430800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430822",
                "areaType": 4,
                "areaName": "桑植县",
                "parentAreaId": "430800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430802",
                "areaType": 4,
                "areaName": "永定区",
                "parentAreaId": "430800",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "431200",
            "areaType": 3,
            "areaName": "怀化市",
            "parentAreaId": "430000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "431228",
                "areaType": 4,
                "areaName": "芷江侗族自治县",
                "parentAreaId": "431200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "431281",
                "areaType": 4,
                "areaName": "洪江市",
                "parentAreaId": "431200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "431230",
                "areaType": 4,
                "areaName": "通道侗族自治县",
                "parentAreaId": "431200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "431222",
                "areaType": 4,
                "areaName": "沅陵县",
                "parentAreaId": "431200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "431223",
                "areaType": 4,
                "areaName": "辰溪县",
                "parentAreaId": "431200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "431225",
                "areaType": 4,
                "areaName": "会同县",
                "parentAreaId": "431200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "431224",
                "areaType": 4,
                "areaName": "溆浦县",
                "parentAreaId": "431200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "431229",
                "areaType": 4,
                "areaName": "靖州苗族侗族自治县",
                "parentAreaId": "431200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "431226",
                "areaType": 4,
                "areaName": "麻阳苗族自治县",
                "parentAreaId": "431200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "431227",
                "areaType": 4,
                "areaName": "新晃侗族自治县",
                "parentAreaId": "431200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "431221",
                "areaType": 4,
                "areaName": "中方县",
                "parentAreaId": "431200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "431202",
                "areaType": 4,
                "areaName": "鹤城区",
                "parentAreaId": "431200",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "433100",
            "areaType": 3,
            "areaName": "湘西土家族苗族自治州",
            "parentAreaId": "430000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "433127",
                "areaType": 4,
                "areaName": "永顺县",
                "parentAreaId": "433100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "433125",
                "areaType": 4,
                "areaName": "保靖县",
                "parentAreaId": "433100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "433124",
                "areaType": 4,
                "areaName": "花垣县",
                "parentAreaId": "433100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "433101",
                "areaType": 4,
                "areaName": "吉首市",
                "parentAreaId": "433100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "433126",
                "areaType": 4,
                "areaName": "古丈县",
                "parentAreaId": "433100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "433122",
                "areaType": 4,
                "areaName": "泸溪县",
                "parentAreaId": "433100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "433130",
                "areaType": 4,
                "areaName": "龙山县",
                "parentAreaId": "433100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "433123",
                "areaType": 4,
                "areaName": "凤凰县",
                "parentAreaId": "433100",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "430700",
            "areaType": 3,
            "areaName": "常德市",
            "parentAreaId": "430000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "430726",
                "areaType": 4,
                "areaName": "石门县",
                "parentAreaId": "430700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430723",
                "areaType": 4,
                "areaName": "澧县",
                "parentAreaId": "430700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430781",
                "areaType": 4,
                "areaName": "津市市",
                "parentAreaId": "430700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430724",
                "areaType": 4,
                "areaName": "临澧县",
                "parentAreaId": "430700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430703",
                "areaType": 4,
                "areaName": "鼎城区",
                "parentAreaId": "430700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430702",
                "areaType": 4,
                "areaName": "武陵区",
                "parentAreaId": "430700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430722",
                "areaType": 4,
                "areaName": "汉寿县",
                "parentAreaId": "430700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430725",
                "areaType": 4,
                "areaName": "桃源县",
                "parentAreaId": "430700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430721",
                "areaType": 4,
                "areaName": "安乡县",
                "parentAreaId": "430700",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "430300",
            "areaType": 3,
            "areaName": "湘潭市",
            "parentAreaId": "430000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "430321",
                "areaType": 4,
                "areaName": "湘潭县",
                "parentAreaId": "430300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430302",
                "areaType": 4,
                "areaName": "雨湖区",
                "parentAreaId": "430300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430304",
                "areaType": 4,
                "areaName": "岳塘区",
                "parentAreaId": "430300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430382",
                "areaType": 4,
                "areaName": "韶山市",
                "parentAreaId": "430300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430381",
                "areaType": 4,
                "areaName": "湘乡市",
                "parentAreaId": "430300",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "430200",
            "areaType": 3,
            "areaName": "株洲市",
            "parentAreaId": "430000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "430202",
                "areaType": 4,
                "areaName": "荷塘区",
                "parentAreaId": "430200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430223",
                "areaType": 4,
                "areaName": "攸县",
                "parentAreaId": "430200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430224",
                "areaType": 4,
                "areaName": "茶陵县",
                "parentAreaId": "430200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430225",
                "areaType": 4,
                "areaName": "炎陵县",
                "parentAreaId": "430200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430203",
                "areaType": 4,
                "areaName": "芦淞区",
                "parentAreaId": "430200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430211",
                "areaType": 4,
                "areaName": "天元区",
                "parentAreaId": "430200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430212",
                "areaType": 4,
                "areaName": "渌口区",
                "parentAreaId": "430200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430204",
                "areaType": 4,
                "areaName": "石峰区",
                "parentAreaId": "430200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430281",
                "areaType": 4,
                "areaName": "醴陵市",
                "parentAreaId": "430200",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "430500",
            "areaType": 3,
            "areaName": "邵阳市",
            "parentAreaId": "430000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "430524",
                "areaType": 4,
                "areaName": "隆回县",
                "parentAreaId": "430500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430502",
                "areaType": 4,
                "areaName": "双清区",
                "parentAreaId": "430500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430511",
                "areaType": 4,
                "areaName": "北塔区",
                "parentAreaId": "430500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430523",
                "areaType": 4,
                "areaName": "邵阳县",
                "parentAreaId": "430500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430503",
                "areaType": 4,
                "areaName": "大祥区",
                "parentAreaId": "430500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430527",
                "areaType": 4,
                "areaName": "绥宁县",
                "parentAreaId": "430500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430529",
                "areaType": 4,
                "areaName": "城步苗族自治县",
                "parentAreaId": "430500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430581",
                "areaType": 4,
                "areaName": "武冈市",
                "parentAreaId": "430500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430525",
                "areaType": 4,
                "areaName": "洞口县",
                "parentAreaId": "430500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430522",
                "areaType": 4,
                "areaName": "新邵县",
                "parentAreaId": "430500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430582",
                "areaType": 4,
                "areaName": "邵东市",
                "parentAreaId": "430500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "430528",
                "areaType": 4,
                "areaName": "新宁县",
                "parentAreaId": "430500",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "431100",
            "areaType": 3,
            "areaName": "永州市",
            "parentAreaId": "430000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "431122",
                "areaType": 4,
                "areaName": "东安县",
                "parentAreaId": "431100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "431121",
                "areaType": 4,
                "areaName": "祁阳县",
                "parentAreaId": "431100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "431103",
                "areaType": 4,
                "areaName": "冷水滩区",
                "parentAreaId": "431100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "431102",
                "areaType": 4,
                "areaName": "零陵区",
                "parentAreaId": "431100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "431128",
                "areaType": 4,
                "areaName": "新田县",
                "parentAreaId": "431100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "431129",
                "areaType": 4,
                "areaName": "江华瑶族自治县",
                "parentAreaId": "431100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "431126",
                "areaType": 4,
                "areaName": "宁远县",
                "parentAreaId": "431100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "431123",
                "areaType": 4,
                "areaName": "双牌县",
                "parentAreaId": "431100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "431127",
                "areaType": 4,
                "areaName": "蓝山县",
                "parentAreaId": "431100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "431125",
                "areaType": 4,
                "areaName": "江永县",
                "parentAreaId": "431100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "431124",
                "areaType": 4,
                "areaName": "道县",
                "parentAreaId": "431100",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "431000",
            "areaType": 3,
            "areaName": "郴州市",
            "parentAreaId": "430000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "431028",
                "areaType": 4,
                "areaName": "安仁县",
                "parentAreaId": "431000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "431081",
                "areaType": 4,
                "areaName": "资兴市",
                "parentAreaId": "431000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "431027",
                "areaType": 4,
                "areaName": "桂东县",
                "parentAreaId": "431000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "431023",
                "areaType": 4,
                "areaName": "永兴县",
                "parentAreaId": "431000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "431003",
                "areaType": 4,
                "areaName": "苏仙区",
                "parentAreaId": "431000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "431026",
                "areaType": 4,
                "areaName": "汝城县",
                "parentAreaId": "431000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "431002",
                "areaType": 4,
                "areaName": "北湖区",
                "parentAreaId": "431000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "431025",
                "areaType": 4,
                "areaName": "临武县",
                "parentAreaId": "431000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "431022",
                "areaType": 4,
                "areaName": "宜章县",
                "parentAreaId": "431000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "431024",
                "areaType": 4,
                "areaName": "嘉禾县",
                "parentAreaId": "431000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "431021",
                "areaType": 4,
                "areaName": "桂阳县",
                "parentAreaId": "431000",
                "zip": null,
                "childAreas": null
              }
            ]
          }
        ]
      },
      {
        "areaId": "440000",
        "areaType": 2,
        "areaName": "广东省",
        "parentAreaId": "1",
        "zip": null,
        "childAreas": [
          {
            "areaId": "440500",
            "areaType": 3,
            "areaName": "汕头市",
            "parentAreaId": "440000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "440513",
                "areaType": 4,
                "areaName": "潮阳区",
                "parentAreaId": "440500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440515",
                "areaType": 4,
                "areaName": "澄海区",
                "parentAreaId": "440500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440523",
                "areaType": 4,
                "areaName": "南澳县",
                "parentAreaId": "440500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440512",
                "areaType": 4,
                "areaName": "濠江区",
                "parentAreaId": "440500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440514",
                "areaType": 4,
                "areaName": "潮南区",
                "parentAreaId": "440500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440507",
                "areaType": 4,
                "areaName": "龙湖区",
                "parentAreaId": "440500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440511",
                "areaType": 4,
                "areaName": "金平区",
                "parentAreaId": "440500",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "440600",
            "areaType": 3,
            "areaName": "佛山市",
            "parentAreaId": "440000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "440607",
                "areaType": 4,
                "areaName": "三水区",
                "parentAreaId": "440600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440608",
                "areaType": 4,
                "areaName": "高明区",
                "parentAreaId": "440600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440606",
                "areaType": 4,
                "areaName": "顺德区",
                "parentAreaId": "440600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440604",
                "areaType": 4,
                "areaName": "禅城区",
                "parentAreaId": "440600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440605",
                "areaType": 4,
                "areaName": "南海区",
                "parentAreaId": "440600",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "441200",
            "areaType": 3,
            "areaName": "肇庆市",
            "parentAreaId": "440000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "441224",
                "areaType": 4,
                "areaName": "怀集县",
                "parentAreaId": "441200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "441225",
                "areaType": 4,
                "areaName": "封开县",
                "parentAreaId": "441200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "441223",
                "areaType": 4,
                "areaName": "广宁县",
                "parentAreaId": "441200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "441284",
                "areaType": 4,
                "areaName": "四会市",
                "parentAreaId": "441200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "441226",
                "areaType": 4,
                "areaName": "德庆县",
                "parentAreaId": "441200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "441203",
                "areaType": 4,
                "areaName": "鼎湖区",
                "parentAreaId": "441200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "441202",
                "areaType": 4,
                "areaName": "端州区",
                "parentAreaId": "441200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "441204",
                "areaType": 4,
                "areaName": "高要区",
                "parentAreaId": "441200",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "441300",
            "areaType": 3,
            "areaName": "惠州市",
            "parentAreaId": "440000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "441324",
                "areaType": 4,
                "areaName": "龙门县",
                "parentAreaId": "441300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "441322",
                "areaType": 4,
                "areaName": "博罗县",
                "parentAreaId": "441300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "441323",
                "areaType": 4,
                "areaName": "惠东县",
                "parentAreaId": "441300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "441303",
                "areaType": 4,
                "areaName": "惠阳区",
                "parentAreaId": "441300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "441302",
                "areaType": 4,
                "areaName": "惠城区",
                "parentAreaId": "441300",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "440300",
            "areaType": 3,
            "areaName": "深圳市",
            "parentAreaId": "440000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "440305",
                "areaType": 4,
                "areaName": "南山区",
                "parentAreaId": "440300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440306",
                "areaType": 4,
                "areaName": "宝安区",
                "parentAreaId": "440300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440304",
                "areaType": 4,
                "areaName": "福田区",
                "parentAreaId": "440300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440308",
                "areaType": 4,
                "areaName": "盐田区",
                "parentAreaId": "440300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440303",
                "areaType": 4,
                "areaName": "罗湖区",
                "parentAreaId": "440300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440310",
                "areaType": 4,
                "areaName": "坪山区",
                "parentAreaId": "440300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440309",
                "areaType": 4,
                "areaName": "龙华区",
                "parentAreaId": "440300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440307",
                "areaType": 4,
                "areaName": "龙岗区",
                "parentAreaId": "440300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440311",
                "areaType": 4,
                "areaName": "光明区",
                "parentAreaId": "440300",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "440400",
            "areaType": 3,
            "areaName": "珠海市",
            "parentAreaId": "440000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "440404",
                "areaType": 4,
                "areaName": "金湾区",
                "parentAreaId": "440400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440402",
                "areaType": 4,
                "areaName": "香洲区",
                "parentAreaId": "440400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440403",
                "areaType": 4,
                "areaName": "斗门区",
                "parentAreaId": "440400",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "440800",
            "areaType": 3,
            "areaName": "湛江市",
            "parentAreaId": "440000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "440881",
                "areaType": 4,
                "areaName": "廉江市",
                "parentAreaId": "440800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440883",
                "areaType": 4,
                "areaName": "吴川市",
                "parentAreaId": "440800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440882",
                "areaType": 4,
                "areaName": "雷州市",
                "parentAreaId": "440800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440811",
                "areaType": 4,
                "areaName": "麻章区",
                "parentAreaId": "440800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440825",
                "areaType": 4,
                "areaName": "徐闻县",
                "parentAreaId": "440800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440804",
                "areaType": 4,
                "areaName": "坡头区",
                "parentAreaId": "440800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440803",
                "areaType": 4,
                "areaName": "霞山区",
                "parentAreaId": "440800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440823",
                "areaType": 4,
                "areaName": "遂溪县",
                "parentAreaId": "440800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440802",
                "areaType": 4,
                "areaName": "赤坎区",
                "parentAreaId": "440800",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "440700",
            "areaType": 3,
            "areaName": "江门市",
            "parentAreaId": "440000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "440784",
                "areaType": 4,
                "areaName": "鹤山市",
                "parentAreaId": "440700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440783",
                "areaType": 4,
                "areaName": "开平市",
                "parentAreaId": "440700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440704",
                "areaType": 4,
                "areaName": "江海区",
                "parentAreaId": "440700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440781",
                "areaType": 4,
                "areaName": "台山市",
                "parentAreaId": "440700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440785",
                "areaType": 4,
                "areaName": "恩平市",
                "parentAreaId": "440700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440703",
                "areaType": 4,
                "areaName": "蓬江区",
                "parentAreaId": "440700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440705",
                "areaType": 4,
                "areaName": "新会区",
                "parentAreaId": "440700",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "441700",
            "areaType": 3,
            "areaName": "阳江市",
            "parentAreaId": "440000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "441781",
                "areaType": 4,
                "areaName": "阳春市",
                "parentAreaId": "441700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "441702",
                "areaType": 4,
                "areaName": "江城区",
                "parentAreaId": "441700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "441721",
                "areaType": 4,
                "areaName": "阳西县",
                "parentAreaId": "441700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "441704",
                "areaType": 4,
                "areaName": "阳东区",
                "parentAreaId": "441700",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "440900",
            "areaType": 3,
            "areaName": "茂名市",
            "parentAreaId": "440000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "440983",
                "areaType": 4,
                "areaName": "信宜市",
                "parentAreaId": "440900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440981",
                "areaType": 4,
                "areaName": "高州市",
                "parentAreaId": "440900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440982",
                "areaType": 4,
                "areaName": "化州市",
                "parentAreaId": "440900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440904",
                "areaType": 4,
                "areaName": "电白区",
                "parentAreaId": "440900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440902",
                "areaType": 4,
                "areaName": "茂南区",
                "parentAreaId": "440900",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "442100",
            "areaType": 3,
            "areaName": "东沙群岛",
            "parentAreaId": "440000",
            "zip": null,
            "childAreas": []
          },
          {
            "areaId": "445100",
            "areaType": 3,
            "areaName": "潮州市",
            "parentAreaId": "440000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "445122",
                "areaType": 4,
                "areaName": "饶平县",
                "parentAreaId": "445100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "445103",
                "areaType": 4,
                "areaName": "潮安区",
                "parentAreaId": "445100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "445102",
                "areaType": 4,
                "areaName": "湘桥区",
                "parentAreaId": "445100",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "441500",
            "areaType": 3,
            "areaName": "汕尾市",
            "parentAreaId": "440000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "441523",
                "areaType": 4,
                "areaName": "陆河县",
                "parentAreaId": "441500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "441521",
                "areaType": 4,
                "areaName": "海丰县",
                "parentAreaId": "441500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "441581",
                "areaType": 4,
                "areaName": "陆丰市",
                "parentAreaId": "441500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "441502",
                "areaType": 4,
                "areaName": "城区",
                "parentAreaId": "441500",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "445300",
            "areaType": 3,
            "areaName": "云浮市",
            "parentAreaId": "440000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "445322",
                "areaType": 4,
                "areaName": "郁南县",
                "parentAreaId": "445300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "445381",
                "areaType": 4,
                "areaName": "罗定市",
                "parentAreaId": "445300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "445321",
                "areaType": 4,
                "areaName": "新兴县",
                "parentAreaId": "445300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "445303",
                "areaType": 4,
                "areaName": "云安区",
                "parentAreaId": "445300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "445302",
                "areaType": 4,
                "areaName": "云城区",
                "parentAreaId": "445300",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "441600",
            "areaType": 3,
            "areaName": "河源市",
            "parentAreaId": "440000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "441622",
                "areaType": 4,
                "areaName": "龙川县",
                "parentAreaId": "441600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "441624",
                "areaType": 4,
                "areaName": "和平县",
                "parentAreaId": "441600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "441623",
                "areaType": 4,
                "areaName": "连平县",
                "parentAreaId": "441600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "441625",
                "areaType": 4,
                "areaName": "东源县",
                "parentAreaId": "441600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "441621",
                "areaType": 4,
                "areaName": "紫金县",
                "parentAreaId": "441600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "441602",
                "areaType": 4,
                "areaName": "源城区",
                "parentAreaId": "441600",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "441400",
            "areaType": 3,
            "areaName": "梅州市",
            "parentAreaId": "440000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "441426",
                "areaType": 4,
                "areaName": "平远县",
                "parentAreaId": "441400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "441427",
                "areaType": 4,
                "areaName": "蕉岭县",
                "parentAreaId": "441400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "441481",
                "areaType": 4,
                "areaName": "兴宁市",
                "parentAreaId": "441400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "441424",
                "areaType": 4,
                "areaName": "五华县",
                "parentAreaId": "441400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "441422",
                "areaType": 4,
                "areaName": "大埔县",
                "parentAreaId": "441400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "441423",
                "areaType": 4,
                "areaName": "丰顺县",
                "parentAreaId": "441400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "441403",
                "areaType": 4,
                "areaName": "梅县区",
                "parentAreaId": "441400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "441402",
                "areaType": 4,
                "areaName": "梅江区",
                "parentAreaId": "441400",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "441900",
            "areaType": 3,
            "areaName": "东莞市",
            "parentAreaId": "440000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "4419001",
                "areaType": 4,
                "areaName": "莞城街道",
                "parentAreaId": "441900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4419002",
                "areaType": 4,
                "areaName": "常平镇",
                "parentAreaId": "441900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4419003",
                "areaType": 4,
                "areaName": "望牛墩镇",
                "parentAreaId": "441900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4419004",
                "areaType": 4,
                "areaName": "大朗镇",
                "parentAreaId": "441900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4419005",
                "areaType": 4,
                "areaName": "麻涌镇",
                "parentAreaId": "441900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4419006",
                "areaType": 4,
                "areaName": "黄江镇",
                "parentAreaId": "441900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4419007",
                "areaType": 4,
                "areaName": "东莞生态园",
                "parentAreaId": "441900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4419008",
                "areaType": 4,
                "areaName": "桥头镇",
                "parentAreaId": "441900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4419009",
                "areaType": 4,
                "areaName": "凤岗镇",
                "parentAreaId": "441900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "44190010",
                "areaType": 4,
                "areaName": "樟木头镇",
                "parentAreaId": "441900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "44190011",
                "areaType": 4,
                "areaName": "松山湖管委会",
                "parentAreaId": "441900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "44190012",
                "areaType": 4,
                "areaName": "石龙镇",
                "parentAreaId": "441900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "44190013",
                "areaType": 4,
                "areaName": "高埗镇",
                "parentAreaId": "441900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "44190014",
                "areaType": 4,
                "areaName": "塘厦镇",
                "parentAreaId": "441900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "44190015",
                "areaType": 4,
                "areaName": "寮步镇",
                "parentAreaId": "441900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "44190016",
                "areaType": 4,
                "areaName": "谢岗镇",
                "parentAreaId": "441900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "44190017",
                "areaType": 4,
                "areaName": "厚街镇",
                "parentAreaId": "441900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "44190018",
                "areaType": 4,
                "areaName": "虎门镇",
                "parentAreaId": "441900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "44190019",
                "areaType": 4,
                "areaName": "南城街道",
                "parentAreaId": "441900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "44190020",
                "areaType": 4,
                "areaName": "虎门港管委会",
                "parentAreaId": "441900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "44190021",
                "areaType": 4,
                "areaName": "横沥镇",
                "parentAreaId": "441900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "44190022",
                "areaType": 4,
                "areaName": "企石镇",
                "parentAreaId": "441900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "44190023",
                "areaType": 4,
                "areaName": "东坑镇",
                "parentAreaId": "441900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "44190024",
                "areaType": 4,
                "areaName": "东城街道",
                "parentAreaId": "441900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "44190025",
                "areaType": 4,
                "areaName": "石排镇",
                "parentAreaId": "441900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "44190026",
                "areaType": 4,
                "areaName": "洪梅镇",
                "parentAreaId": "441900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "44190027",
                "areaType": 4,
                "areaName": "长安镇",
                "parentAreaId": "441900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "44190028",
                "areaType": 4,
                "areaName": "沙田镇",
                "parentAreaId": "441900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "44190029",
                "areaType": 4,
                "areaName": "道滘镇",
                "parentAreaId": "441900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "44190030",
                "areaType": 4,
                "areaName": "大岭山镇",
                "parentAreaId": "441900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "44190031",
                "areaType": 4,
                "areaName": "清溪镇",
                "parentAreaId": "441900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "44190032",
                "areaType": 4,
                "areaName": "茶山镇",
                "parentAreaId": "441900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "44190033",
                "areaType": 4,
                "areaName": "万江街道",
                "parentAreaId": "441900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "44190034",
                "areaType": 4,
                "areaName": "中堂镇",
                "parentAreaId": "441900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "44190035",
                "areaType": 4,
                "areaName": "石碣镇",
                "parentAreaId": "441900",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "445200",
            "areaType": 3,
            "areaName": "揭阳市",
            "parentAreaId": "440000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "445222",
                "areaType": 4,
                "areaName": "揭西县",
                "parentAreaId": "445200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "445281",
                "areaType": 4,
                "areaName": "普宁市",
                "parentAreaId": "445200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "445224",
                "areaType": 4,
                "areaName": "惠来县",
                "parentAreaId": "445200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "445202",
                "areaType": 4,
                "areaName": "榕城区",
                "parentAreaId": "445200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "445203",
                "areaType": 4,
                "areaName": "揭东区",
                "parentAreaId": "445200",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "440100",
            "areaType": 3,
            "areaName": "广州市",
            "parentAreaId": "440000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "440117",
                "areaType": 4,
                "areaName": "从化区",
                "parentAreaId": "440100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440115",
                "areaType": 4,
                "areaName": "南沙区",
                "parentAreaId": "440100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440114",
                "areaType": 4,
                "areaName": "花都区",
                "parentAreaId": "440100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440111",
                "areaType": 4,
                "areaName": "白云区",
                "parentAreaId": "440100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440105",
                "areaType": 4,
                "areaName": "海珠区",
                "parentAreaId": "440100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440113",
                "areaType": 4,
                "areaName": "番禺区",
                "parentAreaId": "440100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440103",
                "areaType": 4,
                "areaName": "荔湾区",
                "parentAreaId": "440100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440118",
                "areaType": 4,
                "areaName": "增城区",
                "parentAreaId": "440100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440112",
                "areaType": 4,
                "areaName": "黄埔区",
                "parentAreaId": "440100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440104",
                "areaType": 4,
                "areaName": "越秀区",
                "parentAreaId": "440100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440106",
                "areaType": 4,
                "areaName": "天河区",
                "parentAreaId": "440100",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "440200",
            "areaType": 3,
            "areaName": "韶关市",
            "parentAreaId": "440000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "440224",
                "areaType": 4,
                "areaName": "仁化县",
                "parentAreaId": "440200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440282",
                "areaType": 4,
                "areaName": "南雄市",
                "parentAreaId": "440200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440232",
                "areaType": 4,
                "areaName": "乳源瑶族自治县",
                "parentAreaId": "440200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440222",
                "areaType": 4,
                "areaName": "始兴县",
                "parentAreaId": "440200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440204",
                "areaType": 4,
                "areaName": "浈江区",
                "parentAreaId": "440200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440205",
                "areaType": 4,
                "areaName": "曲江区",
                "parentAreaId": "440200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440203",
                "areaType": 4,
                "areaName": "武江区",
                "parentAreaId": "440200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440229",
                "areaType": 4,
                "areaName": "翁源县",
                "parentAreaId": "440200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440233",
                "areaType": 4,
                "areaName": "新丰县",
                "parentAreaId": "440200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "440281",
                "areaType": 4,
                "areaName": "乐昌市",
                "parentAreaId": "440200",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "441800",
            "areaType": 3,
            "areaName": "清远市",
            "parentAreaId": "440000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "441882",
                "areaType": 4,
                "areaName": "连州市",
                "parentAreaId": "441800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "441826",
                "areaType": 4,
                "areaName": "连南瑶族自治县",
                "parentAreaId": "441800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "441825",
                "areaType": 4,
                "areaName": "连山壮族瑶族自治县",
                "parentAreaId": "441800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "441881",
                "areaType": 4,
                "areaName": "英德市",
                "parentAreaId": "441800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "441821",
                "areaType": 4,
                "areaName": "佛冈县",
                "parentAreaId": "441800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "441823",
                "areaType": 4,
                "areaName": "阳山县",
                "parentAreaId": "441800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "441803",
                "areaType": 4,
                "areaName": "清新区",
                "parentAreaId": "441800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "441802",
                "areaType": 4,
                "areaName": "清城区",
                "parentAreaId": "441800",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "442000",
            "areaType": 3,
            "areaName": "中山市",
            "parentAreaId": "440000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "4420001",
                "areaType": 4,
                "areaName": "三角镇",
                "parentAreaId": "442000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4420002",
                "areaType": 4,
                "areaName": "横栏镇",
                "parentAreaId": "442000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4420003",
                "areaType": 4,
                "areaName": "五桂山街道",
                "parentAreaId": "442000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4420004",
                "areaType": 4,
                "areaName": "东升镇",
                "parentAreaId": "442000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4420005",
                "areaType": 4,
                "areaName": "神湾镇",
                "parentAreaId": "442000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4420006",
                "areaType": 4,
                "areaName": "火炬开发区街道",
                "parentAreaId": "442000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4420007",
                "areaType": 4,
                "areaName": "小榄镇",
                "parentAreaId": "442000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4420008",
                "areaType": 4,
                "areaName": "南朗镇",
                "parentAreaId": "442000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4420009",
                "areaType": 4,
                "areaName": "古镇镇",
                "parentAreaId": "442000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "44200010",
                "areaType": 4,
                "areaName": "民众镇",
                "parentAreaId": "442000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "44200011",
                "areaType": 4,
                "areaName": "港口镇",
                "parentAreaId": "442000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "44200012",
                "areaType": 4,
                "areaName": "三乡镇",
                "parentAreaId": "442000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "44200013",
                "areaType": 4,
                "areaName": "石岐区街道",
                "parentAreaId": "442000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "44200014",
                "areaType": 4,
                "areaName": "大涌镇",
                "parentAreaId": "442000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "44200015",
                "areaType": 4,
                "areaName": "南头镇",
                "parentAreaId": "442000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "44200016",
                "areaType": 4,
                "areaName": "黄圃镇",
                "parentAreaId": "442000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "44200017",
                "areaType": 4,
                "areaName": "东区街道",
                "parentAreaId": "442000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "44200018",
                "areaType": 4,
                "areaName": "阜沙镇",
                "parentAreaId": "442000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "44200019",
                "areaType": 4,
                "areaName": "坦洲镇",
                "parentAreaId": "442000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "44200020",
                "areaType": 4,
                "areaName": "西区街道",
                "parentAreaId": "442000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "44200021",
                "areaType": 4,
                "areaName": "板芙镇",
                "parentAreaId": "442000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "44200022",
                "areaType": 4,
                "areaName": "南区街道",
                "parentAreaId": "442000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "44200023",
                "areaType": 4,
                "areaName": "沙溪镇",
                "parentAreaId": "442000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "44200024",
                "areaType": 4,
                "areaName": "东凤镇",
                "parentAreaId": "442000",
                "zip": null,
                "childAreas": null
              }
            ]
          }
        ]
      },
      {
        "areaId": "460000",
        "areaType": 2,
        "areaName": "海南省",
        "parentAreaId": "1",
        "zip": null,
        "childAreas": [
          {
            "areaId": "469024",
            "areaType": 3,
            "areaName": "临高县",
            "parentAreaId": "460000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "4690241",
                "areaType": 4,
                "areaName": "博厚镇",
                "parentAreaId": "469024",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690242",
                "areaType": 4,
                "areaName": "南宝镇",
                "parentAreaId": "469024",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690243",
                "areaType": 4,
                "areaName": "和舍镇",
                "parentAreaId": "469024",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690244",
                "areaType": 4,
                "areaName": "调楼镇",
                "parentAreaId": "469024",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690245",
                "areaType": 4,
                "areaName": "多文镇",
                "parentAreaId": "469024",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690246",
                "areaType": 4,
                "areaName": "东英镇",
                "parentAreaId": "469024",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690247",
                "areaType": 4,
                "areaName": "国营加来农场",
                "parentAreaId": "469024",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690248",
                "areaType": 4,
                "areaName": "新盈镇",
                "parentAreaId": "469024",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690249",
                "areaType": 4,
                "areaName": "波莲镇",
                "parentAreaId": "469024",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46902410",
                "areaType": 4,
                "areaName": "临城镇",
                "parentAreaId": "469024",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46902411",
                "areaType": 4,
                "areaName": "国营红华农场",
                "parentAreaId": "469024",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46902412",
                "areaType": 4,
                "areaName": "皇桐镇",
                "parentAreaId": "469024",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "469021",
            "areaType": 3,
            "areaName": "定安县",
            "parentAreaId": "460000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "4690211",
                "areaType": 4,
                "areaName": "黄竹镇",
                "parentAreaId": "469021",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690212",
                "areaType": 4,
                "areaName": "新竹镇",
                "parentAreaId": "469021",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690213",
                "areaType": 4,
                "areaName": "国营中瑞农场",
                "parentAreaId": "469021",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690214",
                "areaType": 4,
                "areaName": "富文镇",
                "parentAreaId": "469021",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690215",
                "areaType": 4,
                "areaName": "定城镇",
                "parentAreaId": "469021",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690216",
                "areaType": 4,
                "areaName": "岭口镇",
                "parentAreaId": "469021",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690217",
                "areaType": 4,
                "areaName": "雷鸣镇",
                "parentAreaId": "469021",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690218",
                "areaType": 4,
                "areaName": "国营南海农场",
                "parentAreaId": "469021",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690219",
                "areaType": 4,
                "areaName": "翰林镇",
                "parentAreaId": "469021",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46902110",
                "areaType": 4,
                "areaName": "龙门镇",
                "parentAreaId": "469021",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46902111",
                "areaType": 4,
                "areaName": "国营金鸡岭农场",
                "parentAreaId": "469021",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46902112",
                "areaType": 4,
                "areaName": "龙河镇",
                "parentAreaId": "469021",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46902113",
                "areaType": 4,
                "areaName": "龙湖镇",
                "parentAreaId": "469021",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "469022",
            "areaType": 3,
            "areaName": "屯昌县",
            "parentAreaId": "460000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "4690221",
                "areaType": 4,
                "areaName": "国营中建农场",
                "parentAreaId": "469022",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690222",
                "areaType": 4,
                "areaName": "屯城镇",
                "parentAreaId": "469022",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690223",
                "areaType": 4,
                "areaName": "新兴镇",
                "parentAreaId": "469022",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690224",
                "areaType": 4,
                "areaName": "南吕镇",
                "parentAreaId": "469022",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690225",
                "areaType": 4,
                "areaName": "西昌镇",
                "parentAreaId": "469022",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690226",
                "areaType": 4,
                "areaName": "国营中坤农场",
                "parentAreaId": "469022",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690227",
                "areaType": 4,
                "areaName": "坡心镇",
                "parentAreaId": "469022",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690228",
                "areaType": 4,
                "areaName": "枫木镇",
                "parentAreaId": "469022",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690229",
                "areaType": 4,
                "areaName": "南坤镇",
                "parentAreaId": "469022",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46902210",
                "areaType": 4,
                "areaName": "乌坡镇",
                "parentAreaId": "469022",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "469026",
            "areaType": 3,
            "areaName": "昌江黎族自治县",
            "parentAreaId": "460000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "4690261",
                "areaType": 4,
                "areaName": "十月田镇",
                "parentAreaId": "469026",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690262",
                "areaType": 4,
                "areaName": "国营霸王岭林场",
                "parentAreaId": "469026",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690263",
                "areaType": 4,
                "areaName": "乌烈镇",
                "parentAreaId": "469026",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690264",
                "areaType": 4,
                "areaName": "七叉镇",
                "parentAreaId": "469026",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690265",
                "areaType": 4,
                "areaName": "海南矿业联合有限公司",
                "parentAreaId": "469026",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690266",
                "areaType": 4,
                "areaName": "叉河镇",
                "parentAreaId": "469026",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690267",
                "areaType": 4,
                "areaName": "石碌镇",
                "parentAreaId": "469026",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690268",
                "areaType": 4,
                "areaName": "海尾镇",
                "parentAreaId": "469026",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690269",
                "areaType": 4,
                "areaName": "国营红林农场",
                "parentAreaId": "469026",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46902610",
                "areaType": 4,
                "areaName": "昌化镇",
                "parentAreaId": "469026",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46902611",
                "areaType": 4,
                "areaName": "王下乡",
                "parentAreaId": "469026",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "469006",
            "areaType": 3,
            "areaName": "万宁市",
            "parentAreaId": "460000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "4690061",
                "areaType": 4,
                "areaName": "礼纪镇",
                "parentAreaId": "469006",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690062",
                "areaType": 4,
                "areaName": "国营东和农场",
                "parentAreaId": "469006",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690063",
                "areaType": 4,
                "areaName": "后安镇",
                "parentAreaId": "469006",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690064",
                "areaType": 4,
                "areaName": "万城镇",
                "parentAreaId": "469006",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690065",
                "areaType": 4,
                "areaName": "国营东兴农场",
                "parentAreaId": "469006",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690066",
                "areaType": 4,
                "areaName": "山根镇",
                "parentAreaId": "469006",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690067",
                "areaType": 4,
                "areaName": "大茂镇",
                "parentAreaId": "469006",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690068",
                "areaType": 4,
                "areaName": "龙滚镇",
                "parentAreaId": "469006",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690069",
                "areaType": 4,
                "areaName": "和乐镇",
                "parentAreaId": "469006",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46900610",
                "areaType": 4,
                "areaName": "兴隆华侨农场",
                "parentAreaId": "469006",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46900611",
                "areaType": 4,
                "areaName": "三更罗镇",
                "parentAreaId": "469006",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46900612",
                "areaType": 4,
                "areaName": "长丰镇",
                "parentAreaId": "469006",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46900613",
                "areaType": 4,
                "areaName": "国营新中农场",
                "parentAreaId": "469006",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46900614",
                "areaType": 4,
                "areaName": "地方国营六连林场",
                "parentAreaId": "469006",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46900615",
                "areaType": 4,
                "areaName": "北大镇",
                "parentAreaId": "469006",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46900616",
                "areaType": 4,
                "areaName": "南桥镇",
                "parentAreaId": "469006",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46900617",
                "areaType": 4,
                "areaName": "东澳镇",
                "parentAreaId": "469006",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "469001",
            "areaType": 3,
            "areaName": "五指山市",
            "parentAreaId": "460000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "4690011",
                "areaType": 4,
                "areaName": "南圣镇",
                "parentAreaId": "469001",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690012",
                "areaType": 4,
                "areaName": "毛阳镇",
                "parentAreaId": "469001",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690013",
                "areaType": 4,
                "areaName": "国营畅好农场",
                "parentAreaId": "469001",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690014",
                "areaType": 4,
                "areaName": "水满乡",
                "parentAreaId": "469001",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690015",
                "areaType": 4,
                "areaName": "通什镇",
                "parentAreaId": "469001",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690016",
                "areaType": 4,
                "areaName": "番阳镇",
                "parentAreaId": "469001",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690017",
                "areaType": 4,
                "areaName": "畅好乡",
                "parentAreaId": "469001",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690018",
                "areaType": 4,
                "areaName": "毛道乡",
                "parentAreaId": "469001",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "469030",
            "areaType": 3,
            "areaName": "琼中黎族苗族自治县",
            "parentAreaId": "460000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "4690301",
                "areaType": 4,
                "areaName": "吊罗山乡",
                "parentAreaId": "469030",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690302",
                "areaType": 4,
                "areaName": "什运乡",
                "parentAreaId": "469030",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690303",
                "areaType": 4,
                "areaName": "和平镇",
                "parentAreaId": "469030",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690304",
                "areaType": 4,
                "areaName": "湾岭镇",
                "parentAreaId": "469030",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690305",
                "areaType": 4,
                "areaName": "国营加钗农场",
                "parentAreaId": "469030",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690306",
                "areaType": 4,
                "areaName": "国营乌石农场",
                "parentAreaId": "469030",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690307",
                "areaType": 4,
                "areaName": "国营阳江农场",
                "parentAreaId": "469030",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690308",
                "areaType": 4,
                "areaName": "营根镇",
                "parentAreaId": "469030",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690309",
                "areaType": 4,
                "areaName": "上安乡",
                "parentAreaId": "469030",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46903010",
                "areaType": 4,
                "areaName": "国营黎母山林业公司",
                "parentAreaId": "469030",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46903011",
                "areaType": 4,
                "areaName": "中平镇",
                "parentAreaId": "469030",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46903012",
                "areaType": 4,
                "areaName": "国营长征农场",
                "parentAreaId": "469030",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46903013",
                "areaType": 4,
                "areaName": "黎母山镇",
                "parentAreaId": "469030",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46903014",
                "areaType": 4,
                "areaName": "长征镇",
                "parentAreaId": "469030",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46903015",
                "areaType": 4,
                "areaName": "红毛镇",
                "parentAreaId": "469030",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "469025",
            "areaType": 3,
            "areaName": "白沙黎族自治县",
            "parentAreaId": "460000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "4690251",
                "areaType": 4,
                "areaName": "七坊镇",
                "parentAreaId": "469025",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690252",
                "areaType": 4,
                "areaName": "金波乡",
                "parentAreaId": "469025",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690253",
                "areaType": 4,
                "areaName": "南开乡",
                "parentAreaId": "469025",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690254",
                "areaType": 4,
                "areaName": "荣邦乡",
                "parentAreaId": "469025",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690255",
                "areaType": 4,
                "areaName": "邦溪镇",
                "parentAreaId": "469025",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690256",
                "areaType": 4,
                "areaName": "青松乡",
                "parentAreaId": "469025",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690257",
                "areaType": 4,
                "areaName": "国营龙江农场",
                "parentAreaId": "469025",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690258",
                "areaType": 4,
                "areaName": "细水乡",
                "parentAreaId": "469025",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690259",
                "areaType": 4,
                "areaName": "元门乡",
                "parentAreaId": "469025",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46902510",
                "areaType": 4,
                "areaName": "牙叉镇",
                "parentAreaId": "469025",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46902511",
                "areaType": 4,
                "areaName": "打安镇",
                "parentAreaId": "469025",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46902512",
                "areaType": 4,
                "areaName": "国营白沙农场",
                "parentAreaId": "469025",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46902513",
                "areaType": 4,
                "areaName": "阜龙乡",
                "parentAreaId": "469025",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46902514",
                "areaType": 4,
                "areaName": "国营邦溪农场",
                "parentAreaId": "469025",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "469002",
            "areaType": 3,
            "areaName": "琼海市",
            "parentAreaId": "460000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "4690021",
                "areaType": 4,
                "areaName": "嘉积镇",
                "parentAreaId": "469002",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690022",
                "areaType": 4,
                "areaName": "会山镇",
                "parentAreaId": "469002",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690023",
                "areaType": 4,
                "areaName": "国营东升农场",
                "parentAreaId": "469002",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690024",
                "areaType": 4,
                "areaName": "国营东太农场",
                "parentAreaId": "469002",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690025",
                "areaType": 4,
                "areaName": "万泉镇",
                "parentAreaId": "469002",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690026",
                "areaType": 4,
                "areaName": "国营东红农场",
                "parentAreaId": "469002",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690027",
                "areaType": 4,
                "areaName": "彬村山华侨农场",
                "parentAreaId": "469002",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690028",
                "areaType": 4,
                "areaName": "大路镇",
                "parentAreaId": "469002",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690029",
                "areaType": 4,
                "areaName": "潭门镇",
                "parentAreaId": "469002",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46900210",
                "areaType": 4,
                "areaName": "塔洋镇",
                "parentAreaId": "469002",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46900211",
                "areaType": 4,
                "areaName": "龙江镇",
                "parentAreaId": "469002",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46900212",
                "areaType": 4,
                "areaName": "石壁镇",
                "parentAreaId": "469002",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46900213",
                "areaType": 4,
                "areaName": "博鳌镇",
                "parentAreaId": "469002",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46900214",
                "areaType": 4,
                "areaName": "中原镇",
                "parentAreaId": "469002",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46900215",
                "areaType": 4,
                "areaName": "阳江镇",
                "parentAreaId": "469002",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46900216",
                "areaType": 4,
                "areaName": "长坡镇",
                "parentAreaId": "469002",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "469007",
            "areaType": 3,
            "areaName": "东方市",
            "parentAreaId": "460000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "4690071",
                "areaType": 4,
                "areaName": "东方华侨农场",
                "parentAreaId": "469007",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690072",
                "areaType": 4,
                "areaName": "东河镇",
                "parentAreaId": "469007",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690073",
                "areaType": 4,
                "areaName": "江边乡",
                "parentAreaId": "469007",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690074",
                "areaType": 4,
                "areaName": "新龙镇",
                "parentAreaId": "469007",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690075",
                "areaType": 4,
                "areaName": "天安乡",
                "parentAreaId": "469007",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690076",
                "areaType": 4,
                "areaName": "国营广坝农场",
                "parentAreaId": "469007",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690077",
                "areaType": 4,
                "areaName": "感城镇",
                "parentAreaId": "469007",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690078",
                "areaType": 4,
                "areaName": "三家镇",
                "parentAreaId": "469007",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690079",
                "areaType": 4,
                "areaName": "四更镇",
                "parentAreaId": "469007",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46900710",
                "areaType": 4,
                "areaName": "大田镇",
                "parentAreaId": "469007",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46900711",
                "areaType": 4,
                "areaName": "板桥镇",
                "parentAreaId": "469007",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46900712",
                "areaType": 4,
                "areaName": "八所镇",
                "parentAreaId": "469007",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "469027",
            "areaType": 3,
            "areaName": "乐东黎族自治县",
            "parentAreaId": "460000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "4690271",
                "areaType": 4,
                "areaName": "国营山荣农场",
                "parentAreaId": "469027",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690272",
                "areaType": 4,
                "areaName": "莺歌海镇",
                "parentAreaId": "469027",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690273",
                "areaType": 4,
                "areaName": "国营保国农场",
                "parentAreaId": "469027",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690274",
                "areaType": 4,
                "areaName": "万冲镇",
                "parentAreaId": "469027",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690275",
                "areaType": 4,
                "areaName": "利国镇",
                "parentAreaId": "469027",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690276",
                "areaType": 4,
                "areaName": "抱由镇",
                "parentAreaId": "469027",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690277",
                "areaType": 4,
                "areaName": "国营乐光农场",
                "parentAreaId": "469027",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690278",
                "areaType": 4,
                "areaName": "大安镇",
                "parentAreaId": "469027",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690279",
                "areaType": 4,
                "areaName": "九所镇",
                "parentAreaId": "469027",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46902710",
                "areaType": 4,
                "areaName": "佛罗镇",
                "parentAreaId": "469027",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46902711",
                "areaType": 4,
                "areaName": "国营莺歌海盐场",
                "parentAreaId": "469027",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46902712",
                "areaType": 4,
                "areaName": "黄流镇",
                "parentAreaId": "469027",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46902713",
                "areaType": 4,
                "areaName": "国营尖峰岭林业公司",
                "parentAreaId": "469027",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46902714",
                "areaType": 4,
                "areaName": "志仲镇",
                "parentAreaId": "469027",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46902715",
                "areaType": 4,
                "areaName": "尖峰镇",
                "parentAreaId": "469027",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46902716",
                "areaType": 4,
                "areaName": "千家镇",
                "parentAreaId": "469027",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "469029",
            "areaType": 3,
            "areaName": "保亭黎族苗族自治县",
            "parentAreaId": "460000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "4690291",
                "areaType": 4,
                "areaName": "海南保亭热带作物研究所",
                "parentAreaId": "469029",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690292",
                "areaType": 4,
                "areaName": "新政镇",
                "parentAreaId": "469029",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690293",
                "areaType": 4,
                "areaName": "加茂镇",
                "parentAreaId": "469029",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690294",
                "areaType": 4,
                "areaName": "国营金江农场",
                "parentAreaId": "469029",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690295",
                "areaType": 4,
                "areaName": "国营新星农场",
                "parentAreaId": "469029",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690296",
                "areaType": 4,
                "areaName": "保城镇",
                "parentAreaId": "469029",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690297",
                "areaType": 4,
                "areaName": "南林乡",
                "parentAreaId": "469029",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690298",
                "areaType": 4,
                "areaName": "国营三道农场",
                "parentAreaId": "469029",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690299",
                "areaType": 4,
                "areaName": "毛感乡",
                "parentAreaId": "469029",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46902910",
                "areaType": 4,
                "areaName": "什玲镇",
                "parentAreaId": "469029",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46902911",
                "areaType": 4,
                "areaName": "响水镇",
                "parentAreaId": "469029",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46902912",
                "areaType": 4,
                "areaName": "六弓乡",
                "parentAreaId": "469029",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46902913",
                "areaType": 4,
                "areaName": "三道镇",
                "parentAreaId": "469029",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "460300",
            "areaType": 3,
            "areaName": "三沙市",
            "parentAreaId": "460000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "460321",
                "areaType": 4,
                "areaName": "西沙群岛",
                "parentAreaId": "460300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "460323",
                "areaType": 4,
                "areaName": "中沙群岛的岛礁及其海域",
                "parentAreaId": "460300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "460322",
                "areaType": 4,
                "areaName": "南沙群岛",
                "parentAreaId": "460300",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "469005",
            "areaType": 3,
            "areaName": "文昌市",
            "parentAreaId": "460000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "4690051",
                "areaType": 4,
                "areaName": "东阁镇",
                "parentAreaId": "469005",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690052",
                "areaType": 4,
                "areaName": "国营罗豆农场",
                "parentAreaId": "469005",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690053",
                "areaType": 4,
                "areaName": "文教镇",
                "parentAreaId": "469005",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690054",
                "areaType": 4,
                "areaName": "会文镇",
                "parentAreaId": "469005",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690055",
                "areaType": 4,
                "areaName": "国营东路农场",
                "parentAreaId": "469005",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690056",
                "areaType": 4,
                "areaName": "铺前镇",
                "parentAreaId": "469005",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690057",
                "areaType": 4,
                "areaName": "锦山镇",
                "parentAreaId": "469005",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690058",
                "areaType": 4,
                "areaName": "东郊镇",
                "parentAreaId": "469005",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690059",
                "areaType": 4,
                "areaName": "翁田镇",
                "parentAreaId": "469005",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46900510",
                "areaType": 4,
                "areaName": "龙楼镇",
                "parentAreaId": "469005",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46900511",
                "areaType": 4,
                "areaName": "冯坡镇",
                "parentAreaId": "469005",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46900512",
                "areaType": 4,
                "areaName": "国营南阳农场",
                "parentAreaId": "469005",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46900513",
                "areaType": 4,
                "areaName": "昌洒镇",
                "parentAreaId": "469005",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46900514",
                "areaType": 4,
                "areaName": "公坡镇",
                "parentAreaId": "469005",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46900515",
                "areaType": 4,
                "areaName": "抱罗镇",
                "parentAreaId": "469005",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46900516",
                "areaType": 4,
                "areaName": "东路镇",
                "parentAreaId": "469005",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46900517",
                "areaType": 4,
                "areaName": "重兴镇",
                "parentAreaId": "469005",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46900518",
                "areaType": 4,
                "areaName": "蓬莱镇",
                "parentAreaId": "469005",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46900519",
                "areaType": 4,
                "areaName": "文城镇",
                "parentAreaId": "469005",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46900520",
                "areaType": 4,
                "areaName": "潭牛镇",
                "parentAreaId": "469005",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "469028",
            "areaType": 3,
            "areaName": "陵水黎族自治县",
            "parentAreaId": "460000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "4690281",
                "areaType": 4,
                "areaName": "椰林镇",
                "parentAreaId": "469028",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690282",
                "areaType": 4,
                "areaName": "黎安镇",
                "parentAreaId": "469028",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690283",
                "areaType": 4,
                "areaName": "国营吊罗山林业公司",
                "parentAreaId": "469028",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690284",
                "areaType": 4,
                "areaName": "文罗镇",
                "parentAreaId": "469028",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690285",
                "areaType": 4,
                "areaName": "新村镇",
                "parentAreaId": "469028",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690286",
                "areaType": 4,
                "areaName": "国营南平农场",
                "parentAreaId": "469028",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690287",
                "areaType": 4,
                "areaName": "本号镇",
                "parentAreaId": "469028",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690288",
                "areaType": 4,
                "areaName": "光坡镇",
                "parentAreaId": "469028",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690289",
                "areaType": 4,
                "areaName": "群英乡",
                "parentAreaId": "469028",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46902810",
                "areaType": 4,
                "areaName": "提蒙乡",
                "parentAreaId": "469028",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46902811",
                "areaType": 4,
                "areaName": "三才镇",
                "parentAreaId": "469028",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46902812",
                "areaType": 4,
                "areaName": "隆广镇",
                "parentAreaId": "469028",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46902813",
                "areaType": 4,
                "areaName": "国营岭门农场",
                "parentAreaId": "469028",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46902814",
                "areaType": 4,
                "areaName": "英州镇",
                "parentAreaId": "469028",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "460400",
            "areaType": 3,
            "areaName": "儋州市",
            "parentAreaId": "460000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "4604001",
                "areaType": 4,
                "areaName": "洋浦经济开发区",
                "parentAreaId": "460400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4604002",
                "areaType": 4,
                "areaName": "光村镇",
                "parentAreaId": "460400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4604003",
                "areaType": 4,
                "areaName": "兰洋镇",
                "parentAreaId": "460400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4604004",
                "areaType": 4,
                "areaName": "东成镇",
                "parentAreaId": "460400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4604005",
                "areaType": 4,
                "areaName": "和庆镇",
                "parentAreaId": "460400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4604006",
                "areaType": 4,
                "areaName": "国营蓝洋农场",
                "parentAreaId": "460400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4604007",
                "areaType": 4,
                "areaName": "海头镇",
                "parentAreaId": "460400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4604008",
                "areaType": 4,
                "areaName": "华南热作学院",
                "parentAreaId": "460400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4604009",
                "areaType": 4,
                "areaName": "王五镇",
                "parentAreaId": "460400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46040010",
                "areaType": 4,
                "areaName": "木棠镇",
                "parentAreaId": "460400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46040011",
                "areaType": 4,
                "areaName": "新州镇",
                "parentAreaId": "460400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46040012",
                "areaType": 4,
                "areaName": "中和镇",
                "parentAreaId": "460400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46040013",
                "areaType": 4,
                "areaName": "排浦镇",
                "parentAreaId": "460400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46040014",
                "areaType": 4,
                "areaName": "雅星镇",
                "parentAreaId": "460400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46040015",
                "areaType": 4,
                "areaName": "国营西联农场",
                "parentAreaId": "460400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46040016",
                "areaType": 4,
                "areaName": "国营八一农场",
                "parentAreaId": "460400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46040017",
                "areaType": 4,
                "areaName": "南丰镇",
                "parentAreaId": "460400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46040018",
                "areaType": 4,
                "areaName": "国营西培农场",
                "parentAreaId": "460400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46040019",
                "areaType": 4,
                "areaName": "白马井镇",
                "parentAreaId": "460400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46040020",
                "areaType": 4,
                "areaName": "大成镇",
                "parentAreaId": "460400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46040021",
                "areaType": 4,
                "areaName": "那大镇",
                "parentAreaId": "460400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46040022",
                "areaType": 4,
                "areaName": "峨蔓镇",
                "parentAreaId": "460400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46040023",
                "areaType": 4,
                "areaName": "三都镇",
                "parentAreaId": "460400",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "460200",
            "areaType": 3,
            "areaName": "三亚市",
            "parentAreaId": "460000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "460205",
                "areaType": 4,
                "areaName": "崖州区",
                "parentAreaId": "460200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "460204",
                "areaType": 4,
                "areaName": "天涯区",
                "parentAreaId": "460200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "460203",
                "areaType": 4,
                "areaName": "吉阳区",
                "parentAreaId": "460200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "460202",
                "areaType": 4,
                "areaName": "海棠区",
                "parentAreaId": "460200",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "469023",
            "areaType": 3,
            "areaName": "澄迈县",
            "parentAreaId": "460000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "4690231",
                "areaType": 4,
                "areaName": "福山镇",
                "parentAreaId": "469023",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690232",
                "areaType": 4,
                "areaName": "永发镇",
                "parentAreaId": "469023",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690233",
                "areaType": 4,
                "areaName": "桥头镇",
                "parentAreaId": "469023",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690234",
                "areaType": 4,
                "areaName": "金江镇",
                "parentAreaId": "469023",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690235",
                "areaType": 4,
                "areaName": "中兴镇",
                "parentAreaId": "469023",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690236",
                "areaType": 4,
                "areaName": "文儒镇",
                "parentAreaId": "469023",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690237",
                "areaType": 4,
                "areaName": "老城镇",
                "parentAreaId": "469023",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690238",
                "areaType": 4,
                "areaName": "国营红岗农场",
                "parentAreaId": "469023",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "4690239",
                "areaType": 4,
                "areaName": "瑞溪镇",
                "parentAreaId": "469023",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46902310",
                "areaType": 4,
                "areaName": "国营红光农场",
                "parentAreaId": "469023",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46902311",
                "areaType": 4,
                "areaName": "大丰镇",
                "parentAreaId": "469023",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46902312",
                "areaType": 4,
                "areaName": "加乐镇",
                "parentAreaId": "469023",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46902313",
                "areaType": 4,
                "areaName": "国营金安农场",
                "parentAreaId": "469023",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46902314",
                "areaType": 4,
                "areaName": "仁兴镇",
                "parentAreaId": "469023",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46902315",
                "areaType": 4,
                "areaName": "国营和岭农场",
                "parentAreaId": "469023",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46902316",
                "areaType": 4,
                "areaName": "国营西达农场",
                "parentAreaId": "469023",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "46902317",
                "areaType": 4,
                "areaName": "国营昆仑农场",
                "parentAreaId": "469023",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "460100",
            "areaType": 3,
            "areaName": "海口市",
            "parentAreaId": "460000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "460106",
                "areaType": 4,
                "areaName": "龙华区",
                "parentAreaId": "460100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "460108",
                "areaType": 4,
                "areaName": "美兰区",
                "parentAreaId": "460100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "460107",
                "areaType": 4,
                "areaName": "琼山区",
                "parentAreaId": "460100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "460105",
                "areaType": 4,
                "areaName": "秀英区",
                "parentAreaId": "460100",
                "zip": null,
                "childAreas": null
              }
            ]
          }
        ]
      },
      {
        "areaId": "510000",
        "areaType": 2,
        "areaName": "四川省",
        "parentAreaId": "1",
        "zip": null,
        "childAreas": [
          {
            "areaId": "510800",
            "areaType": 3,
            "areaName": "广元市",
            "parentAreaId": "510000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "510812",
                "areaType": 4,
                "areaName": "朝天区",
                "parentAreaId": "510800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510811",
                "areaType": 4,
                "areaName": "昭化区",
                "parentAreaId": "510800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510823",
                "areaType": 4,
                "areaName": "剑阁县",
                "parentAreaId": "510800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510824",
                "areaType": 4,
                "areaName": "苍溪县",
                "parentAreaId": "510800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510821",
                "areaType": 4,
                "areaName": "旺苍县",
                "parentAreaId": "510800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510822",
                "areaType": 4,
                "areaName": "青川县",
                "parentAreaId": "510800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510802",
                "areaType": 4,
                "areaName": "利州区",
                "parentAreaId": "510800",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "511300",
            "areaType": 3,
            "areaName": "南充市",
            "parentAreaId": "510000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "511321",
                "areaType": 4,
                "areaName": "南部县",
                "parentAreaId": "511300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511323",
                "areaType": 4,
                "areaName": "蓬安县",
                "parentAreaId": "511300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511322",
                "areaType": 4,
                "areaName": "营山县",
                "parentAreaId": "511300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511304",
                "areaType": 4,
                "areaName": "嘉陵区",
                "parentAreaId": "511300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511325",
                "areaType": 4,
                "areaName": "西充县",
                "parentAreaId": "511300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511324",
                "areaType": 4,
                "areaName": "仪陇县",
                "parentAreaId": "511300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511381",
                "areaType": 4,
                "areaName": "阆中市",
                "parentAreaId": "511300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511302",
                "areaType": 4,
                "areaName": "顺庆区",
                "parentAreaId": "511300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511303",
                "areaType": 4,
                "areaName": "高坪区",
                "parentAreaId": "511300",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "511900",
            "areaType": 3,
            "areaName": "巴中市",
            "parentAreaId": "510000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "511921",
                "areaType": 4,
                "areaName": "通江县",
                "parentAreaId": "511900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511902",
                "areaType": 4,
                "areaName": "巴州区",
                "parentAreaId": "511900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511922",
                "areaType": 4,
                "areaName": "南江县",
                "parentAreaId": "511900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511923",
                "areaType": 4,
                "areaName": "平昌县",
                "parentAreaId": "511900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511903",
                "areaType": 4,
                "areaName": "恩阳区",
                "parentAreaId": "511900",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "510600",
            "areaType": 3,
            "areaName": "德阳市",
            "parentAreaId": "510000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "510681",
                "areaType": 4,
                "areaName": "广汉市",
                "parentAreaId": "510600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510603",
                "areaType": 4,
                "areaName": "旌阳区",
                "parentAreaId": "510600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510623",
                "areaType": 4,
                "areaName": "中江县",
                "parentAreaId": "510600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510682",
                "areaType": 4,
                "areaName": "什邡市",
                "parentAreaId": "510600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510604",
                "areaType": 4,
                "areaName": "罗江区",
                "parentAreaId": "510600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510683",
                "areaType": 4,
                "areaName": "绵竹市",
                "parentAreaId": "510600",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "510700",
            "areaType": 3,
            "areaName": "绵阳市",
            "parentAreaId": "510000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "510781",
                "areaType": 4,
                "areaName": "江油市",
                "parentAreaId": "510700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510725",
                "areaType": 4,
                "areaName": "梓潼县",
                "parentAreaId": "510700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510704",
                "areaType": 4,
                "areaName": "游仙区",
                "parentAreaId": "510700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510722",
                "areaType": 4,
                "areaName": "三台县",
                "parentAreaId": "510700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510723",
                "areaType": 4,
                "areaName": "盐亭县",
                "parentAreaId": "510700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510726",
                "areaType": 4,
                "areaName": "北川羌族自治县",
                "parentAreaId": "510700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510705",
                "areaType": 4,
                "areaName": "安州区",
                "parentAreaId": "510700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510703",
                "areaType": 4,
                "areaName": "涪城区",
                "parentAreaId": "510700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510727",
                "areaType": 4,
                "areaName": "平武县",
                "parentAreaId": "510700",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "510100",
            "areaType": 3,
            "areaName": "成都市",
            "parentAreaId": "510000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "510182",
                "areaType": 4,
                "areaName": "彭州市",
                "parentAreaId": "510100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510181",
                "areaType": 4,
                "areaName": "都江堰市",
                "parentAreaId": "510100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510113",
                "areaType": 4,
                "areaName": "青白江区",
                "parentAreaId": "510100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510184",
                "areaType": 4,
                "areaName": "崇州市",
                "parentAreaId": "510100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510129",
                "areaType": 4,
                "areaName": "大邑县",
                "parentAreaId": "510100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510185",
                "areaType": 4,
                "areaName": "简阳市",
                "parentAreaId": "510100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510131",
                "areaType": 4,
                "areaName": "蒲江县",
                "parentAreaId": "510100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510121",
                "areaType": 4,
                "areaName": "金堂县",
                "parentAreaId": "510100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510132",
                "areaType": 4,
                "areaName": "新津县",
                "parentAreaId": "510100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510183",
                "areaType": 4,
                "areaName": "邛崃市",
                "parentAreaId": "510100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510115",
                "areaType": 4,
                "areaName": "温江区",
                "parentAreaId": "510100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510107",
                "areaType": 4,
                "areaName": "武侯区",
                "parentAreaId": "510100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510116",
                "areaType": 4,
                "areaName": "双流区",
                "parentAreaId": "510100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510117",
                "areaType": 4,
                "areaName": "郫都区",
                "parentAreaId": "510100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510106",
                "areaType": 4,
                "areaName": "金牛区",
                "parentAreaId": "510100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510114",
                "areaType": 4,
                "areaName": "新都区",
                "parentAreaId": "510100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510112",
                "areaType": 4,
                "areaName": "龙泉驿区",
                "parentAreaId": "510100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510108",
                "areaType": 4,
                "areaName": "成华区",
                "parentAreaId": "510100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510105",
                "areaType": 4,
                "areaName": "青羊区",
                "parentAreaId": "510100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510104",
                "areaType": 4,
                "areaName": "锦江区",
                "parentAreaId": "510100",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "511600",
            "areaType": 3,
            "areaName": "广安市",
            "parentAreaId": "510000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "511623",
                "areaType": 4,
                "areaName": "邻水县",
                "parentAreaId": "511600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511622",
                "areaType": 4,
                "areaName": "武胜县",
                "parentAreaId": "511600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511602",
                "areaType": 4,
                "areaName": "广安区",
                "parentAreaId": "511600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511681",
                "areaType": 4,
                "areaName": "华蓥市",
                "parentAreaId": "511600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511603",
                "areaType": 4,
                "areaName": "前锋区",
                "parentAreaId": "511600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511621",
                "areaType": 4,
                "areaName": "岳池县",
                "parentAreaId": "511600",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "511700",
            "areaType": 3,
            "areaName": "达州市",
            "parentAreaId": "510000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "511724",
                "areaType": 4,
                "areaName": "大竹县",
                "parentAreaId": "511700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511722",
                "areaType": 4,
                "areaName": "宣汉县",
                "parentAreaId": "511700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511703",
                "areaType": 4,
                "areaName": "达川区",
                "parentAreaId": "511700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511725",
                "areaType": 4,
                "areaName": "渠县",
                "parentAreaId": "511700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511723",
                "areaType": 4,
                "areaName": "开江县",
                "parentAreaId": "511700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511781",
                "areaType": 4,
                "areaName": "万源市",
                "parentAreaId": "511700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511702",
                "areaType": 4,
                "areaName": "通川区",
                "parentAreaId": "511700",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "510900",
            "areaType": 3,
            "areaName": "遂宁市",
            "parentAreaId": "510000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "510923",
                "areaType": 4,
                "areaName": "大英县",
                "parentAreaId": "510900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510981",
                "areaType": 4,
                "areaName": "射洪市",
                "parentAreaId": "510900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510921",
                "areaType": 4,
                "areaName": "蓬溪县",
                "parentAreaId": "510900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510904",
                "areaType": 4,
                "areaName": "安居区",
                "parentAreaId": "510900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510903",
                "areaType": 4,
                "areaName": "船山区",
                "parentAreaId": "510900",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "512000",
            "areaType": 3,
            "areaName": "资阳市",
            "parentAreaId": "510000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "512022",
                "areaType": 4,
                "areaName": "乐至县",
                "parentAreaId": "512000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "512021",
                "areaType": 4,
                "areaName": "安岳县",
                "parentAreaId": "512000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "512002",
                "areaType": 4,
                "areaName": "雁江区",
                "parentAreaId": "512000",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "511400",
            "areaType": 3,
            "areaName": "眉山市",
            "parentAreaId": "510000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "511421",
                "areaType": 4,
                "areaName": "仁寿县",
                "parentAreaId": "511400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511424",
                "areaType": 4,
                "areaName": "丹棱县",
                "parentAreaId": "511400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511423",
                "areaType": 4,
                "areaName": "洪雅县",
                "parentAreaId": "511400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511402",
                "areaType": 4,
                "areaName": "东坡区",
                "parentAreaId": "511400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511425",
                "areaType": 4,
                "areaName": "青神县",
                "parentAreaId": "511400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511403",
                "areaType": 4,
                "areaName": "彭山区",
                "parentAreaId": "511400",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "511000",
            "areaType": 3,
            "areaName": "内江市",
            "parentAreaId": "510000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "511011",
                "areaType": 4,
                "areaName": "东兴区",
                "parentAreaId": "511000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511025",
                "areaType": 4,
                "areaName": "资中县",
                "parentAreaId": "511000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511024",
                "areaType": 4,
                "areaName": "威远县",
                "parentAreaId": "511000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511083",
                "areaType": 4,
                "areaName": "隆昌市",
                "parentAreaId": "511000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511002",
                "areaType": 4,
                "areaName": "市中区",
                "parentAreaId": "511000",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "511100",
            "areaType": 3,
            "areaName": "乐山市",
            "parentAreaId": "510000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "511126",
                "areaType": 4,
                "areaName": "夹江县",
                "parentAreaId": "511100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511124",
                "areaType": 4,
                "areaName": "井研县",
                "parentAreaId": "511100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511111",
                "areaType": 4,
                "areaName": "沙湾区",
                "parentAreaId": "511100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511112",
                "areaType": 4,
                "areaName": "五通桥区",
                "parentAreaId": "511100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511113",
                "areaType": 4,
                "areaName": "金口河区",
                "parentAreaId": "511100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511123",
                "areaType": 4,
                "areaName": "犍为县",
                "parentAreaId": "511100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511132",
                "areaType": 4,
                "areaName": "峨边彝族自治县",
                "parentAreaId": "511100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511129",
                "areaType": 4,
                "areaName": "沐川县",
                "parentAreaId": "511100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511102",
                "areaType": 4,
                "areaName": "市中区",
                "parentAreaId": "511100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511133",
                "areaType": 4,
                "areaName": "马边彝族自治县",
                "parentAreaId": "511100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511181",
                "areaType": 4,
                "areaName": "峨眉山市",
                "parentAreaId": "511100",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "510300",
            "areaType": 3,
            "areaName": "自贡市",
            "parentAreaId": "510000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "510321",
                "areaType": 4,
                "areaName": "荣县",
                "parentAreaId": "510300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510304",
                "areaType": 4,
                "areaName": "大安区",
                "parentAreaId": "510300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510322",
                "areaType": 4,
                "areaName": "富顺县",
                "parentAreaId": "510300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510303",
                "areaType": 4,
                "areaName": "贡井区",
                "parentAreaId": "510300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510311",
                "areaType": 4,
                "areaName": "沿滩区",
                "parentAreaId": "510300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510302",
                "areaType": 4,
                "areaName": "自流井区",
                "parentAreaId": "510300",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "510500",
            "areaType": 3,
            "areaName": "泸州市",
            "parentAreaId": "510000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "510521",
                "areaType": 4,
                "areaName": "泸县",
                "parentAreaId": "510500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510503",
                "areaType": 4,
                "areaName": "纳溪区",
                "parentAreaId": "510500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510504",
                "areaType": 4,
                "areaName": "龙马潭区",
                "parentAreaId": "510500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510524",
                "areaType": 4,
                "areaName": "叙永县",
                "parentAreaId": "510500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510525",
                "areaType": 4,
                "areaName": "古蔺县",
                "parentAreaId": "510500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510502",
                "areaType": 4,
                "areaName": "江阳区",
                "parentAreaId": "510500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510522",
                "areaType": 4,
                "areaName": "合江县",
                "parentAreaId": "510500",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "511500",
            "areaType": 3,
            "areaName": "宜宾市",
            "parentAreaId": "510000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "511525",
                "areaType": 4,
                "areaName": "高县",
                "parentAreaId": "511500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511524",
                "areaType": 4,
                "areaName": "长宁县",
                "parentAreaId": "511500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511503",
                "areaType": 4,
                "areaName": "南溪区",
                "parentAreaId": "511500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511526",
                "areaType": 4,
                "areaName": "珙县",
                "parentAreaId": "511500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511523",
                "areaType": 4,
                "areaName": "江安县",
                "parentAreaId": "511500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511528",
                "areaType": 4,
                "areaName": "兴文县",
                "parentAreaId": "511500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511527",
                "areaType": 4,
                "areaName": "筠连县",
                "parentAreaId": "511500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511502",
                "areaType": 4,
                "areaName": "翠屏区",
                "parentAreaId": "511500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511529",
                "areaType": 4,
                "areaName": "屏山县",
                "parentAreaId": "511500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511504",
                "areaType": 4,
                "areaName": "叙州区",
                "parentAreaId": "511500",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "513400",
            "areaType": 3,
            "areaName": "凉山彝族自治州",
            "parentAreaId": "510000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "513435",
                "areaType": 4,
                "areaName": "甘洛县",
                "parentAreaId": "513400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "513433",
                "areaType": 4,
                "areaName": "冕宁县",
                "parentAreaId": "513400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "513434",
                "areaType": 4,
                "areaName": "越西县",
                "parentAreaId": "513400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "513436",
                "areaType": 4,
                "areaName": "美姑县",
                "parentAreaId": "513400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "513422",
                "areaType": 4,
                "areaName": "木里藏族自治县",
                "parentAreaId": "513400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "513437",
                "areaType": 4,
                "areaName": "雷波县",
                "parentAreaId": "513400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "513432",
                "areaType": 4,
                "areaName": "喜德县",
                "parentAreaId": "513400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "513423",
                "areaType": 4,
                "areaName": "盐源县",
                "parentAreaId": "513400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "513431",
                "areaType": 4,
                "areaName": "昭觉县",
                "parentAreaId": "513400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "513401",
                "areaType": 4,
                "areaName": "西昌市",
                "parentAreaId": "513400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "513428",
                "areaType": 4,
                "areaName": "普格县",
                "parentAreaId": "513400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "513426",
                "areaType": 4,
                "areaName": "会东县",
                "parentAreaId": "513400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "513430",
                "areaType": 4,
                "areaName": "金阳县",
                "parentAreaId": "513400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "513429",
                "areaType": 4,
                "areaName": "布拖县",
                "parentAreaId": "513400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "513425",
                "areaType": 4,
                "areaName": "会理县",
                "parentAreaId": "513400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "513424",
                "areaType": 4,
                "areaName": "德昌县",
                "parentAreaId": "513400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "513427",
                "areaType": 4,
                "areaName": "宁南县",
                "parentAreaId": "513400",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "510400",
            "areaType": 3,
            "areaName": "攀枝花市",
            "parentAreaId": "510000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "510421",
                "areaType": 4,
                "areaName": "米易县",
                "parentAreaId": "510400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510403",
                "areaType": 4,
                "areaName": "西区",
                "parentAreaId": "510400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510402",
                "areaType": 4,
                "areaName": "东区",
                "parentAreaId": "510400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510422",
                "areaType": 4,
                "areaName": "盐边县",
                "parentAreaId": "510400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "510411",
                "areaType": 4,
                "areaName": "仁和区",
                "parentAreaId": "510400",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "513200",
            "areaType": 3,
            "areaName": "阿坝藏族羌族自治州",
            "parentAreaId": "510000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "513232",
                "areaType": 4,
                "areaName": "若尔盖县",
                "parentAreaId": "513200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "513225",
                "areaType": 4,
                "areaName": "九寨沟县",
                "parentAreaId": "513200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "513233",
                "areaType": 4,
                "areaName": "红原县",
                "parentAreaId": "513200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "513231",
                "areaType": 4,
                "areaName": "阿坝县",
                "parentAreaId": "513200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "513201",
                "areaType": 4,
                "areaName": "马尔康市",
                "parentAreaId": "513200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "513228",
                "areaType": 4,
                "areaName": "黑水县",
                "parentAreaId": "513200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "513226",
                "areaType": 4,
                "areaName": "金川县",
                "parentAreaId": "513200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "513222",
                "areaType": 4,
                "areaName": "理县",
                "parentAreaId": "513200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "513221",
                "areaType": 4,
                "areaName": "汶川县",
                "parentAreaId": "513200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "513224",
                "areaType": 4,
                "areaName": "松潘县",
                "parentAreaId": "513200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "513223",
                "areaType": 4,
                "areaName": "茂县",
                "parentAreaId": "513200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "513227",
                "areaType": 4,
                "areaName": "小金县",
                "parentAreaId": "513200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "513230",
                "areaType": 4,
                "areaName": "壤塘县",
                "parentAreaId": "513200",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "511800",
            "areaType": 3,
            "areaName": "雅安市",
            "parentAreaId": "510000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "511827",
                "areaType": 4,
                "areaName": "宝兴县",
                "parentAreaId": "511800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511826",
                "areaType": 4,
                "areaName": "芦山县",
                "parentAreaId": "511800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511825",
                "areaType": 4,
                "areaName": "天全县",
                "parentAreaId": "511800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511802",
                "areaType": 4,
                "areaName": "雨城区",
                "parentAreaId": "511800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511822",
                "areaType": 4,
                "areaName": "荥经县",
                "parentAreaId": "511800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511823",
                "areaType": 4,
                "areaName": "汉源县",
                "parentAreaId": "511800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511824",
                "areaType": 4,
                "areaName": "石棉县",
                "parentAreaId": "511800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "511803",
                "areaType": 4,
                "areaName": "名山区",
                "parentAreaId": "511800",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "513300",
            "areaType": 3,
            "areaName": "甘孜藏族自治州",
            "parentAreaId": "510000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "513332",
                "areaType": 4,
                "areaName": "石渠县",
                "parentAreaId": "513300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "513328",
                "areaType": 4,
                "areaName": "甘孜县",
                "parentAreaId": "513300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "513330",
                "areaType": 4,
                "areaName": "德格县",
                "parentAreaId": "513300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "513327",
                "areaType": 4,
                "areaName": "炉霍县",
                "parentAreaId": "513300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "513329",
                "areaType": 4,
                "areaName": "新龙县",
                "parentAreaId": "513300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "513331",
                "areaType": 4,
                "areaName": "白玉县",
                "parentAreaId": "513300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "513326",
                "areaType": 4,
                "areaName": "道孚县",
                "parentAreaId": "513300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "513301",
                "areaType": 4,
                "areaName": "康定市",
                "parentAreaId": "513300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "513334",
                "areaType": 4,
                "areaName": "理塘县",
                "parentAreaId": "513300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "513335",
                "areaType": 4,
                "areaName": "巴塘县",
                "parentAreaId": "513300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "513325",
                "areaType": 4,
                "areaName": "雅江县",
                "parentAreaId": "513300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "513337",
                "areaType": 4,
                "areaName": "稻城县",
                "parentAreaId": "513300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "513336",
                "areaType": 4,
                "areaName": "乡城县",
                "parentAreaId": "513300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "513324",
                "areaType": 4,
                "areaName": "九龙县",
                "parentAreaId": "513300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "513338",
                "areaType": 4,
                "areaName": "得荣县",
                "parentAreaId": "513300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "513333",
                "areaType": 4,
                "areaName": "色达县",
                "parentAreaId": "513300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "513323",
                "areaType": 4,
                "areaName": "丹巴县",
                "parentAreaId": "513300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "513322",
                "areaType": 4,
                "areaName": "泸定县",
                "parentAreaId": "513300",
                "zip": null,
                "childAreas": null
              }
            ]
          }
        ]
      },
      {
        "areaId": "520000",
        "areaType": 2,
        "areaName": "贵州省",
        "parentAreaId": "1",
        "zip": null,
        "childAreas": [
          {
            "areaId": "520300",
            "areaType": 3,
            "areaName": "遵义市",
            "parentAreaId": "520000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "520322",
                "areaType": 4,
                "areaName": "桐梓县",
                "parentAreaId": "520300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "520323",
                "areaType": 4,
                "areaName": "绥阳县",
                "parentAreaId": "520300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "520328",
                "areaType": 4,
                "areaName": "湄潭县",
                "parentAreaId": "520300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "520329",
                "areaType": 4,
                "areaName": "余庆县",
                "parentAreaId": "520300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "520303",
                "areaType": 4,
                "areaName": "汇川区",
                "parentAreaId": "520300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "520302",
                "areaType": 4,
                "areaName": "红花岗区",
                "parentAreaId": "520300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "520327",
                "areaType": 4,
                "areaName": "凤冈县",
                "parentAreaId": "520300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "520382",
                "areaType": 4,
                "areaName": "仁怀市",
                "parentAreaId": "520300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "520326",
                "areaType": 4,
                "areaName": "务川仡佬族苗族自治县",
                "parentAreaId": "520300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "520304",
                "areaType": 4,
                "areaName": "播州区",
                "parentAreaId": "520300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "520381",
                "areaType": 4,
                "areaName": "赤水市",
                "parentAreaId": "520300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "520330",
                "areaType": 4,
                "areaName": "习水县",
                "parentAreaId": "520300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "520325",
                "areaType": 4,
                "areaName": "道真仡佬族苗族自治县",
                "parentAreaId": "520300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "520324",
                "areaType": 4,
                "areaName": "正安县",
                "parentAreaId": "520300",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "520600",
            "areaType": 3,
            "areaName": "铜仁市",
            "parentAreaId": "520000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "520625",
                "areaType": 4,
                "areaName": "印江土家族苗族自治县",
                "parentAreaId": "520600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "520622",
                "areaType": 4,
                "areaName": "玉屏侗族自治县",
                "parentAreaId": "520600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "520623",
                "areaType": 4,
                "areaName": "石阡县",
                "parentAreaId": "520600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "520602",
                "areaType": 4,
                "areaName": "碧江区",
                "parentAreaId": "520600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "520626",
                "areaType": 4,
                "areaName": "德江县",
                "parentAreaId": "520600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "520624",
                "areaType": 4,
                "areaName": "思南县",
                "parentAreaId": "520600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "520627",
                "areaType": 4,
                "areaName": "沿河土家族自治县",
                "parentAreaId": "520600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "520621",
                "areaType": 4,
                "areaName": "江口县",
                "parentAreaId": "520600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "520603",
                "areaType": 4,
                "areaName": "万山区",
                "parentAreaId": "520600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "520628",
                "areaType": 4,
                "areaName": "松桃苗族自治县",
                "parentAreaId": "520600",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "520200",
            "areaType": 3,
            "areaName": "六盘水市",
            "parentAreaId": "520000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "520201",
                "areaType": 4,
                "areaName": "钟山区",
                "parentAreaId": "520200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "520203",
                "areaType": 4,
                "areaName": "六枝特区",
                "parentAreaId": "520200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "520281",
                "areaType": 4,
                "areaName": "盘州市",
                "parentAreaId": "520200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "520221",
                "areaType": 4,
                "areaName": "水城县",
                "parentAreaId": "520200",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "522700",
            "areaType": 3,
            "areaName": "黔南布依族苗族自治州",
            "parentAreaId": "520000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "522701",
                "areaType": 4,
                "areaName": "都匀市",
                "parentAreaId": "522700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "522731",
                "areaType": 4,
                "areaName": "惠水县",
                "parentAreaId": "522700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "522728",
                "areaType": 4,
                "areaName": "罗甸县",
                "parentAreaId": "522700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "522727",
                "areaType": 4,
                "areaName": "平塘县",
                "parentAreaId": "522700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "522726",
                "areaType": 4,
                "areaName": "独山县",
                "parentAreaId": "522700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "522729",
                "areaType": 4,
                "areaName": "长顺县",
                "parentAreaId": "522700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "522722",
                "areaType": 4,
                "areaName": "荔波县",
                "parentAreaId": "522700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "522702",
                "areaType": 4,
                "areaName": "福泉市",
                "parentAreaId": "522700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "522730",
                "areaType": 4,
                "areaName": "龙里县",
                "parentAreaId": "522700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "522723",
                "areaType": 4,
                "areaName": "贵定县",
                "parentAreaId": "522700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "522725",
                "areaType": 4,
                "areaName": "瓮安县",
                "parentAreaId": "522700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "522732",
                "areaType": 4,
                "areaName": "三都水族自治县",
                "parentAreaId": "522700",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "522300",
            "areaType": 3,
            "areaName": "黔西南布依族苗族自治州",
            "parentAreaId": "520000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "522302",
                "areaType": 4,
                "areaName": "兴仁市",
                "parentAreaId": "522300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "522328",
                "areaType": 4,
                "areaName": "安龙县",
                "parentAreaId": "522300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "522301",
                "areaType": 4,
                "areaName": "兴义市",
                "parentAreaId": "522300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "522327",
                "areaType": 4,
                "areaName": "册亨县",
                "parentAreaId": "522300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "522324",
                "areaType": 4,
                "areaName": "晴隆县",
                "parentAreaId": "522300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "522325",
                "areaType": 4,
                "areaName": "贞丰县",
                "parentAreaId": "522300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "522323",
                "areaType": 4,
                "areaName": "普安县",
                "parentAreaId": "522300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "522326",
                "areaType": 4,
                "areaName": "望谟县",
                "parentAreaId": "522300",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "520400",
            "areaType": 3,
            "areaName": "安顺市",
            "parentAreaId": "520000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "520402",
                "areaType": 4,
                "areaName": "西秀区",
                "parentAreaId": "520400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "520425",
                "areaType": 4,
                "areaName": "紫云苗族布依族自治县",
                "parentAreaId": "520400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "520424",
                "areaType": 4,
                "areaName": "关岭布依族苗族自治县",
                "parentAreaId": "520400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "520423",
                "areaType": 4,
                "areaName": "镇宁布依族苗族自治县",
                "parentAreaId": "520400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "520403",
                "areaType": 4,
                "areaName": "平坝区",
                "parentAreaId": "520400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "520422",
                "areaType": 4,
                "areaName": "普定县",
                "parentAreaId": "520400",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "522600",
            "areaType": 3,
            "areaName": "黔东南苗族侗族自治州",
            "parentAreaId": "520000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "522624",
                "areaType": 4,
                "areaName": "三穗县",
                "parentAreaId": "522600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "522634",
                "areaType": 4,
                "areaName": "雷山县",
                "parentAreaId": "522600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "522632",
                "areaType": 4,
                "areaName": "榕江县",
                "parentAreaId": "522600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "522627",
                "areaType": 4,
                "areaName": "天柱县",
                "parentAreaId": "522600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "522623",
                "areaType": 4,
                "areaName": "施秉县",
                "parentAreaId": "522600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "522625",
                "areaType": 4,
                "areaName": "镇远县",
                "parentAreaId": "522600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "522635",
                "areaType": 4,
                "areaName": "麻江县",
                "parentAreaId": "522600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "522601",
                "areaType": 4,
                "areaName": "凯里市",
                "parentAreaId": "522600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "522636",
                "areaType": 4,
                "areaName": "丹寨县",
                "parentAreaId": "522600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "522626",
                "areaType": 4,
                "areaName": "岑巩县",
                "parentAreaId": "522600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "522631",
                "areaType": 4,
                "areaName": "黎平县",
                "parentAreaId": "522600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "522633",
                "areaType": 4,
                "areaName": "从江县",
                "parentAreaId": "522600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "522628",
                "areaType": 4,
                "areaName": "锦屏县",
                "parentAreaId": "522600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "522629",
                "areaType": 4,
                "areaName": "剑河县",
                "parentAreaId": "522600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "522630",
                "areaType": 4,
                "areaName": "台江县",
                "parentAreaId": "522600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "522622",
                "areaType": 4,
                "areaName": "黄平县",
                "parentAreaId": "522600",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "520500",
            "areaType": 3,
            "areaName": "毕节市",
            "parentAreaId": "520000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "520521",
                "areaType": 4,
                "areaName": "大方县",
                "parentAreaId": "520500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "520502",
                "areaType": 4,
                "areaName": "七星关区",
                "parentAreaId": "520500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "520523",
                "areaType": 4,
                "areaName": "金沙县",
                "parentAreaId": "520500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "520522",
                "areaType": 4,
                "areaName": "黔西县",
                "parentAreaId": "520500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "520525",
                "areaType": 4,
                "areaName": "纳雍县",
                "parentAreaId": "520500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "520524",
                "areaType": 4,
                "areaName": "织金县",
                "parentAreaId": "520500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "520527",
                "areaType": 4,
                "areaName": "赫章县",
                "parentAreaId": "520500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "520526",
                "areaType": 4,
                "areaName": "威宁彝族回族苗族自治县",
                "parentAreaId": "520500",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "520100",
            "areaType": 3,
            "areaName": "贵阳市",
            "parentAreaId": "520000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "520121",
                "areaType": 4,
                "areaName": "开阳县",
                "parentAreaId": "520100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "520112",
                "areaType": 4,
                "areaName": "乌当区",
                "parentAreaId": "520100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "520113",
                "areaType": 4,
                "areaName": "白云区",
                "parentAreaId": "520100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "520115",
                "areaType": 4,
                "areaName": "观山湖区",
                "parentAreaId": "520100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "520122",
                "areaType": 4,
                "areaName": "息烽县",
                "parentAreaId": "520100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "520123",
                "areaType": 4,
                "areaName": "修文县",
                "parentAreaId": "520100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "520181",
                "areaType": 4,
                "areaName": "清镇市",
                "parentAreaId": "520100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "520102",
                "areaType": 4,
                "areaName": "南明区",
                "parentAreaId": "520100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "520111",
                "areaType": 4,
                "areaName": "花溪区",
                "parentAreaId": "520100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "520103",
                "areaType": 4,
                "areaName": "云岩区",
                "parentAreaId": "520100",
                "zip": null,
                "childAreas": null
              }
            ]
          }
        ]
      },
      {
        "areaId": "530000",
        "areaType": 2,
        "areaName": "云南省",
        "parentAreaId": "1",
        "zip": null,
        "childAreas": [
          {
            "areaId": "530600",
            "areaType": 3,
            "areaName": "昭通市",
            "parentAreaId": "530000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "530681",
                "areaType": 4,
                "areaName": "水富市",
                "parentAreaId": "530600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530626",
                "areaType": 4,
                "areaName": "绥江县",
                "parentAreaId": "530600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530629",
                "areaType": 4,
                "areaName": "威信县",
                "parentAreaId": "530600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530624",
                "areaType": 4,
                "areaName": "大关县",
                "parentAreaId": "530600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530625",
                "areaType": 4,
                "areaName": "永善县",
                "parentAreaId": "530600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530622",
                "areaType": 4,
                "areaName": "巧家县",
                "parentAreaId": "530600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530627",
                "areaType": 4,
                "areaName": "镇雄县",
                "parentAreaId": "530600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530628",
                "areaType": 4,
                "areaName": "彝良县",
                "parentAreaId": "530600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530602",
                "areaType": 4,
                "areaName": "昭阳区",
                "parentAreaId": "530600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530621",
                "areaType": 4,
                "areaName": "鲁甸县",
                "parentAreaId": "530600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530623",
                "areaType": 4,
                "areaName": "盐津县",
                "parentAreaId": "530600",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "530300",
            "areaType": 3,
            "areaName": "曲靖市",
            "parentAreaId": "530000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "530326",
                "areaType": 4,
                "areaName": "会泽县",
                "parentAreaId": "530300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530304",
                "areaType": 4,
                "areaName": "马龙区",
                "parentAreaId": "530300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530324",
                "areaType": 4,
                "areaName": "罗平县",
                "parentAreaId": "530300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530322",
                "areaType": 4,
                "areaName": "陆良县",
                "parentAreaId": "530300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530323",
                "areaType": 4,
                "areaName": "师宗县",
                "parentAreaId": "530300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530325",
                "areaType": 4,
                "areaName": "富源县",
                "parentAreaId": "530300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530381",
                "areaType": 4,
                "areaName": "宣威市",
                "parentAreaId": "530300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530303",
                "areaType": 4,
                "areaName": "沾益区",
                "parentAreaId": "530300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530302",
                "areaType": 4,
                "areaName": "麒麟区",
                "parentAreaId": "530300",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "532500",
            "areaType": 3,
            "areaName": "红河哈尼族彝族自治州",
            "parentAreaId": "530000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "532527",
                "areaType": 4,
                "areaName": "泸西县",
                "parentAreaId": "532500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "532504",
                "areaType": 4,
                "areaName": "弥勒市",
                "parentAreaId": "532500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "532525",
                "areaType": 4,
                "areaName": "石屏县",
                "parentAreaId": "532500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "532524",
                "areaType": 4,
                "areaName": "建水县",
                "parentAreaId": "532500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "532502",
                "areaType": 4,
                "areaName": "开远市",
                "parentAreaId": "532500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "532501",
                "areaType": 4,
                "areaName": "个旧市",
                "parentAreaId": "532500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "532503",
                "areaType": 4,
                "areaName": "蒙自市",
                "parentAreaId": "532500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "532529",
                "areaType": 4,
                "areaName": "红河县",
                "parentAreaId": "532500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "532523",
                "areaType": 4,
                "areaName": "屏边苗族自治县",
                "parentAreaId": "532500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "532531",
                "areaType": 4,
                "areaName": "绿春县",
                "parentAreaId": "532500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "532528",
                "areaType": 4,
                "areaName": "元阳县",
                "parentAreaId": "532500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "532530",
                "areaType": 4,
                "areaName": "金平苗族瑶族傣族自治县",
                "parentAreaId": "532500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "532532",
                "areaType": 4,
                "areaName": "河口瑶族自治县",
                "parentAreaId": "532500",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "533300",
            "areaType": 3,
            "areaName": "怒江傈僳族自治州",
            "parentAreaId": "530000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "533324",
                "areaType": 4,
                "areaName": "贡山独龙族怒族自治县",
                "parentAreaId": "533300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "533323",
                "areaType": 4,
                "areaName": "福贡县",
                "parentAreaId": "533300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "533325",
                "areaType": 4,
                "areaName": "兰坪白族普米族自治县",
                "parentAreaId": "533300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "533301",
                "areaType": 4,
                "areaName": "泸水市",
                "parentAreaId": "533300",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "532800",
            "areaType": 3,
            "areaName": "西双版纳傣族自治州",
            "parentAreaId": "530000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "532822",
                "areaType": 4,
                "areaName": "勐海县",
                "parentAreaId": "532800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "532801",
                "areaType": 4,
                "areaName": "景洪市",
                "parentAreaId": "532800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "532823",
                "areaType": 4,
                "areaName": "勐腊县",
                "parentAreaId": "532800",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "530400",
            "areaType": 3,
            "areaName": "玉溪市",
            "parentAreaId": "530000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "530481",
                "areaType": 4,
                "areaName": "澄江市",
                "parentAreaId": "530400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530425",
                "areaType": 4,
                "areaName": "易门县",
                "parentAreaId": "530400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530424",
                "areaType": 4,
                "areaName": "华宁县",
                "parentAreaId": "530400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530426",
                "areaType": 4,
                "areaName": "峨山彝族自治县",
                "parentAreaId": "530400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530403",
                "areaType": 4,
                "areaName": "江川区",
                "parentAreaId": "530400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530402",
                "areaType": 4,
                "areaName": "红塔区",
                "parentAreaId": "530400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530423",
                "areaType": 4,
                "areaName": "通海县",
                "parentAreaId": "530400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530427",
                "areaType": 4,
                "areaName": "新平彝族傣族自治县",
                "parentAreaId": "530400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530428",
                "areaType": 4,
                "areaName": "元江哈尼族彝族傣族自治县",
                "parentAreaId": "530400",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "532900",
            "areaType": 3,
            "areaName": "大理白族自治州",
            "parentAreaId": "530000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "532932",
                "areaType": 4,
                "areaName": "鹤庆县",
                "parentAreaId": "532900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "532931",
                "areaType": 4,
                "areaName": "剑川县",
                "parentAreaId": "532900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "532930",
                "areaType": 4,
                "areaName": "洱源县",
                "parentAreaId": "532900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "532924",
                "areaType": 4,
                "areaName": "宾川县",
                "parentAreaId": "532900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "532929",
                "areaType": 4,
                "areaName": "云龙县",
                "parentAreaId": "532900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "532923",
                "areaType": 4,
                "areaName": "祥云县",
                "parentAreaId": "532900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "532901",
                "areaType": 4,
                "areaName": "大理市",
                "parentAreaId": "532900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "532922",
                "areaType": 4,
                "areaName": "漾濞彝族自治县",
                "parentAreaId": "532900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "532928",
                "areaType": 4,
                "areaName": "永平县",
                "parentAreaId": "532900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "532925",
                "areaType": 4,
                "areaName": "弥渡县",
                "parentAreaId": "532900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "532927",
                "areaType": 4,
                "areaName": "巍山彝族回族自治县",
                "parentAreaId": "532900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "532926",
                "areaType": 4,
                "areaName": "南涧彝族自治县",
                "parentAreaId": "532900",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "530700",
            "areaType": 3,
            "areaName": "丽江市",
            "parentAreaId": "530000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "530724",
                "areaType": 4,
                "areaName": "宁蒗彝族自治县",
                "parentAreaId": "530700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530721",
                "areaType": 4,
                "areaName": "玉龙纳西族自治县",
                "parentAreaId": "530700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530702",
                "areaType": 4,
                "areaName": "古城区",
                "parentAreaId": "530700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530722",
                "areaType": 4,
                "areaName": "永胜县",
                "parentAreaId": "530700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530723",
                "areaType": 4,
                "areaName": "华坪县",
                "parentAreaId": "530700",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "533400",
            "areaType": 3,
            "areaName": "迪庆藏族自治州",
            "parentAreaId": "530000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "533422",
                "areaType": 4,
                "areaName": "德钦县",
                "parentAreaId": "533400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "533401",
                "areaType": 4,
                "areaName": "香格里拉市",
                "parentAreaId": "533400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "533423",
                "areaType": 4,
                "areaName": "维西傈僳族自治县",
                "parentAreaId": "533400",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "532600",
            "areaType": 3,
            "areaName": "文山壮族苗族自治州",
            "parentAreaId": "530000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "532626",
                "areaType": 4,
                "areaName": "丘北县",
                "parentAreaId": "532600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "532627",
                "areaType": 4,
                "areaName": "广南县",
                "parentAreaId": "532600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "532622",
                "areaType": 4,
                "areaName": "砚山县",
                "parentAreaId": "532600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "532601",
                "areaType": 4,
                "areaName": "文山市",
                "parentAreaId": "532600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "532623",
                "areaType": 4,
                "areaName": "西畴县",
                "parentAreaId": "532600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "532624",
                "areaType": 4,
                "areaName": "麻栗坡县",
                "parentAreaId": "532600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "532625",
                "areaType": 4,
                "areaName": "马关县",
                "parentAreaId": "532600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "532628",
                "areaType": 4,
                "areaName": "富宁县",
                "parentAreaId": "532600",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "530500",
            "areaType": 3,
            "areaName": "保山市",
            "parentAreaId": "530000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "530581",
                "areaType": 4,
                "areaName": "腾冲市",
                "parentAreaId": "530500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530502",
                "areaType": 4,
                "areaName": "隆阳区",
                "parentAreaId": "530500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530524",
                "areaType": 4,
                "areaName": "昌宁县",
                "parentAreaId": "530500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530521",
                "areaType": 4,
                "areaName": "施甸县",
                "parentAreaId": "530500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530523",
                "areaType": 4,
                "areaName": "龙陵县",
                "parentAreaId": "530500",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "530800",
            "areaType": 3,
            "areaName": "普洱市",
            "parentAreaId": "530000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "530823",
                "areaType": 4,
                "areaName": "景东彝族自治县",
                "parentAreaId": "530800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530825",
                "areaType": 4,
                "areaName": "镇沅彝族哈尼族拉祜族自治县",
                "parentAreaId": "530800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530822",
                "areaType": 4,
                "areaName": "墨江哈尼族自治县",
                "parentAreaId": "530800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530824",
                "areaType": 4,
                "areaName": "景谷傣族彝族自治县",
                "parentAreaId": "530800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530821",
                "areaType": 4,
                "areaName": "宁洱哈尼族彝族自治县",
                "parentAreaId": "530800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530828",
                "areaType": 4,
                "areaName": "澜沧拉祜族自治县",
                "parentAreaId": "530800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530802",
                "areaType": 4,
                "areaName": "思茅区",
                "parentAreaId": "530800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530827",
                "areaType": 4,
                "areaName": "孟连傣族拉祜族佤族自治县",
                "parentAreaId": "530800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530829",
                "areaType": 4,
                "areaName": "西盟佤族自治县",
                "parentAreaId": "530800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530826",
                "areaType": 4,
                "areaName": "江城哈尼族彝族自治县",
                "parentAreaId": "530800",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "530100",
            "areaType": 3,
            "areaName": "昆明市",
            "parentAreaId": "530000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "530113",
                "areaType": 4,
                "areaName": "东川区",
                "parentAreaId": "530100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530129",
                "areaType": 4,
                "areaName": "寻甸回族彝族自治县",
                "parentAreaId": "530100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530102",
                "areaType": 4,
                "areaName": "五华区",
                "parentAreaId": "530100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530125",
                "areaType": 4,
                "areaName": "宜良县",
                "parentAreaId": "530100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530112",
                "areaType": 4,
                "areaName": "西山区",
                "parentAreaId": "530100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530126",
                "areaType": 4,
                "areaName": "石林彝族自治县",
                "parentAreaId": "530100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530114",
                "areaType": 4,
                "areaName": "呈贡区",
                "parentAreaId": "530100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530115",
                "areaType": 4,
                "areaName": "晋宁区",
                "parentAreaId": "530100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530181",
                "areaType": 4,
                "areaName": "安宁市",
                "parentAreaId": "530100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530124",
                "areaType": 4,
                "areaName": "富民县",
                "parentAreaId": "530100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530128",
                "areaType": 4,
                "areaName": "禄劝彝族苗族自治县",
                "parentAreaId": "530100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530111",
                "areaType": 4,
                "areaName": "官渡区",
                "parentAreaId": "530100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530127",
                "areaType": 4,
                "areaName": "嵩明县",
                "parentAreaId": "530100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530103",
                "areaType": 4,
                "areaName": "盘龙区",
                "parentAreaId": "530100",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "532300",
            "areaType": 3,
            "areaName": "楚雄彝族自治州",
            "parentAreaId": "530000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "532326",
                "areaType": 4,
                "areaName": "大姚县",
                "parentAreaId": "532300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "532328",
                "areaType": 4,
                "areaName": "元谋县",
                "parentAreaId": "532300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "532323",
                "areaType": 4,
                "areaName": "牟定县",
                "parentAreaId": "532300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "532325",
                "areaType": 4,
                "areaName": "姚安县",
                "parentAreaId": "532300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "532331",
                "areaType": 4,
                "areaName": "禄丰县",
                "parentAreaId": "532300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "532324",
                "areaType": 4,
                "areaName": "南华县",
                "parentAreaId": "532300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "532301",
                "areaType": 4,
                "areaName": "楚雄市",
                "parentAreaId": "532300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "532322",
                "areaType": 4,
                "areaName": "双柏县",
                "parentAreaId": "532300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "532329",
                "areaType": 4,
                "areaName": "武定县",
                "parentAreaId": "532300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "532327",
                "areaType": 4,
                "areaName": "永仁县",
                "parentAreaId": "532300",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "530900",
            "areaType": 3,
            "areaName": "临沧市",
            "parentAreaId": "530000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "530921",
                "areaType": 4,
                "areaName": "凤庆县",
                "parentAreaId": "530900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530922",
                "areaType": 4,
                "areaName": "云县",
                "parentAreaId": "530900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530923",
                "areaType": 4,
                "areaName": "永德县",
                "parentAreaId": "530900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530902",
                "areaType": 4,
                "areaName": "临翔区",
                "parentAreaId": "530900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530924",
                "areaType": 4,
                "areaName": "镇康县",
                "parentAreaId": "530900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530926",
                "areaType": 4,
                "areaName": "耿马傣族佤族自治县",
                "parentAreaId": "530900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530925",
                "areaType": 4,
                "areaName": "双江拉祜族佤族布朗族傣族自治县",
                "parentAreaId": "530900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "530927",
                "areaType": 4,
                "areaName": "沧源佤族自治县",
                "parentAreaId": "530900",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "533100",
            "areaType": 3,
            "areaName": "德宏傣族景颇族自治州",
            "parentAreaId": "530000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "533123",
                "areaType": 4,
                "areaName": "盈江县",
                "parentAreaId": "533100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "533122",
                "areaType": 4,
                "areaName": "梁河县",
                "parentAreaId": "533100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "533103",
                "areaType": 4,
                "areaName": "芒市",
                "parentAreaId": "533100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "533124",
                "areaType": 4,
                "areaName": "陇川县",
                "parentAreaId": "533100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "533102",
                "areaType": 4,
                "areaName": "瑞丽市",
                "parentAreaId": "533100",
                "zip": null,
                "childAreas": null
              }
            ]
          }
        ]
      },
      {
        "areaId": "610000",
        "areaType": 2,
        "areaName": "陕西省",
        "parentAreaId": "1",
        "zip": null,
        "childAreas": [
          {
            "areaId": "611000",
            "areaType": 3,
            "areaName": "商洛市",
            "parentAreaId": "610000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "611022",
                "areaType": 4,
                "areaName": "丹凤县",
                "parentAreaId": "611000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "611026",
                "areaType": 4,
                "areaName": "柞水县",
                "parentAreaId": "611000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "611023",
                "areaType": 4,
                "areaName": "商南县",
                "parentAreaId": "611000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "611024",
                "areaType": 4,
                "areaName": "山阳县",
                "parentAreaId": "611000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "611025",
                "areaType": 4,
                "areaName": "镇安县",
                "parentAreaId": "611000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "611002",
                "areaType": 4,
                "areaName": "商州区",
                "parentAreaId": "611000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "611021",
                "areaType": 4,
                "areaName": "洛南县",
                "parentAreaId": "611000",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "610100",
            "areaType": 3,
            "areaName": "西安市",
            "parentAreaId": "610000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "610115",
                "areaType": 4,
                "areaName": "临潼区",
                "parentAreaId": "610100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610117",
                "areaType": 4,
                "areaName": "高陵区",
                "parentAreaId": "610100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610122",
                "areaType": 4,
                "areaName": "蓝田县",
                "parentAreaId": "610100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610118",
                "areaType": 4,
                "areaName": "鄠邑区",
                "parentAreaId": "610100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610116",
                "areaType": 4,
                "areaName": "长安区",
                "parentAreaId": "610100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610112",
                "areaType": 4,
                "areaName": "未央区",
                "parentAreaId": "610100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610104",
                "areaType": 4,
                "areaName": "莲湖区",
                "parentAreaId": "610100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610102",
                "areaType": 4,
                "areaName": "新城区",
                "parentAreaId": "610100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610111",
                "areaType": 4,
                "areaName": "灞桥区",
                "parentAreaId": "610100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610103",
                "areaType": 4,
                "areaName": "碑林区",
                "parentAreaId": "610100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610124",
                "areaType": 4,
                "areaName": "周至县",
                "parentAreaId": "610100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610113",
                "areaType": 4,
                "areaName": "雁塔区",
                "parentAreaId": "610100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610114",
                "areaType": 4,
                "areaName": "阎良区",
                "parentAreaId": "610100",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "610700",
            "areaType": 3,
            "areaName": "汉中市",
            "parentAreaId": "610000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "610729",
                "areaType": 4,
                "areaName": "留坝县",
                "parentAreaId": "610700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610730",
                "areaType": 4,
                "areaName": "佛坪县",
                "parentAreaId": "610700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610723",
                "areaType": 4,
                "areaName": "洋县",
                "parentAreaId": "610700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610727",
                "areaType": 4,
                "areaName": "略阳县",
                "parentAreaId": "610700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610724",
                "areaType": 4,
                "areaName": "西乡县",
                "parentAreaId": "610700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610728",
                "areaType": 4,
                "areaName": "镇巴县",
                "parentAreaId": "610700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610726",
                "areaType": 4,
                "areaName": "宁强县",
                "parentAreaId": "610700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610725",
                "areaType": 4,
                "areaName": "勉县",
                "parentAreaId": "610700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610702",
                "areaType": 4,
                "areaName": "汉台区",
                "parentAreaId": "610700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610722",
                "areaType": 4,
                "areaName": "城固县",
                "parentAreaId": "610700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610703",
                "areaType": 4,
                "areaName": "南郑区",
                "parentAreaId": "610700",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "610200",
            "areaType": 3,
            "areaName": "铜川市",
            "parentAreaId": "610000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "610222",
                "areaType": 4,
                "areaName": "宜君县",
                "parentAreaId": "610200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610203",
                "areaType": 4,
                "areaName": "印台区",
                "parentAreaId": "610200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610204",
                "areaType": 4,
                "areaName": "耀州区",
                "parentAreaId": "610200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610202",
                "areaType": 4,
                "areaName": "王益区",
                "parentAreaId": "610200",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "610900",
            "areaType": 3,
            "areaName": "安康市",
            "parentAreaId": "610000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "610923",
                "areaType": 4,
                "areaName": "宁陕县",
                "parentAreaId": "610900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610929",
                "areaType": 4,
                "areaName": "白河县",
                "parentAreaId": "610900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610902",
                "areaType": 4,
                "areaName": "汉滨区",
                "parentAreaId": "610900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610922",
                "areaType": 4,
                "areaName": "石泉县",
                "parentAreaId": "610900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610921",
                "areaType": 4,
                "areaName": "汉阴县",
                "parentAreaId": "610900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610924",
                "areaType": 4,
                "areaName": "紫阳县",
                "parentAreaId": "610900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610928",
                "areaType": 4,
                "areaName": "旬阳县",
                "parentAreaId": "610900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610927",
                "areaType": 4,
                "areaName": "镇坪县",
                "parentAreaId": "610900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610926",
                "areaType": 4,
                "areaName": "平利县",
                "parentAreaId": "610900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610925",
                "areaType": 4,
                "areaName": "岚皋县",
                "parentAreaId": "610900",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "610800",
            "areaType": 3,
            "areaName": "榆林市",
            "parentAreaId": "610000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "610827",
                "areaType": 4,
                "areaName": "米脂县",
                "parentAreaId": "610800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610802",
                "areaType": 4,
                "areaName": "榆阳区",
                "parentAreaId": "610800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610828",
                "areaType": 4,
                "areaName": "佳县",
                "parentAreaId": "610800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610822",
                "areaType": 4,
                "areaName": "府谷县",
                "parentAreaId": "610800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610803",
                "areaType": 4,
                "areaName": "横山区",
                "parentAreaId": "610800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610881",
                "areaType": 4,
                "areaName": "神木市",
                "parentAreaId": "610800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610831",
                "areaType": 4,
                "areaName": "子洲县",
                "parentAreaId": "610800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610824",
                "areaType": 4,
                "areaName": "靖边县",
                "parentAreaId": "610800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610826",
                "areaType": 4,
                "areaName": "绥德县",
                "parentAreaId": "610800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610830",
                "areaType": 4,
                "areaName": "清涧县",
                "parentAreaId": "610800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610829",
                "areaType": 4,
                "areaName": "吴堡县",
                "parentAreaId": "610800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610825",
                "areaType": 4,
                "areaName": "定边县",
                "parentAreaId": "610800",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "610400",
            "areaType": 3,
            "areaName": "咸阳市",
            "parentAreaId": "610000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "610429",
                "areaType": 4,
                "areaName": "旬邑县",
                "parentAreaId": "610400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610482",
                "areaType": 4,
                "areaName": "彬州市",
                "parentAreaId": "610400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610430",
                "areaType": 4,
                "areaName": "淳化县",
                "parentAreaId": "610400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610426",
                "areaType": 4,
                "areaName": "永寿县",
                "parentAreaId": "610400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610424",
                "areaType": 4,
                "areaName": "乾县",
                "parentAreaId": "610400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610404",
                "areaType": 4,
                "areaName": "渭城区",
                "parentAreaId": "610400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610423",
                "areaType": 4,
                "areaName": "泾阳县",
                "parentAreaId": "610400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610431",
                "areaType": 4,
                "areaName": "武功县",
                "parentAreaId": "610400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610428",
                "areaType": 4,
                "areaName": "长武县",
                "parentAreaId": "610400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610402",
                "areaType": 4,
                "areaName": "秦都区",
                "parentAreaId": "610400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610481",
                "areaType": 4,
                "areaName": "兴平市",
                "parentAreaId": "610400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610425",
                "areaType": 4,
                "areaName": "礼泉县",
                "parentAreaId": "610400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610403",
                "areaType": 4,
                "areaName": "杨陵区",
                "parentAreaId": "610400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610422",
                "areaType": 4,
                "areaName": "三原县",
                "parentAreaId": "610400",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "610600",
            "areaType": 3,
            "areaName": "延安市",
            "parentAreaId": "610000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "610681",
                "areaType": 4,
                "areaName": "子长市",
                "parentAreaId": "610600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610626",
                "areaType": 4,
                "areaName": "吴起县",
                "parentAreaId": "610600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610603",
                "areaType": 4,
                "areaName": "安塞区",
                "parentAreaId": "610600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610625",
                "areaType": 4,
                "areaName": "志丹县",
                "parentAreaId": "610600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610622",
                "areaType": 4,
                "areaName": "延川县",
                "parentAreaId": "610600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610602",
                "areaType": 4,
                "areaName": "宝塔区",
                "parentAreaId": "610600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610621",
                "areaType": 4,
                "areaName": "延长县",
                "parentAreaId": "610600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610627",
                "areaType": 4,
                "areaName": "甘泉县",
                "parentAreaId": "610600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610630",
                "areaType": 4,
                "areaName": "宜川县",
                "parentAreaId": "610600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610628",
                "areaType": 4,
                "areaName": "富县",
                "parentAreaId": "610600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610629",
                "areaType": 4,
                "areaName": "洛川县",
                "parentAreaId": "610600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610632",
                "areaType": 4,
                "areaName": "黄陵县",
                "parentAreaId": "610600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610631",
                "areaType": 4,
                "areaName": "黄龙县",
                "parentAreaId": "610600",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "610300",
            "areaType": 3,
            "areaName": "宝鸡市",
            "parentAreaId": "610000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "610329",
                "areaType": 4,
                "areaName": "麟游县",
                "parentAreaId": "610300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610328",
                "areaType": 4,
                "areaName": "千阳县",
                "parentAreaId": "610300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610327",
                "areaType": 4,
                "areaName": "陇县",
                "parentAreaId": "610300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610323",
                "areaType": 4,
                "areaName": "岐山县",
                "parentAreaId": "610300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610302",
                "areaType": 4,
                "areaName": "渭滨区",
                "parentAreaId": "610300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610303",
                "areaType": 4,
                "areaName": "金台区",
                "parentAreaId": "610300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610330",
                "areaType": 4,
                "areaName": "凤县",
                "parentAreaId": "610300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610331",
                "areaType": 4,
                "areaName": "太白县",
                "parentAreaId": "610300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610304",
                "areaType": 4,
                "areaName": "陈仓区",
                "parentAreaId": "610300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610322",
                "areaType": 4,
                "areaName": "凤翔县",
                "parentAreaId": "610300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610324",
                "areaType": 4,
                "areaName": "扶风县",
                "parentAreaId": "610300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610326",
                "areaType": 4,
                "areaName": "眉县",
                "parentAreaId": "610300",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "610500",
            "areaType": 3,
            "areaName": "渭南市",
            "parentAreaId": "610000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "610581",
                "areaType": 4,
                "areaName": "韩城市",
                "parentAreaId": "610500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610527",
                "areaType": 4,
                "areaName": "白水县",
                "parentAreaId": "610500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610523",
                "areaType": 4,
                "areaName": "大荔县",
                "parentAreaId": "610500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610582",
                "areaType": 4,
                "areaName": "华阴市",
                "parentAreaId": "610500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610503",
                "areaType": 4,
                "areaName": "华州区",
                "parentAreaId": "610500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610522",
                "areaType": 4,
                "areaName": "潼关县",
                "parentAreaId": "610500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610525",
                "areaType": 4,
                "areaName": "澄城县",
                "parentAreaId": "610500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610526",
                "areaType": 4,
                "areaName": "蒲城县",
                "parentAreaId": "610500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610502",
                "areaType": 4,
                "areaName": "临渭区",
                "parentAreaId": "610500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610524",
                "areaType": 4,
                "areaName": "合阳县",
                "parentAreaId": "610500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "610528",
                "areaType": 4,
                "areaName": "富平县",
                "parentAreaId": "610500",
                "zip": null,
                "childAreas": null
              }
            ]
          }
        ]
      },
      {
        "areaId": "620000",
        "areaType": 2,
        "areaName": "甘肃省",
        "parentAreaId": "1",
        "zip": null,
        "childAreas": [
          {
            "areaId": "620200",
            "areaType": 3,
            "areaName": "嘉峪关市",
            "parentAreaId": "620000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "6202001",
                "areaType": 4,
                "areaName": "峪泉镇",
                "parentAreaId": "620200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6202002",
                "areaType": 4,
                "areaName": "新城镇",
                "parentAreaId": "620200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6202003",
                "areaType": 4,
                "areaName": "文殊镇",
                "parentAreaId": "620200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6202004",
                "areaType": 4,
                "areaName": "钢城街道",
                "parentAreaId": "620200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6202005",
                "areaType": 4,
                "areaName": "雄关街道",
                "parentAreaId": "620200",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "620900",
            "areaType": 3,
            "areaName": "酒泉市",
            "parentAreaId": "620000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "620923",
                "areaType": 4,
                "areaName": "肃北蒙古族自治县",
                "parentAreaId": "620900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "620982",
                "areaType": 4,
                "areaName": "敦煌市",
                "parentAreaId": "620900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "620921",
                "areaType": 4,
                "areaName": "金塔县",
                "parentAreaId": "620900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "620981",
                "areaType": 4,
                "areaName": "玉门市",
                "parentAreaId": "620900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "620902",
                "areaType": 4,
                "areaName": "肃州区",
                "parentAreaId": "620900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "620922",
                "areaType": 4,
                "areaName": "瓜州县",
                "parentAreaId": "620900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "620924",
                "areaType": 4,
                "areaName": "阿克塞哈萨克族自治县",
                "parentAreaId": "620900",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "620300",
            "areaType": 3,
            "areaName": "金昌市",
            "parentAreaId": "620000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "620321",
                "areaType": 4,
                "areaName": "永昌县",
                "parentAreaId": "620300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "620302",
                "areaType": 4,
                "areaName": "金川区",
                "parentAreaId": "620300",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "620100",
            "areaType": 3,
            "areaName": "兰州市",
            "parentAreaId": "620000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "620121",
                "areaType": 4,
                "areaName": "永登县",
                "parentAreaId": "620100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "620122",
                "areaType": 4,
                "areaName": "皋兰县",
                "parentAreaId": "620100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "620111",
                "areaType": 4,
                "areaName": "红古区",
                "parentAreaId": "620100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "620105",
                "areaType": 4,
                "areaName": "安宁区",
                "parentAreaId": "620100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "620102",
                "areaType": 4,
                "areaName": "城关区",
                "parentAreaId": "620100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "620104",
                "areaType": 4,
                "areaName": "西固区",
                "parentAreaId": "620100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "620103",
                "areaType": 4,
                "areaName": "七里河区",
                "parentAreaId": "620100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "620123",
                "areaType": 4,
                "areaName": "榆中县",
                "parentAreaId": "620100",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "620800",
            "areaType": 3,
            "areaName": "平凉市",
            "parentAreaId": "620000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "620802",
                "areaType": 4,
                "areaName": "崆峒区",
                "parentAreaId": "620800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "620825",
                "areaType": 4,
                "areaName": "庄浪县",
                "parentAreaId": "620800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "620823",
                "areaType": 4,
                "areaName": "崇信县",
                "parentAreaId": "620800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "620822",
                "areaType": 4,
                "areaName": "灵台县",
                "parentAreaId": "620800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "620826",
                "areaType": 4,
                "areaName": "静宁县",
                "parentAreaId": "620800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "620881",
                "areaType": 4,
                "areaName": "华亭市",
                "parentAreaId": "620800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "620821",
                "areaType": 4,
                "areaName": "泾川县",
                "parentAreaId": "620800",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "620400",
            "areaType": 3,
            "areaName": "白银市",
            "parentAreaId": "620000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "620403",
                "areaType": 4,
                "areaName": "平川区",
                "parentAreaId": "620400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "620421",
                "areaType": 4,
                "areaName": "靖远县",
                "parentAreaId": "620400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "620402",
                "areaType": 4,
                "areaName": "白银区",
                "parentAreaId": "620400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "620422",
                "areaType": 4,
                "areaName": "会宁县",
                "parentAreaId": "620400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "620423",
                "areaType": 4,
                "areaName": "景泰县",
                "parentAreaId": "620400",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "620600",
            "areaType": 3,
            "areaName": "武威市",
            "parentAreaId": "620000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "620623",
                "areaType": 4,
                "areaName": "天祝藏族自治县",
                "parentAreaId": "620600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "620622",
                "areaType": 4,
                "areaName": "古浪县",
                "parentAreaId": "620600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "620602",
                "areaType": 4,
                "areaName": "凉州区",
                "parentAreaId": "620600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "620621",
                "areaType": 4,
                "areaName": "民勤县",
                "parentAreaId": "620600",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "621200",
            "areaType": 3,
            "areaName": "陇南市",
            "parentAreaId": "620000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "621226",
                "areaType": 4,
                "areaName": "礼县",
                "parentAreaId": "621200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "621223",
                "areaType": 4,
                "areaName": "宕昌县",
                "parentAreaId": "621200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "621228",
                "areaType": 4,
                "areaName": "两当县",
                "parentAreaId": "621200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "621227",
                "areaType": 4,
                "areaName": "徽县",
                "parentAreaId": "621200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "621221",
                "areaType": 4,
                "areaName": "成县",
                "parentAreaId": "621200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "621202",
                "areaType": 4,
                "areaName": "武都区",
                "parentAreaId": "621200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "621224",
                "areaType": 4,
                "areaName": "康县",
                "parentAreaId": "621200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "621222",
                "areaType": 4,
                "areaName": "文县",
                "parentAreaId": "621200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "621225",
                "areaType": 4,
                "areaName": "西和县",
                "parentAreaId": "621200",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "623000",
            "areaType": 3,
            "areaName": "甘南藏族自治州",
            "parentAreaId": "620000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "623027",
                "areaType": 4,
                "areaName": "夏河县",
                "parentAreaId": "623000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "623001",
                "areaType": 4,
                "areaName": "合作市",
                "parentAreaId": "623000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "623021",
                "areaType": 4,
                "areaName": "临潭县",
                "parentAreaId": "623000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "623022",
                "areaType": 4,
                "areaName": "卓尼县",
                "parentAreaId": "623000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "623025",
                "areaType": 4,
                "areaName": "玛曲县",
                "parentAreaId": "623000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "623024",
                "areaType": 4,
                "areaName": "迭部县",
                "parentAreaId": "623000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "623023",
                "areaType": 4,
                "areaName": "舟曲县",
                "parentAreaId": "623000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "623026",
                "areaType": 4,
                "areaName": "碌曲县",
                "parentAreaId": "623000",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "622900",
            "areaType": 3,
            "areaName": "临夏回族自治州",
            "parentAreaId": "620000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "622926",
                "areaType": 4,
                "areaName": "东乡族自治县",
                "parentAreaId": "622900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "622927",
                "areaType": 4,
                "areaName": "积石山保安族东乡族撒拉族自治县",
                "parentAreaId": "622900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "622923",
                "areaType": 4,
                "areaName": "永靖县",
                "parentAreaId": "622900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "622921",
                "areaType": 4,
                "areaName": "临夏县",
                "parentAreaId": "622900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "622901",
                "areaType": 4,
                "areaName": "临夏市",
                "parentAreaId": "622900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "622924",
                "areaType": 4,
                "areaName": "广河县",
                "parentAreaId": "622900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "622925",
                "areaType": 4,
                "areaName": "和政县",
                "parentAreaId": "622900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "622922",
                "areaType": 4,
                "areaName": "康乐县",
                "parentAreaId": "622900",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "620700",
            "areaType": 3,
            "areaName": "张掖市",
            "parentAreaId": "620000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "620724",
                "areaType": 4,
                "areaName": "高台县",
                "parentAreaId": "620700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "620721",
                "areaType": 4,
                "areaName": "肃南裕固族自治县",
                "parentAreaId": "620700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "620725",
                "areaType": 4,
                "areaName": "山丹县",
                "parentAreaId": "620700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "620722",
                "areaType": 4,
                "areaName": "民乐县",
                "parentAreaId": "620700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "620723",
                "areaType": 4,
                "areaName": "临泽县",
                "parentAreaId": "620700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "620702",
                "areaType": 4,
                "areaName": "甘州区",
                "parentAreaId": "620700",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "621000",
            "areaType": 3,
            "areaName": "庆阳市",
            "parentAreaId": "620000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "621025",
                "areaType": 4,
                "areaName": "正宁县",
                "parentAreaId": "621000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "621022",
                "areaType": 4,
                "areaName": "环县",
                "parentAreaId": "621000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "621027",
                "areaType": 4,
                "areaName": "镇原县",
                "parentAreaId": "621000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "621023",
                "areaType": 4,
                "areaName": "华池县",
                "parentAreaId": "621000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "621026",
                "areaType": 4,
                "areaName": "宁县",
                "parentAreaId": "621000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "621021",
                "areaType": 4,
                "areaName": "庆城县",
                "parentAreaId": "621000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "621024",
                "areaType": 4,
                "areaName": "合水县",
                "parentAreaId": "621000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "621002",
                "areaType": 4,
                "areaName": "西峰区",
                "parentAreaId": "621000",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "620500",
            "areaType": 3,
            "areaName": "天水市",
            "parentAreaId": "620000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "620522",
                "areaType": 4,
                "areaName": "秦安县",
                "parentAreaId": "620500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "620523",
                "areaType": 4,
                "areaName": "甘谷县",
                "parentAreaId": "620500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "620502",
                "areaType": 4,
                "areaName": "秦州区",
                "parentAreaId": "620500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "620503",
                "areaType": 4,
                "areaName": "麦积区",
                "parentAreaId": "620500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "620525",
                "areaType": 4,
                "areaName": "张家川回族自治县",
                "parentAreaId": "620500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "620521",
                "areaType": 4,
                "areaName": "清水县",
                "parentAreaId": "620500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "620524",
                "areaType": 4,
                "areaName": "武山县",
                "parentAreaId": "620500",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "621100",
            "areaType": 3,
            "areaName": "定西市",
            "parentAreaId": "620000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "621124",
                "areaType": 4,
                "areaName": "临洮县",
                "parentAreaId": "621100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "621123",
                "areaType": 4,
                "areaName": "渭源县",
                "parentAreaId": "621100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "621126",
                "areaType": 4,
                "areaName": "岷县",
                "parentAreaId": "621100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "621125",
                "areaType": 4,
                "areaName": "漳县",
                "parentAreaId": "621100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "621102",
                "areaType": 4,
                "areaName": "安定区",
                "parentAreaId": "621100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "621121",
                "areaType": 4,
                "areaName": "通渭县",
                "parentAreaId": "621100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "621122",
                "areaType": 4,
                "areaName": "陇西县",
                "parentAreaId": "621100",
                "zip": null,
                "childAreas": null
              }
            ]
          }
        ]
      },
      {
        "areaId": "630000",
        "areaType": 2,
        "areaName": "青海省",
        "parentAreaId": "1",
        "zip": null,
        "childAreas": [
          {
            "areaId": "630200",
            "areaType": 3,
            "areaName": "海东市",
            "parentAreaId": "630000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "630202",
                "areaType": 4,
                "areaName": "乐都区",
                "parentAreaId": "630200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "630222",
                "areaType": 4,
                "areaName": "民和回族土族自治县",
                "parentAreaId": "630200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "630224",
                "areaType": 4,
                "areaName": "化隆回族自治县",
                "parentAreaId": "630200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "630225",
                "areaType": 4,
                "areaName": "循化撒拉族自治县",
                "parentAreaId": "630200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "630203",
                "areaType": 4,
                "areaName": "平安区",
                "parentAreaId": "630200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "630223",
                "areaType": 4,
                "areaName": "互助土族自治县",
                "parentAreaId": "630200",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "632500",
            "areaType": 3,
            "areaName": "海南藏族自治州",
            "parentAreaId": "630000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "632521",
                "areaType": 4,
                "areaName": "共和县",
                "parentAreaId": "632500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "632523",
                "areaType": 4,
                "areaName": "贵德县",
                "parentAreaId": "632500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "632525",
                "areaType": 4,
                "areaName": "贵南县",
                "parentAreaId": "632500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "632522",
                "areaType": 4,
                "areaName": "同德县",
                "parentAreaId": "632500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "632524",
                "areaType": 4,
                "areaName": "兴海县",
                "parentAreaId": "632500",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "632800",
            "areaType": 3,
            "areaName": "海西蒙古族藏族自治州",
            "parentAreaId": "630000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "632823",
                "areaType": 4,
                "areaName": "天峻县",
                "parentAreaId": "632800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "632802",
                "areaType": 4,
                "areaName": "德令哈市",
                "parentAreaId": "632800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "632801",
                "areaType": 4,
                "areaName": "格尔木市",
                "parentAreaId": "632800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "632822",
                "areaType": 4,
                "areaName": "都兰县",
                "parentAreaId": "632800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "632821",
                "areaType": 4,
                "areaName": "乌兰县",
                "parentAreaId": "632800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "632825",
                "areaType": 4,
                "areaName": "海西蒙古族藏族自治州直辖",
                "parentAreaId": "632800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "632803",
                "areaType": 4,
                "areaName": "茫崖市",
                "parentAreaId": "632800",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "632700",
            "areaType": 3,
            "areaName": "玉树藏族自治州",
            "parentAreaId": "630000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "632724",
                "areaType": 4,
                "areaName": "治多县",
                "parentAreaId": "632700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "632726",
                "areaType": 4,
                "areaName": "曲麻莱县",
                "parentAreaId": "632700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "632723",
                "areaType": 4,
                "areaName": "称多县",
                "parentAreaId": "632700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "632722",
                "areaType": 4,
                "areaName": "杂多县",
                "parentAreaId": "632700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "632701",
                "areaType": 4,
                "areaName": "玉树市",
                "parentAreaId": "632700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "632725",
                "areaType": 4,
                "areaName": "囊谦县",
                "parentAreaId": "632700",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "632300",
            "areaType": 3,
            "areaName": "黄南藏族自治州",
            "parentAreaId": "630000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "632322",
                "areaType": 4,
                "areaName": "尖扎县",
                "parentAreaId": "632300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "632321",
                "areaType": 4,
                "areaName": "同仁县",
                "parentAreaId": "632300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "632323",
                "areaType": 4,
                "areaName": "泽库县",
                "parentAreaId": "632300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "632324",
                "areaType": 4,
                "areaName": "河南蒙古族自治县",
                "parentAreaId": "632300",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "632600",
            "areaType": 3,
            "areaName": "果洛藏族自治州",
            "parentAreaId": "630000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "632621",
                "areaType": 4,
                "areaName": "玛沁县",
                "parentAreaId": "632600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "632623",
                "areaType": 4,
                "areaName": "甘德县",
                "parentAreaId": "632600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "632624",
                "areaType": 4,
                "areaName": "达日县",
                "parentAreaId": "632600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "632625",
                "areaType": 4,
                "areaName": "久治县",
                "parentAreaId": "632600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "632622",
                "areaType": 4,
                "areaName": "班玛县",
                "parentAreaId": "632600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "632626",
                "areaType": 4,
                "areaName": "玛多县",
                "parentAreaId": "632600",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "630100",
            "areaType": 3,
            "areaName": "西宁市",
            "parentAreaId": "630000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "630123",
                "areaType": 4,
                "areaName": "湟源县",
                "parentAreaId": "630100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "630102",
                "areaType": 4,
                "areaName": "城东区",
                "parentAreaId": "630100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "630121",
                "areaType": 4,
                "areaName": "大通回族土族自治县",
                "parentAreaId": "630100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "630104",
                "areaType": 4,
                "areaName": "城西区",
                "parentAreaId": "630100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "630106",
                "areaType": 4,
                "areaName": "湟中区",
                "parentAreaId": "630100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "630103",
                "areaType": 4,
                "areaName": "城中区",
                "parentAreaId": "630100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "630105",
                "areaType": 4,
                "areaName": "城北区",
                "parentAreaId": "630100",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "632200",
            "areaType": 3,
            "areaName": "海北藏族自治州",
            "parentAreaId": "630000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "632223",
                "areaType": 4,
                "areaName": "海晏县",
                "parentAreaId": "632200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "632221",
                "areaType": 4,
                "areaName": "门源回族自治县",
                "parentAreaId": "632200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "632224",
                "areaType": 4,
                "areaName": "刚察县",
                "parentAreaId": "632200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "632222",
                "areaType": 4,
                "areaName": "祁连县",
                "parentAreaId": "632200",
                "zip": null,
                "childAreas": null
              }
            ]
          }
        ]
      },
      {
        "areaId": "710000",
        "areaType": 2,
        "areaName": "台湾省",
        "parentAreaId": "1",
        "zip": null,
        "childAreas": []
      },
      {
        "areaId": "150000",
        "areaType": 2,
        "areaName": "内蒙古自治区",
        "parentAreaId": "1",
        "zip": null,
        "childAreas": [
          {
            "areaId": "150300",
            "areaType": 3,
            "areaName": "乌海市",
            "parentAreaId": "150000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "150302",
                "areaType": 4,
                "areaName": "海勃湾区",
                "parentAreaId": "150300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150304",
                "areaType": 4,
                "areaName": "乌达区",
                "parentAreaId": "150300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150303",
                "areaType": 4,
                "areaName": "海南区",
                "parentAreaId": "150300",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "150800",
            "areaType": 3,
            "areaName": "巴彦淖尔市",
            "parentAreaId": "150000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "150824",
                "areaType": 4,
                "areaName": "乌拉特中旗",
                "parentAreaId": "150800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150821",
                "areaType": 4,
                "areaName": "五原县",
                "parentAreaId": "150800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150822",
                "areaType": 4,
                "areaName": "磴口县",
                "parentAreaId": "150800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150802",
                "areaType": 4,
                "areaName": "临河区",
                "parentAreaId": "150800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150823",
                "areaType": 4,
                "areaName": "乌拉特前旗",
                "parentAreaId": "150800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150826",
                "areaType": 4,
                "areaName": "杭锦后旗",
                "parentAreaId": "150800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150825",
                "areaType": 4,
                "areaName": "乌拉特后旗",
                "parentAreaId": "150800",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "150200",
            "areaType": 3,
            "areaName": "包头市",
            "parentAreaId": "150000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "150221",
                "areaType": 4,
                "areaName": "土默特右旗",
                "parentAreaId": "150200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150206",
                "areaType": 4,
                "areaName": "白云鄂博矿区",
                "parentAreaId": "150200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150223",
                "areaType": 4,
                "areaName": "达尔罕茂明安联合旗",
                "parentAreaId": "150200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150203",
                "areaType": 4,
                "areaName": "昆都仑区",
                "parentAreaId": "150200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150202",
                "areaType": 4,
                "areaName": "东河区",
                "parentAreaId": "150200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150205",
                "areaType": 4,
                "areaName": "石拐区",
                "parentAreaId": "150200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150222",
                "areaType": 4,
                "areaName": "固阳县",
                "parentAreaId": "150200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150204",
                "areaType": 4,
                "areaName": "青山区",
                "parentAreaId": "150200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150207",
                "areaType": 4,
                "areaName": "九原区",
                "parentAreaId": "150200",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "150700",
            "areaType": 3,
            "areaName": "呼伦贝尔市",
            "parentAreaId": "150000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "150784",
                "areaType": 4,
                "areaName": "额尔古纳市",
                "parentAreaId": "150700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150785",
                "areaType": 4,
                "areaName": "根河市",
                "parentAreaId": "150700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150782",
                "areaType": 4,
                "areaName": "牙克石市",
                "parentAreaId": "150700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150725",
                "areaType": 4,
                "areaName": "陈巴尔虎旗",
                "parentAreaId": "150700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150722",
                "areaType": 4,
                "areaName": "莫力达瓦达斡尔族自治旗",
                "parentAreaId": "150700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150702",
                "areaType": 4,
                "areaName": "海拉尔区",
                "parentAreaId": "150700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150724",
                "areaType": 4,
                "areaName": "鄂温克族自治旗",
                "parentAreaId": "150700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150721",
                "areaType": 4,
                "areaName": "阿荣旗",
                "parentAreaId": "150700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150783",
                "areaType": 4,
                "areaName": "扎兰屯市",
                "parentAreaId": "150700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150703",
                "areaType": 4,
                "areaName": "扎赉诺尔区",
                "parentAreaId": "150700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150727",
                "areaType": 4,
                "areaName": "新巴尔虎右旗",
                "parentAreaId": "150700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150781",
                "areaType": 4,
                "areaName": "满洲里市",
                "parentAreaId": "150700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150726",
                "areaType": 4,
                "areaName": "新巴尔虎左旗",
                "parentAreaId": "150700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150723",
                "areaType": 4,
                "areaName": "鄂伦春自治旗",
                "parentAreaId": "150700",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "150600",
            "areaType": 3,
            "areaName": "鄂尔多斯市",
            "parentAreaId": "150000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "150625",
                "areaType": 4,
                "areaName": "杭锦旗",
                "parentAreaId": "150600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150621",
                "areaType": 4,
                "areaName": "达拉特旗",
                "parentAreaId": "150600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150622",
                "areaType": 4,
                "areaName": "准格尔旗",
                "parentAreaId": "150600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150624",
                "areaType": 4,
                "areaName": "鄂托克旗",
                "parentAreaId": "150600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150626",
                "areaType": 4,
                "areaName": "乌审旗",
                "parentAreaId": "150600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150623",
                "areaType": 4,
                "areaName": "鄂托克前旗",
                "parentAreaId": "150600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150627",
                "areaType": 4,
                "areaName": "伊金霍洛旗",
                "parentAreaId": "150600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150603",
                "areaType": 4,
                "areaName": "康巴什区",
                "parentAreaId": "150600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150602",
                "areaType": 4,
                "areaName": "东胜区",
                "parentAreaId": "150600",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "152900",
            "areaType": 3,
            "areaName": "阿拉善盟",
            "parentAreaId": "150000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "152923",
                "areaType": 4,
                "areaName": "额济纳旗",
                "parentAreaId": "152900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "152922",
                "areaType": 4,
                "areaName": "阿拉善右旗",
                "parentAreaId": "152900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "152921",
                "areaType": 4,
                "areaName": "阿拉善左旗",
                "parentAreaId": "152900",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "150500",
            "areaType": 3,
            "areaName": "通辽市",
            "parentAreaId": "150000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "150581",
                "areaType": 4,
                "areaName": "霍林郭勒市",
                "parentAreaId": "150500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150526",
                "areaType": 4,
                "areaName": "扎鲁特旗",
                "parentAreaId": "150500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150521",
                "areaType": 4,
                "areaName": "科尔沁左翼中旗",
                "parentAreaId": "150500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150502",
                "areaType": 4,
                "areaName": "科尔沁区",
                "parentAreaId": "150500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150523",
                "areaType": 4,
                "areaName": "开鲁县",
                "parentAreaId": "150500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150525",
                "areaType": 4,
                "areaName": "奈曼旗",
                "parentAreaId": "150500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150524",
                "areaType": 4,
                "areaName": "库伦旗",
                "parentAreaId": "150500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150522",
                "areaType": 4,
                "areaName": "科尔沁左翼后旗",
                "parentAreaId": "150500",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "152200",
            "areaType": 3,
            "areaName": "兴安盟",
            "parentAreaId": "150000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "152202",
                "areaType": 4,
                "areaName": "阿尔山市",
                "parentAreaId": "152200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "152224",
                "areaType": 4,
                "areaName": "突泉县",
                "parentAreaId": "152200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "152222",
                "areaType": 4,
                "areaName": "科尔沁右翼中旗",
                "parentAreaId": "152200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "152223",
                "areaType": 4,
                "areaName": "扎赉特旗",
                "parentAreaId": "152200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "152221",
                "areaType": 4,
                "areaName": "科尔沁右翼前旗",
                "parentAreaId": "152200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "152201",
                "areaType": 4,
                "areaName": "乌兰浩特市",
                "parentAreaId": "152200",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "152500",
            "areaType": 3,
            "areaName": "锡林郭勒盟",
            "parentAreaId": "150000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "152525",
                "areaType": 4,
                "areaName": "东乌珠穆沁旗",
                "parentAreaId": "152500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "152522",
                "areaType": 4,
                "areaName": "阿巴嘎旗",
                "parentAreaId": "152500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "152526",
                "areaType": 4,
                "areaName": "西乌珠穆沁旗",
                "parentAreaId": "152500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "152523",
                "areaType": 4,
                "areaName": "苏尼特左旗",
                "parentAreaId": "152500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "152502",
                "areaType": 4,
                "areaName": "锡林浩特市",
                "parentAreaId": "152500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "152501",
                "areaType": 4,
                "areaName": "二连浩特市",
                "parentAreaId": "152500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "152524",
                "areaType": 4,
                "areaName": "苏尼特右旗",
                "parentAreaId": "152500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "152530",
                "areaType": 4,
                "areaName": "正蓝旗",
                "parentAreaId": "152500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "152529",
                "areaType": 4,
                "areaName": "正镶白旗",
                "parentAreaId": "152500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "152528",
                "areaType": 4,
                "areaName": "镶黄旗",
                "parentAreaId": "152500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "152531",
                "areaType": 4,
                "areaName": "多伦县",
                "parentAreaId": "152500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "152527",
                "areaType": 4,
                "areaName": "太仆寺旗",
                "parentAreaId": "152500",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "150100",
            "areaType": 3,
            "areaName": "呼和浩特市",
            "parentAreaId": "150000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "150123",
                "areaType": 4,
                "areaName": "和林格尔县",
                "parentAreaId": "150100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150104",
                "areaType": 4,
                "areaName": "玉泉区",
                "parentAreaId": "150100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150103",
                "areaType": 4,
                "areaName": "回民区",
                "parentAreaId": "150100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150125",
                "areaType": 4,
                "areaName": "武川县",
                "parentAreaId": "150100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150122",
                "areaType": 4,
                "areaName": "托克托县",
                "parentAreaId": "150100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150121",
                "areaType": 4,
                "areaName": "土默特左旗",
                "parentAreaId": "150100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150102",
                "areaType": 4,
                "areaName": "新城区",
                "parentAreaId": "150100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150105",
                "areaType": 4,
                "areaName": "赛罕区",
                "parentAreaId": "150100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150124",
                "areaType": 4,
                "areaName": "清水河县",
                "parentAreaId": "150100",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "150400",
            "areaType": 3,
            "areaName": "赤峰市",
            "parentAreaId": "150000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "150421",
                "areaType": 4,
                "areaName": "阿鲁科尔沁旗",
                "parentAreaId": "150400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150424",
                "areaType": 4,
                "areaName": "林西县",
                "parentAreaId": "150400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150422",
                "areaType": 4,
                "areaName": "巴林左旗",
                "parentAreaId": "150400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150423",
                "areaType": 4,
                "areaName": "巴林右旗",
                "parentAreaId": "150400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150425",
                "areaType": 4,
                "areaName": "克什克腾旗",
                "parentAreaId": "150400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150426",
                "areaType": 4,
                "areaName": "翁牛特旗",
                "parentAreaId": "150400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150404",
                "areaType": 4,
                "areaName": "松山区",
                "parentAreaId": "150400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150402",
                "areaType": 4,
                "areaName": "红山区",
                "parentAreaId": "150400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150428",
                "areaType": 4,
                "areaName": "喀喇沁旗",
                "parentAreaId": "150400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150403",
                "areaType": 4,
                "areaName": "元宝山区",
                "parentAreaId": "150400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150430",
                "areaType": 4,
                "areaName": "敖汉旗",
                "parentAreaId": "150400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150429",
                "areaType": 4,
                "areaName": "宁城县",
                "parentAreaId": "150400",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "150900",
            "areaType": 3,
            "areaName": "乌兰察布市",
            "parentAreaId": "150000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "150929",
                "areaType": 4,
                "areaName": "四子王旗",
                "parentAreaId": "150900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150922",
                "areaType": 4,
                "areaName": "化德县",
                "parentAreaId": "150900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150923",
                "areaType": 4,
                "areaName": "商都县",
                "parentAreaId": "150900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150928",
                "areaType": 4,
                "areaName": "察哈尔右翼后旗",
                "parentAreaId": "150900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150927",
                "areaType": 4,
                "areaName": "察哈尔右翼中旗",
                "parentAreaId": "150900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150924",
                "areaType": 4,
                "areaName": "兴和县",
                "parentAreaId": "150900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150921",
                "areaType": 4,
                "areaName": "卓资县",
                "parentAreaId": "150900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150981",
                "areaType": 4,
                "areaName": "丰镇市",
                "parentAreaId": "150900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150902",
                "areaType": 4,
                "areaName": "集宁区",
                "parentAreaId": "150900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150926",
                "areaType": 4,
                "areaName": "察哈尔右翼前旗",
                "parentAreaId": "150900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "150925",
                "areaType": 4,
                "areaName": "凉城县",
                "parentAreaId": "150900",
                "zip": null,
                "childAreas": null
              }
            ]
          }
        ]
      },
      {
        "areaId": "450000",
        "areaType": 2,
        "areaName": "广西壮族自治区",
        "parentAreaId": "1",
        "zip": null,
        "childAreas": [
          {
            "areaId": "451000",
            "areaType": 3,
            "areaName": "百色市",
            "parentAreaId": "450000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "451028",
                "areaType": 4,
                "areaName": "乐业县",
                "parentAreaId": "451000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "451031",
                "areaType": 4,
                "areaName": "隆林各族自治县",
                "parentAreaId": "451000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "451027",
                "areaType": 4,
                "areaName": "凌云县",
                "parentAreaId": "451000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "451030",
                "areaType": 4,
                "areaName": "西林县",
                "parentAreaId": "451000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "451002",
                "areaType": 4,
                "areaName": "右江区",
                "parentAreaId": "451000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "451082",
                "areaType": 4,
                "areaName": "平果市",
                "parentAreaId": "451000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "451026",
                "areaType": 4,
                "areaName": "那坡县",
                "parentAreaId": "451000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "451081",
                "areaType": 4,
                "areaName": "靖西市",
                "parentAreaId": "451000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "451029",
                "areaType": 4,
                "areaName": "田林县",
                "parentAreaId": "451000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "451022",
                "areaType": 4,
                "areaName": "田东县",
                "parentAreaId": "451000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "451024",
                "areaType": 4,
                "areaName": "德保县",
                "parentAreaId": "451000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "451003",
                "areaType": 4,
                "areaName": "田阳区",
                "parentAreaId": "451000",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "450700",
            "areaType": 3,
            "areaName": "钦州市",
            "parentAreaId": "450000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "450702",
                "areaType": 4,
                "areaName": "钦南区",
                "parentAreaId": "450700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450703",
                "areaType": 4,
                "areaName": "钦北区",
                "parentAreaId": "450700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450722",
                "areaType": 4,
                "areaName": "浦北县",
                "parentAreaId": "450700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450721",
                "areaType": 4,
                "areaName": "灵山县",
                "parentAreaId": "450700",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "450500",
            "areaType": 3,
            "areaName": "北海市",
            "parentAreaId": "450000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "450503",
                "areaType": 4,
                "areaName": "银海区",
                "parentAreaId": "450500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450512",
                "areaType": 4,
                "areaName": "铁山港区",
                "parentAreaId": "450500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450502",
                "areaType": 4,
                "areaName": "海城区",
                "parentAreaId": "450500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450521",
                "areaType": 4,
                "areaName": "合浦县",
                "parentAreaId": "450500",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "451200",
            "areaType": 3,
            "areaName": "河池市",
            "parentAreaId": "450000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "451221",
                "areaType": 4,
                "areaName": "南丹县",
                "parentAreaId": "451200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "451226",
                "areaType": 4,
                "areaName": "环江毛南族自治县",
                "parentAreaId": "451200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "451222",
                "areaType": 4,
                "areaName": "天峨县",
                "parentAreaId": "451200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "451225",
                "areaType": 4,
                "areaName": "罗城仫佬族自治县",
                "parentAreaId": "451200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "451202",
                "areaType": 4,
                "areaName": "金城江区",
                "parentAreaId": "451200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "451203",
                "areaType": 4,
                "areaName": "宜州区",
                "parentAreaId": "451200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "451223",
                "areaType": 4,
                "areaName": "凤山县",
                "parentAreaId": "451200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "451227",
                "areaType": 4,
                "areaName": "巴马瑶族自治县",
                "parentAreaId": "451200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "451228",
                "areaType": 4,
                "areaName": "都安瑶族自治县",
                "parentAreaId": "451200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "451229",
                "areaType": 4,
                "areaName": "大化瑶族自治县",
                "parentAreaId": "451200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "451224",
                "areaType": 4,
                "areaName": "东兰县",
                "parentAreaId": "451200",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "450200",
            "areaType": 3,
            "areaName": "柳州市",
            "parentAreaId": "450000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "450226",
                "areaType": 4,
                "areaName": "三江侗族自治县",
                "parentAreaId": "450200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450224",
                "areaType": 4,
                "areaName": "融安县",
                "parentAreaId": "450200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450225",
                "areaType": 4,
                "areaName": "融水苗族自治县",
                "parentAreaId": "450200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450223",
                "areaType": 4,
                "areaName": "鹿寨县",
                "parentAreaId": "450200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450202",
                "areaType": 4,
                "areaName": "城中区",
                "parentAreaId": "450200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450222",
                "areaType": 4,
                "areaName": "柳城县",
                "parentAreaId": "450200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450205",
                "areaType": 4,
                "areaName": "柳北区",
                "parentAreaId": "450200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450203",
                "areaType": 4,
                "areaName": "鱼峰区",
                "parentAreaId": "450200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450206",
                "areaType": 4,
                "areaName": "柳江区",
                "parentAreaId": "450200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450204",
                "areaType": 4,
                "areaName": "柳南区",
                "parentAreaId": "450200",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "451300",
            "areaType": 3,
            "areaName": "来宾市",
            "parentAreaId": "450000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "451324",
                "areaType": 4,
                "areaName": "金秀瑶族自治县",
                "parentAreaId": "451300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "451321",
                "areaType": 4,
                "areaName": "忻城县",
                "parentAreaId": "451300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "451381",
                "areaType": 4,
                "areaName": "合山市",
                "parentAreaId": "451300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "451322",
                "areaType": 4,
                "areaName": "象州县",
                "parentAreaId": "451300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "451323",
                "areaType": 4,
                "areaName": "武宣县",
                "parentAreaId": "451300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "451302",
                "areaType": 4,
                "areaName": "兴宾区",
                "parentAreaId": "451300",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "450100",
            "areaType": 3,
            "areaName": "南宁市",
            "parentAreaId": "450000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "450124",
                "areaType": 4,
                "areaName": "马山县",
                "parentAreaId": "450100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450125",
                "areaType": 4,
                "areaName": "上林县",
                "parentAreaId": "450100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450110",
                "areaType": 4,
                "areaName": "武鸣区",
                "parentAreaId": "450100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450126",
                "areaType": 4,
                "areaName": "宾阳县",
                "parentAreaId": "450100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450127",
                "areaType": 4,
                "areaName": "横县",
                "parentAreaId": "450100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450105",
                "areaType": 4,
                "areaName": "江南区",
                "parentAreaId": "450100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450109",
                "areaType": 4,
                "areaName": "邕宁区",
                "parentAreaId": "450100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450108",
                "areaType": 4,
                "areaName": "良庆区",
                "parentAreaId": "450100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450107",
                "areaType": 4,
                "areaName": "西乡塘区",
                "parentAreaId": "450100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450102",
                "areaType": 4,
                "areaName": "兴宁区",
                "parentAreaId": "450100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450103",
                "areaType": 4,
                "areaName": "青秀区",
                "parentAreaId": "450100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450123",
                "areaType": 4,
                "areaName": "隆安县",
                "parentAreaId": "450100",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "451400",
            "areaType": 3,
            "areaName": "崇左市",
            "parentAreaId": "450000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "451425",
                "areaType": 4,
                "areaName": "天等县",
                "parentAreaId": "451400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "451421",
                "areaType": 4,
                "areaName": "扶绥县",
                "parentAreaId": "451400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "451402",
                "areaType": 4,
                "areaName": "江州区",
                "parentAreaId": "451400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "451424",
                "areaType": 4,
                "areaName": "大新县",
                "parentAreaId": "451400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "451423",
                "areaType": 4,
                "areaName": "龙州县",
                "parentAreaId": "451400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "451422",
                "areaType": 4,
                "areaName": "宁明县",
                "parentAreaId": "451400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "451481",
                "areaType": 4,
                "areaName": "凭祥市",
                "parentAreaId": "451400",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "450600",
            "areaType": 3,
            "areaName": "防城港市",
            "parentAreaId": "450000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "450621",
                "areaType": 4,
                "areaName": "上思县",
                "parentAreaId": "450600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450602",
                "areaType": 4,
                "areaName": "港口区",
                "parentAreaId": "450600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450603",
                "areaType": 4,
                "areaName": "防城区",
                "parentAreaId": "450600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450681",
                "areaType": 4,
                "areaName": "东兴市",
                "parentAreaId": "450600",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "451100",
            "areaType": 3,
            "areaName": "贺州市",
            "parentAreaId": "450000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "451123",
                "areaType": 4,
                "areaName": "富川瑶族自治县",
                "parentAreaId": "451100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "451121",
                "areaType": 4,
                "areaName": "昭平县",
                "parentAreaId": "451100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "451122",
                "areaType": 4,
                "areaName": "钟山县",
                "parentAreaId": "451100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "451102",
                "areaType": 4,
                "areaName": "八步区",
                "parentAreaId": "451100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "451103",
                "areaType": 4,
                "areaName": "平桂区",
                "parentAreaId": "451100",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "450900",
            "areaType": 3,
            "areaName": "玉林市",
            "parentAreaId": "450000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "450903",
                "areaType": 4,
                "areaName": "福绵区",
                "parentAreaId": "450900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450924",
                "areaType": 4,
                "areaName": "兴业县",
                "parentAreaId": "450900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450902",
                "areaType": 4,
                "areaName": "玉州区",
                "parentAreaId": "450900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450923",
                "areaType": 4,
                "areaName": "博白县",
                "parentAreaId": "450900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450922",
                "areaType": 4,
                "areaName": "陆川县",
                "parentAreaId": "450900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450981",
                "areaType": 4,
                "areaName": "北流市",
                "parentAreaId": "450900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450921",
                "areaType": 4,
                "areaName": "容县",
                "parentAreaId": "450900",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "450800",
            "areaType": 3,
            "areaName": "贵港市",
            "parentAreaId": "450000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "450802",
                "areaType": 4,
                "areaName": "港北区",
                "parentAreaId": "450800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450804",
                "areaType": 4,
                "areaName": "覃塘区",
                "parentAreaId": "450800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450803",
                "areaType": 4,
                "areaName": "港南区",
                "parentAreaId": "450800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450821",
                "areaType": 4,
                "areaName": "平南县",
                "parentAreaId": "450800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450881",
                "areaType": 4,
                "areaName": "桂平市",
                "parentAreaId": "450800",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "450400",
            "areaType": 3,
            "areaName": "梧州市",
            "parentAreaId": "450000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "450423",
                "areaType": 4,
                "areaName": "蒙山县",
                "parentAreaId": "450400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450405",
                "areaType": 4,
                "areaName": "长洲区",
                "parentAreaId": "450400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450406",
                "areaType": 4,
                "areaName": "龙圩区",
                "parentAreaId": "450400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450481",
                "areaType": 4,
                "areaName": "岑溪市",
                "parentAreaId": "450400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450421",
                "areaType": 4,
                "areaName": "苍梧县",
                "parentAreaId": "450400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450403",
                "areaType": 4,
                "areaName": "万秀区",
                "parentAreaId": "450400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450422",
                "areaType": 4,
                "areaName": "藤县",
                "parentAreaId": "450400",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "450300",
            "areaType": 3,
            "areaName": "桂林市",
            "parentAreaId": "450000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "450325",
                "areaType": 4,
                "areaName": "兴安县",
                "parentAreaId": "450300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450312",
                "areaType": 4,
                "areaName": "临桂区",
                "parentAreaId": "450300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450326",
                "areaType": 4,
                "areaName": "永福县",
                "parentAreaId": "450300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450305",
                "areaType": 4,
                "areaName": "七星区",
                "parentAreaId": "450300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450311",
                "areaType": 4,
                "areaName": "雁山区",
                "parentAreaId": "450300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450332",
                "areaType": 4,
                "areaName": "恭城瑶族自治县",
                "parentAreaId": "450300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450321",
                "areaType": 4,
                "areaName": "阳朔县",
                "parentAreaId": "450300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450330",
                "areaType": 4,
                "areaName": "平乐县",
                "parentAreaId": "450300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450381",
                "areaType": 4,
                "areaName": "荔浦市",
                "parentAreaId": "450300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450328",
                "areaType": 4,
                "areaName": "龙胜各族自治县",
                "parentAreaId": "450300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450302",
                "areaType": 4,
                "areaName": "秀峰区",
                "parentAreaId": "450300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450304",
                "areaType": 4,
                "areaName": "象山区",
                "parentAreaId": "450300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450324",
                "areaType": 4,
                "areaName": "全州县",
                "parentAreaId": "450300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450327",
                "areaType": 4,
                "areaName": "灌阳县",
                "parentAreaId": "450300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450303",
                "areaType": 4,
                "areaName": "叠彩区",
                "parentAreaId": "450300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450323",
                "areaType": 4,
                "areaName": "灵川县",
                "parentAreaId": "450300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "450329",
                "areaType": 4,
                "areaName": "资源县",
                "parentAreaId": "450300",
                "zip": null,
                "childAreas": null
              }
            ]
          }
        ]
      },
      {
        "areaId": "540000",
        "areaType": 2,
        "areaName": "西藏自治区",
        "parentAreaId": "1",
        "zip": null,
        "childAreas": [
          {
            "areaId": "540300",
            "areaType": 3,
            "areaName": "昌都市",
            "parentAreaId": "540000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "540321",
                "areaType": 4,
                "areaName": "江达县",
                "parentAreaId": "540300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540324",
                "areaType": 4,
                "areaName": "丁青县",
                "parentAreaId": "540300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540302",
                "areaType": 4,
                "areaName": "卡若区",
                "parentAreaId": "540300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540323",
                "areaType": 4,
                "areaName": "类乌齐县",
                "parentAreaId": "540300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540330",
                "areaType": 4,
                "areaName": "边坝县",
                "parentAreaId": "540300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540322",
                "areaType": 4,
                "areaName": "贡觉县",
                "parentAreaId": "540300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540329",
                "areaType": 4,
                "areaName": "洛隆县",
                "parentAreaId": "540300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540325",
                "areaType": 4,
                "areaName": "察雅县",
                "parentAreaId": "540300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540326",
                "areaType": 4,
                "areaName": "八宿县",
                "parentAreaId": "540300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540327",
                "areaType": 4,
                "areaName": "左贡县",
                "parentAreaId": "540300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540328",
                "areaType": 4,
                "areaName": "芒康县",
                "parentAreaId": "540300",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "540600",
            "areaType": 3,
            "areaName": "那曲市",
            "parentAreaId": "540000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "540624",
                "areaType": 4,
                "areaName": "安多县",
                "parentAreaId": "540600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540623",
                "areaType": 4,
                "areaName": "聂荣县",
                "parentAreaId": "540600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540628",
                "areaType": 4,
                "areaName": "巴青县",
                "parentAreaId": "540600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540625",
                "areaType": 4,
                "areaName": "申扎县",
                "parentAreaId": "540600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540627",
                "areaType": 4,
                "areaName": "班戈县",
                "parentAreaId": "540600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540622",
                "areaType": 4,
                "areaName": "比如县",
                "parentAreaId": "540600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540626",
                "areaType": 4,
                "areaName": "索县",
                "parentAreaId": "540600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540602",
                "areaType": 4,
                "areaName": "色尼区",
                "parentAreaId": "540600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540621",
                "areaType": 4,
                "areaName": "嘉黎县",
                "parentAreaId": "540600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540629",
                "areaType": 4,
                "areaName": "尼玛县",
                "parentAreaId": "540600",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540630",
                "areaType": 4,
                "areaName": "双湖县",
                "parentAreaId": "540600",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "540100",
            "areaType": 3,
            "areaName": "拉萨市",
            "parentAreaId": "540000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "540122",
                "areaType": 4,
                "areaName": "当雄县",
                "parentAreaId": "540100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540121",
                "areaType": 4,
                "areaName": "林周县",
                "parentAreaId": "540100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540127",
                "areaType": 4,
                "areaName": "墨竹工卡县",
                "parentAreaId": "540100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540103",
                "areaType": 4,
                "areaName": "堆龙德庆区",
                "parentAreaId": "540100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540104",
                "areaType": 4,
                "areaName": "达孜区",
                "parentAreaId": "540100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540123",
                "areaType": 4,
                "areaName": "尼木县",
                "parentAreaId": "540100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540102",
                "areaType": 4,
                "areaName": "城关区",
                "parentAreaId": "540100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540124",
                "areaType": 4,
                "areaName": "曲水县",
                "parentAreaId": "540100",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "540200",
            "areaType": 3,
            "areaName": "日喀则市",
            "parentAreaId": "540000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "540232",
                "areaType": 4,
                "areaName": "仲巴县",
                "parentAreaId": "540200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540226",
                "areaType": 4,
                "areaName": "昂仁县",
                "parentAreaId": "540200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540227",
                "areaType": 4,
                "areaName": "谢通门县",
                "parentAreaId": "540200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540221",
                "areaType": 4,
                "areaName": "南木林县",
                "parentAreaId": "540200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540236",
                "areaType": 4,
                "areaName": "萨嘎县",
                "parentAreaId": "540200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540202",
                "areaType": 4,
                "areaName": "桑珠孜区",
                "parentAreaId": "540200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540225",
                "areaType": 4,
                "areaName": "拉孜县",
                "parentAreaId": "540200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540224",
                "areaType": 4,
                "areaName": "萨迦县",
                "parentAreaId": "540200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540229",
                "areaType": 4,
                "areaName": "仁布县",
                "parentAreaId": "540200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540234",
                "areaType": 4,
                "areaName": "吉隆县",
                "parentAreaId": "540200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540228",
                "areaType": 4,
                "areaName": "白朗县",
                "parentAreaId": "540200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540223",
                "areaType": 4,
                "areaName": "定日县",
                "parentAreaId": "540200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540222",
                "areaType": 4,
                "areaName": "江孜县",
                "parentAreaId": "540200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540230",
                "areaType": 4,
                "areaName": "康马县",
                "parentAreaId": "540200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540235",
                "areaType": 4,
                "areaName": "聂拉木县",
                "parentAreaId": "540200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540237",
                "areaType": 4,
                "areaName": "岗巴县",
                "parentAreaId": "540200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540231",
                "areaType": 4,
                "areaName": "定结县",
                "parentAreaId": "540200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540233",
                "areaType": 4,
                "areaName": "亚东县",
                "parentAreaId": "540200",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "540500",
            "areaType": 3,
            "areaName": "山南市",
            "parentAreaId": "540000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "540523",
                "areaType": 4,
                "areaName": "桑日县",
                "parentAreaId": "540500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540528",
                "areaType": 4,
                "areaName": "加查县",
                "parentAreaId": "540500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540502",
                "areaType": 4,
                "areaName": "乃东区",
                "parentAreaId": "540500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540521",
                "areaType": 4,
                "areaName": "扎囊县",
                "parentAreaId": "540500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540522",
                "areaType": 4,
                "areaName": "贡嘎县",
                "parentAreaId": "540500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540531",
                "areaType": 4,
                "areaName": "浪卡子县",
                "parentAreaId": "540500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540525",
                "areaType": 4,
                "areaName": "曲松县",
                "parentAreaId": "540500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540524",
                "areaType": 4,
                "areaName": "琼结县",
                "parentAreaId": "540500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540526",
                "areaType": 4,
                "areaName": "措美县",
                "parentAreaId": "540500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540529",
                "areaType": 4,
                "areaName": "隆子县",
                "parentAreaId": "540500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540527",
                "areaType": 4,
                "areaName": "洛扎县",
                "parentAreaId": "540500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540530",
                "areaType": 4,
                "areaName": "错那县",
                "parentAreaId": "540500",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "540400",
            "areaType": 3,
            "areaName": "林芝市",
            "parentAreaId": "540000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "540424",
                "areaType": 4,
                "areaName": "波密县",
                "parentAreaId": "540400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540402",
                "areaType": 4,
                "areaName": "巴宜区",
                "parentAreaId": "540400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540421",
                "areaType": 4,
                "areaName": "工布江达县",
                "parentAreaId": "540400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540422",
                "areaType": 4,
                "areaName": "米林县",
                "parentAreaId": "540400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540423",
                "areaType": 4,
                "areaName": "墨脱县",
                "parentAreaId": "540400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540425",
                "areaType": 4,
                "areaName": "察隅县",
                "parentAreaId": "540400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "540426",
                "areaType": 4,
                "areaName": "朗县",
                "parentAreaId": "540400",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "542500",
            "areaType": 3,
            "areaName": "阿里地区",
            "parentAreaId": "540000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "542526",
                "areaType": 4,
                "areaName": "改则县",
                "parentAreaId": "542500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "542522",
                "areaType": 4,
                "areaName": "札达县",
                "parentAreaId": "542500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "542527",
                "areaType": 4,
                "areaName": "措勤县",
                "parentAreaId": "542500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "542521",
                "areaType": 4,
                "areaName": "普兰县",
                "parentAreaId": "542500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "542524",
                "areaType": 4,
                "areaName": "日土县",
                "parentAreaId": "542500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "542523",
                "areaType": 4,
                "areaName": "噶尔县",
                "parentAreaId": "542500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "542525",
                "areaType": 4,
                "areaName": "革吉县",
                "parentAreaId": "542500",
                "zip": null,
                "childAreas": null
              }
            ]
          }
        ]
      },
      {
        "areaId": "640000",
        "areaType": 2,
        "areaName": "宁夏回族自治区",
        "parentAreaId": "1",
        "zip": null,
        "childAreas": [
          {
            "areaId": "640400",
            "areaType": 3,
            "areaName": "固原市",
            "parentAreaId": "640000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "640423",
                "areaType": 4,
                "areaName": "隆德县",
                "parentAreaId": "640400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "640425",
                "areaType": 4,
                "areaName": "彭阳县",
                "parentAreaId": "640400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "640424",
                "areaType": 4,
                "areaName": "泾源县",
                "parentAreaId": "640400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "640422",
                "areaType": 4,
                "areaName": "西吉县",
                "parentAreaId": "640400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "640402",
                "areaType": 4,
                "areaName": "原州区",
                "parentAreaId": "640400",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "640500",
            "areaType": 3,
            "areaName": "中卫市",
            "parentAreaId": "640000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "640522",
                "areaType": 4,
                "areaName": "海原县",
                "parentAreaId": "640500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "640521",
                "areaType": 4,
                "areaName": "中宁县",
                "parentAreaId": "640500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "640502",
                "areaType": 4,
                "areaName": "沙坡头区",
                "parentAreaId": "640500",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "640200",
            "areaType": 3,
            "areaName": "石嘴山市",
            "parentAreaId": "640000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "640205",
                "areaType": 4,
                "areaName": "惠农区",
                "parentAreaId": "640200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "640221",
                "areaType": 4,
                "areaName": "平罗县",
                "parentAreaId": "640200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "640202",
                "areaType": 4,
                "areaName": "大武口区",
                "parentAreaId": "640200",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "640300",
            "areaType": 3,
            "areaName": "吴忠市",
            "parentAreaId": "640000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "640381",
                "areaType": 4,
                "areaName": "青铜峡市",
                "parentAreaId": "640300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "640323",
                "areaType": 4,
                "areaName": "盐池县",
                "parentAreaId": "640300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "640324",
                "areaType": 4,
                "areaName": "同心县",
                "parentAreaId": "640300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "640303",
                "areaType": 4,
                "areaName": "红寺堡区",
                "parentAreaId": "640300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "640302",
                "areaType": 4,
                "areaName": "利通区",
                "parentAreaId": "640300",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "640100",
            "areaType": 3,
            "areaName": "银川市",
            "parentAreaId": "640000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "640122",
                "areaType": 4,
                "areaName": "贺兰县",
                "parentAreaId": "640100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "640105",
                "areaType": 4,
                "areaName": "西夏区",
                "parentAreaId": "640100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "640121",
                "areaType": 4,
                "areaName": "永宁县",
                "parentAreaId": "640100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "640106",
                "areaType": 4,
                "areaName": "金凤区",
                "parentAreaId": "640100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "640104",
                "areaType": 4,
                "areaName": "兴庆区",
                "parentAreaId": "640100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "640181",
                "areaType": 4,
                "areaName": "灵武市",
                "parentAreaId": "640100",
                "zip": null,
                "childAreas": null
              }
            ]
          }
        ]
      },
      {
        "areaId": "650000",
        "areaType": 2,
        "areaName": "新疆维吾尔自治区",
        "parentAreaId": "1",
        "zip": null,
        "childAreas": [
          {
            "areaId": "659005",
            "areaType": 3,
            "areaName": "北屯市",
            "parentAreaId": "650000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "6590051",
                "areaType": 4,
                "areaName": "兵团一八七团",
                "parentAreaId": "659005",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590052",
                "areaType": 4,
                "areaName": "北屯镇",
                "parentAreaId": "659005",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590053",
                "areaType": 4,
                "areaName": "兵团一八八团",
                "parentAreaId": "659005",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590054",
                "areaType": 4,
                "areaName": "兵团一八三团",
                "parentAreaId": "659005",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "659006",
            "areaType": 3,
            "areaName": "铁门关市",
            "parentAreaId": "650000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "6590061",
                "areaType": 4,
                "areaName": "兵团二十九团",
                "parentAreaId": "659006",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590062",
                "areaType": 4,
                "areaName": "农二师三十团",
                "parentAreaId": "659006",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "659007",
            "areaType": 3,
            "areaName": "双河市",
            "parentAreaId": "650000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "6590071",
                "areaType": 4,
                "areaName": "兵团八十九团",
                "parentAreaId": "659007",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590072",
                "areaType": 4,
                "areaName": "兵团八十六团",
                "parentAreaId": "659007",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590073",
                "areaType": 4,
                "areaName": "兵团八十四团",
                "parentAreaId": "659007",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590074",
                "areaType": 4,
                "areaName": "兵团九十团",
                "parentAreaId": "659007",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590075",
                "areaType": 4,
                "areaName": "兵团八十一团",
                "parentAreaId": "659007",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "652700",
            "areaType": 3,
            "areaName": "博尔塔拉蒙古自治州",
            "parentAreaId": "650000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "652723",
                "areaType": 4,
                "areaName": "温泉县",
                "parentAreaId": "652700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "652702",
                "areaType": 4,
                "areaName": "阿拉山口市",
                "parentAreaId": "652700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "652701",
                "areaType": 4,
                "areaName": "博乐市",
                "parentAreaId": "652700",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "652722",
                "areaType": 4,
                "areaName": "精河县",
                "parentAreaId": "652700",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "659008",
            "areaType": 3,
            "areaName": "可克达拉市",
            "parentAreaId": "650000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "6590081",
                "areaType": 4,
                "areaName": "兵团六十八团",
                "parentAreaId": "659008",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590082",
                "areaType": 4,
                "areaName": "都拉塔口岸",
                "parentAreaId": "659008",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590083",
                "areaType": 4,
                "areaName": "兵团六十七团",
                "parentAreaId": "659008",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590084",
                "areaType": 4,
                "areaName": "兵团六十六团",
                "parentAreaId": "659008",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590085",
                "areaType": 4,
                "areaName": "兵团六十三团",
                "parentAreaId": "659008",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590086",
                "areaType": 4,
                "areaName": "兵团六十四团",
                "parentAreaId": "659008",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "654200",
            "areaType": 3,
            "areaName": "塔城地区",
            "parentAreaId": "650000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "654201",
                "areaType": 4,
                "areaName": "塔城市",
                "parentAreaId": "654200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "654226",
                "areaType": 4,
                "areaName": "和布克赛尔蒙古自治县",
                "parentAreaId": "654200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "654221",
                "areaType": 4,
                "areaName": "额敏县",
                "parentAreaId": "654200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "654224",
                "areaType": 4,
                "areaName": "托里县",
                "parentAreaId": "654200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "654225",
                "areaType": 4,
                "areaName": "裕民县",
                "parentAreaId": "654200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "654202",
                "areaType": 4,
                "areaName": "乌苏市",
                "parentAreaId": "654200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "654223",
                "areaType": 4,
                "areaName": "沙湾县",
                "parentAreaId": "654200",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "653200",
            "areaType": 3,
            "areaName": "和田地区",
            "parentAreaId": "650000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "653226",
                "areaType": 4,
                "areaName": "于田县",
                "parentAreaId": "653200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "653227",
                "areaType": 4,
                "areaName": "民丰县",
                "parentAreaId": "653200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "653201",
                "areaType": 4,
                "areaName": "和田市",
                "parentAreaId": "653200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "653224",
                "areaType": 4,
                "areaName": "洛浦县",
                "parentAreaId": "653200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "653221",
                "areaType": 4,
                "areaName": "和田县",
                "parentAreaId": "653200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "653222",
                "areaType": 4,
                "areaName": "墨玉县",
                "parentAreaId": "653200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "653223",
                "areaType": 4,
                "areaName": "皮山县",
                "parentAreaId": "653200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "653225",
                "areaType": 4,
                "areaName": "策勒县",
                "parentAreaId": "653200",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "659009",
            "areaType": 3,
            "areaName": "昆玉市",
            "parentAreaId": "650000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "6590091",
                "areaType": 4,
                "areaName": "兵团皮山农场",
                "parentAreaId": "659009",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590092",
                "areaType": 4,
                "areaName": "兵团二二四团",
                "parentAreaId": "659009",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590093",
                "areaType": 4,
                "areaName": "乌尔其乡",
                "parentAreaId": "659009",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590094",
                "areaType": 4,
                "areaName": "兵团四十七团",
                "parentAreaId": "659009",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590095",
                "areaType": 4,
                "areaName": "普恰克其乡",
                "parentAreaId": "659009",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590096",
                "areaType": 4,
                "areaName": "兵团一牧场",
                "parentAreaId": "659009",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590097",
                "areaType": 4,
                "areaName": "喀拉喀什镇",
                "parentAreaId": "659009",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590098",
                "areaType": 4,
                "areaName": "阔依其乡",
                "parentAreaId": "659009",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590099",
                "areaType": 4,
                "areaName": "奴尔乡",
                "parentAreaId": "659009",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "65900910",
                "areaType": 4,
                "areaName": "乌鲁克萨依乡",
                "parentAreaId": "659009",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "65900911",
                "areaType": 4,
                "areaName": "博斯坦乡",
                "parentAreaId": "659009",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "654300",
            "areaType": 3,
            "areaName": "阿勒泰地区",
            "parentAreaId": "650000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "654321",
                "areaType": 4,
                "areaName": "布尔津县",
                "parentAreaId": "654300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "654324",
                "areaType": 4,
                "areaName": "哈巴河县",
                "parentAreaId": "654300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "654322",
                "areaType": 4,
                "areaName": "富蕴县",
                "parentAreaId": "654300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "654326",
                "areaType": 4,
                "areaName": "吉木乃县",
                "parentAreaId": "654300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "654325",
                "areaType": 4,
                "areaName": "青河县",
                "parentAreaId": "654300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "654301",
                "areaType": 4,
                "areaName": "阿勒泰市",
                "parentAreaId": "654300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "654323",
                "areaType": 4,
                "areaName": "福海县",
                "parentAreaId": "654300",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "659001",
            "areaType": 3,
            "areaName": "石河子市",
            "parentAreaId": "650000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "6590011",
                "areaType": 4,
                "areaName": "向阳街道",
                "parentAreaId": "659001",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590012",
                "areaType": 4,
                "areaName": "红山街道",
                "parentAreaId": "659001",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590013",
                "areaType": 4,
                "areaName": "兵团一五二团",
                "parentAreaId": "659001",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590014",
                "areaType": 4,
                "areaName": "东城街道",
                "parentAreaId": "659001",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590015",
                "areaType": 4,
                "areaName": "老街街道",
                "parentAreaId": "659001",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590016",
                "areaType": 4,
                "areaName": "石河子乡",
                "parentAreaId": "659001",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590017",
                "areaType": 4,
                "areaName": "北泉镇",
                "parentAreaId": "659001",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590018",
                "areaType": 4,
                "areaName": "新城街道",
                "parentAreaId": "659001",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "652300",
            "areaType": 3,
            "areaName": "昌吉回族自治州",
            "parentAreaId": "650000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "652325",
                "areaType": 4,
                "areaName": "奇台县",
                "parentAreaId": "652300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "652324",
                "areaType": 4,
                "areaName": "玛纳斯县",
                "parentAreaId": "652300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "652323",
                "areaType": 4,
                "areaName": "呼图壁县",
                "parentAreaId": "652300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "652328",
                "areaType": 4,
                "areaName": "木垒哈萨克自治县",
                "parentAreaId": "652300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "652302",
                "areaType": 4,
                "areaName": "阜康市",
                "parentAreaId": "652300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "652301",
                "areaType": 4,
                "areaName": "昌吉市",
                "parentAreaId": "652300",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "652327",
                "areaType": 4,
                "areaName": "吉木萨尔县",
                "parentAreaId": "652300",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "659004",
            "areaType": 3,
            "areaName": "五家渠市",
            "parentAreaId": "650000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "6590041",
                "areaType": 4,
                "areaName": "兵团一零二团",
                "parentAreaId": "659004",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590042",
                "areaType": 4,
                "areaName": "军垦路街道",
                "parentAreaId": "659004",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590043",
                "areaType": 4,
                "areaName": "人民路街道",
                "parentAreaId": "659004",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590044",
                "areaType": 4,
                "areaName": "兵团一零一团",
                "parentAreaId": "659004",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590045",
                "areaType": 4,
                "areaName": "兵团一零三团",
                "parentAreaId": "659004",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590046",
                "areaType": 4,
                "areaName": "青湖路街道",
                "parentAreaId": "659004",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "652800",
            "areaType": 3,
            "areaName": "巴音郭楞蒙古自治州",
            "parentAreaId": "650000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "652827",
                "areaType": 4,
                "areaName": "和静县",
                "parentAreaId": "652800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "652828",
                "areaType": 4,
                "areaName": "和硕县",
                "parentAreaId": "652800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "652826",
                "areaType": 4,
                "areaName": "焉耆回族自治县",
                "parentAreaId": "652800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "652829",
                "areaType": 4,
                "areaName": "博湖县",
                "parentAreaId": "652800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "652824",
                "areaType": 4,
                "areaName": "若羌县",
                "parentAreaId": "652800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "652825",
                "areaType": 4,
                "areaName": "且末县",
                "parentAreaId": "652800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "652801",
                "areaType": 4,
                "areaName": "库尔勒市",
                "parentAreaId": "652800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "652822",
                "areaType": 4,
                "areaName": "轮台县",
                "parentAreaId": "652800",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "652823",
                "areaType": 4,
                "areaName": "尉犁县",
                "parentAreaId": "652800",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "650100",
            "areaType": 3,
            "areaName": "乌鲁木齐市",
            "parentAreaId": "650000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "650107",
                "areaType": 4,
                "areaName": "达坂城区",
                "parentAreaId": "650100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "650102",
                "areaType": 4,
                "areaName": "天山区",
                "parentAreaId": "650100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "650105",
                "areaType": 4,
                "areaName": "水磨沟区",
                "parentAreaId": "650100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "650109",
                "areaType": 4,
                "areaName": "米东区",
                "parentAreaId": "650100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "650121",
                "areaType": 4,
                "areaName": "乌鲁木齐县",
                "parentAreaId": "650100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "650106",
                "areaType": 4,
                "areaName": "头屯河区",
                "parentAreaId": "650100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "650104",
                "areaType": 4,
                "areaName": "新市区",
                "parentAreaId": "650100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "650103",
                "areaType": 4,
                "areaName": "沙依巴克区",
                "parentAreaId": "650100",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "654000",
            "areaType": 3,
            "areaName": "伊犁哈萨克自治州",
            "parentAreaId": "650000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "654003",
                "areaType": 4,
                "areaName": "奎屯市",
                "parentAreaId": "654000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "654021",
                "areaType": 4,
                "areaName": "伊宁县",
                "parentAreaId": "654000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "654028",
                "areaType": 4,
                "areaName": "尼勒克县",
                "parentAreaId": "654000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "654024",
                "areaType": 4,
                "areaName": "巩留县",
                "parentAreaId": "654000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "654025",
                "areaType": 4,
                "areaName": "新源县",
                "parentAreaId": "654000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "654027",
                "areaType": 4,
                "areaName": "特克斯县",
                "parentAreaId": "654000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "654026",
                "areaType": 4,
                "areaName": "昭苏县",
                "parentAreaId": "654000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "654023",
                "areaType": 4,
                "areaName": "霍城县",
                "parentAreaId": "654000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "654002",
                "areaType": 4,
                "areaName": "伊宁市",
                "parentAreaId": "654000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "654022",
                "areaType": 4,
                "areaName": "察布查尔锡伯自治县",
                "parentAreaId": "654000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "654004",
                "areaType": 4,
                "areaName": "霍尔果斯市",
                "parentAreaId": "654000",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "652900",
            "areaType": 3,
            "areaName": "阿克苏地区",
            "parentAreaId": "650000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "652926",
                "areaType": 4,
                "areaName": "拜城县",
                "parentAreaId": "652900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "652922",
                "areaType": 4,
                "areaName": "温宿县",
                "parentAreaId": "652900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "652902",
                "areaType": 4,
                "areaName": "库车市",
                "parentAreaId": "652900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "652925",
                "areaType": 4,
                "areaName": "新和县",
                "parentAreaId": "652900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "652924",
                "areaType": 4,
                "areaName": "沙雅县",
                "parentAreaId": "652900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "652901",
                "areaType": 4,
                "areaName": "阿克苏市",
                "parentAreaId": "652900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "652929",
                "areaType": 4,
                "areaName": "柯坪县",
                "parentAreaId": "652900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "652928",
                "areaType": 4,
                "areaName": "阿瓦提县",
                "parentAreaId": "652900",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "652927",
                "areaType": 4,
                "areaName": "乌什县",
                "parentAreaId": "652900",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "659002",
            "areaType": 3,
            "areaName": "阿拉尔市",
            "parentAreaId": "650000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "6590021",
                "areaType": 4,
                "areaName": "幸福路街道",
                "parentAreaId": "659002",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590022",
                "areaType": 4,
                "areaName": "阿拉尔农场",
                "parentAreaId": "659002",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590023",
                "areaType": 4,
                "areaName": "兵团第一师幸福农场",
                "parentAreaId": "659002",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590024",
                "areaType": 4,
                "areaName": "工业园区",
                "parentAreaId": "659002",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590025",
                "areaType": 4,
                "areaName": "兵团七团",
                "parentAreaId": "659002",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590026",
                "areaType": 4,
                "areaName": "兵团十一团",
                "parentAreaId": "659002",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590027",
                "areaType": 4,
                "areaName": "青松路街道",
                "parentAreaId": "659002",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590028",
                "areaType": 4,
                "areaName": "托喀依乡",
                "parentAreaId": "659002",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590029",
                "areaType": 4,
                "areaName": "兵团第一师水利水电工程处",
                "parentAreaId": "659002",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "65900210",
                "areaType": 4,
                "areaName": "兵团八团",
                "parentAreaId": "659002",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "65900211",
                "areaType": 4,
                "areaName": "中心监狱",
                "parentAreaId": "659002",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "65900212",
                "areaType": 4,
                "areaName": "兵团第一师塔里木灌区水利管理处",
                "parentAreaId": "659002",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "65900213",
                "areaType": 4,
                "areaName": "兵团十四团",
                "parentAreaId": "659002",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "65900214",
                "areaType": 4,
                "areaName": "兵团十六团",
                "parentAreaId": "659002",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "65900215",
                "areaType": 4,
                "areaName": "金银川路街道",
                "parentAreaId": "659002",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "65900216",
                "areaType": 4,
                "areaName": "兵团十二团",
                "parentAreaId": "659002",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "65900217",
                "areaType": 4,
                "areaName": "兵团十团",
                "parentAreaId": "659002",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "65900218",
                "areaType": 4,
                "areaName": "兵团十三团",
                "parentAreaId": "659002",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "65900219",
                "areaType": 4,
                "areaName": "南口街道",
                "parentAreaId": "659002",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "653100",
            "areaType": 3,
            "areaName": "喀什地区",
            "parentAreaId": "650000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "653122",
                "areaType": 4,
                "areaName": "疏勒县",
                "parentAreaId": "653100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "653129",
                "areaType": 4,
                "areaName": "伽师县",
                "parentAreaId": "653100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "653127",
                "areaType": 4,
                "areaName": "麦盖提县",
                "parentAreaId": "653100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "653128",
                "areaType": 4,
                "areaName": "岳普湖县",
                "parentAreaId": "653100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "653125",
                "areaType": 4,
                "areaName": "莎车县",
                "parentAreaId": "653100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "653126",
                "areaType": 4,
                "areaName": "叶城县",
                "parentAreaId": "653100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "653131",
                "areaType": 4,
                "areaName": "塔什库尔干塔吉克自治县",
                "parentAreaId": "653100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "653124",
                "areaType": 4,
                "areaName": "泽普县",
                "parentAreaId": "653100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "653130",
                "areaType": 4,
                "areaName": "巴楚县",
                "parentAreaId": "653100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "653121",
                "areaType": 4,
                "areaName": "疏附县",
                "parentAreaId": "653100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "653123",
                "areaType": 4,
                "areaName": "英吉沙县",
                "parentAreaId": "653100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "653101",
                "areaType": 4,
                "areaName": "喀什市",
                "parentAreaId": "653100",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "659003",
            "areaType": 3,
            "areaName": "图木舒克市",
            "parentAreaId": "650000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "6590031",
                "areaType": 4,
                "areaName": "兵团四十九团",
                "parentAreaId": "659003",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590032",
                "areaType": 4,
                "areaName": "兵团图木舒克市永安坝",
                "parentAreaId": "659003",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590033",
                "areaType": 4,
                "areaName": "兵团五十一团",
                "parentAreaId": "659003",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590034",
                "areaType": 4,
                "areaName": "前海街道",
                "parentAreaId": "659003",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590035",
                "areaType": 4,
                "areaName": "兵团图木舒克市喀拉拜勒镇",
                "parentAreaId": "659003",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590036",
                "areaType": 4,
                "areaName": "永安坝街道",
                "parentAreaId": "659003",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590037",
                "areaType": 4,
                "areaName": "齐干却勒街道",
                "parentAreaId": "659003",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590038",
                "areaType": 4,
                "areaName": "兵团五十三团",
                "parentAreaId": "659003",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590039",
                "areaType": 4,
                "areaName": "兵团五十团",
                "parentAreaId": "659003",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "65900310",
                "areaType": 4,
                "areaName": "兵团四十四团",
                "parentAreaId": "659003",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "653000",
            "areaType": 3,
            "areaName": "克孜勒苏柯尔克孜自治州",
            "parentAreaId": "650000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "653001",
                "areaType": 4,
                "areaName": "阿图什市",
                "parentAreaId": "653000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "653024",
                "areaType": 4,
                "areaName": "乌恰县",
                "parentAreaId": "653000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "653023",
                "areaType": 4,
                "areaName": "阿合奇县",
                "parentAreaId": "653000",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "653022",
                "areaType": 4,
                "areaName": "阿克陶县",
                "parentAreaId": "653000",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "650500",
            "areaType": 3,
            "areaName": "哈密市",
            "parentAreaId": "650000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "650522",
                "areaType": 4,
                "areaName": "伊吾县",
                "parentAreaId": "650500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "650521",
                "areaType": 4,
                "areaName": "巴里坤哈萨克自治县",
                "parentAreaId": "650500",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "650502",
                "areaType": 4,
                "areaName": "伊州区",
                "parentAreaId": "650500",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "650400",
            "areaType": 3,
            "areaName": "吐鲁番市",
            "parentAreaId": "650000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "650402",
                "areaType": 4,
                "areaName": "高昌区",
                "parentAreaId": "650400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "650421",
                "areaType": 4,
                "areaName": "鄯善县",
                "parentAreaId": "650400",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "650422",
                "areaType": 4,
                "areaName": "托克逊县",
                "parentAreaId": "650400",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "650200",
            "areaType": 3,
            "areaName": "克拉玛依市",
            "parentAreaId": "650000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "650205",
                "areaType": 4,
                "areaName": "乌尔禾区",
                "parentAreaId": "650200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "650204",
                "areaType": 4,
                "areaName": "白碱滩区",
                "parentAreaId": "650200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "650203",
                "areaType": 4,
                "areaName": "克拉玛依区",
                "parentAreaId": "650200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "650202",
                "areaType": 4,
                "areaName": "独山子区",
                "parentAreaId": "650200",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "659010",
            "areaType": 3,
            "areaName": "胡杨河市",
            "parentAreaId": "650000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "6590101",
                "areaType": 4,
                "areaName": "兵团一三零团",
                "parentAreaId": "659010",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590102",
                "areaType": 4,
                "areaName": "五五新镇街道",
                "parentAreaId": "659010",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590103",
                "areaType": 4,
                "areaName": "兵团一二八团",
                "parentAreaId": "659010",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "6590104",
                "areaType": 4,
                "areaName": "兵团一二九团",
                "parentAreaId": "659010",
                "zip": null,
                "childAreas": null
              }
            ]
          }
        ]
      },
      {
        "areaId": "110000",
        "areaType": 2,
        "areaName": "北京市",
        "parentAreaId": "1",
        "zip": null,
        "childAreas": [
          {
            "areaId": "110100",
            "areaType": 3,
            "areaName": "北京城区",
            "parentAreaId": "110000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "110116",
                "areaType": 4,
                "areaName": "怀柔区",
                "parentAreaId": "110100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "110118",
                "areaType": 4,
                "areaName": "密云区",
                "parentAreaId": "110100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "110119",
                "areaType": 4,
                "areaName": "延庆区",
                "parentAreaId": "110100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "110109",
                "areaType": 4,
                "areaName": "门头沟区",
                "parentAreaId": "110100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "110113",
                "areaType": 4,
                "areaName": "顺义区",
                "parentAreaId": "110100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "110105",
                "areaType": 4,
                "areaName": "朝阳区",
                "parentAreaId": "110100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "110117",
                "areaType": 4,
                "areaName": "平谷区",
                "parentAreaId": "110100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "110115",
                "areaType": 4,
                "areaName": "大兴区",
                "parentAreaId": "110100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "110112",
                "areaType": 4,
                "areaName": "通州区",
                "parentAreaId": "110100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "110114",
                "areaType": 4,
                "areaName": "昌平区",
                "parentAreaId": "110100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "110102",
                "areaType": 4,
                "areaName": "西城区",
                "parentAreaId": "110100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "110101",
                "areaType": 4,
                "areaName": "东城区",
                "parentAreaId": "110100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "110107",
                "areaType": 4,
                "areaName": "石景山区",
                "parentAreaId": "110100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "110108",
                "areaType": 4,
                "areaName": "海淀区",
                "parentAreaId": "110100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "110111",
                "areaType": 4,
                "areaName": "房山区",
                "parentAreaId": "110100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "110106",
                "areaType": 4,
                "areaName": "丰台区",
                "parentAreaId": "110100",
                "zip": null,
                "childAreas": null
              }
            ]
          }
        ]
      },
      {
        "areaId": "120000",
        "areaType": 2,
        "areaName": "天津市",
        "parentAreaId": "1",
        "zip": null,
        "childAreas": [
          {
            "areaId": "120100",
            "areaType": 3,
            "areaName": "天津城区",
            "parentAreaId": "120000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "120101",
                "areaType": 4,
                "areaName": "和平区",
                "parentAreaId": "120100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "120115",
                "areaType": 4,
                "areaName": "宝坻区",
                "parentAreaId": "120100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "120105",
                "areaType": 4,
                "areaName": "河北区",
                "parentAreaId": "120100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "120102",
                "areaType": 4,
                "areaName": "河东区",
                "parentAreaId": "120100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "120110",
                "areaType": 4,
                "areaName": "东丽区",
                "parentAreaId": "120100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "120112",
                "areaType": 4,
                "areaName": "津南区",
                "parentAreaId": "120100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "120116",
                "areaType": 4,
                "areaName": "滨海新区",
                "parentAreaId": "120100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "120118",
                "areaType": 4,
                "areaName": "静海区",
                "parentAreaId": "120100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "120119",
                "areaType": 4,
                "areaName": "蓟州区",
                "parentAreaId": "120100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "120114",
                "areaType": 4,
                "areaName": "武清区",
                "parentAreaId": "120100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "120104",
                "areaType": 4,
                "areaName": "南开区",
                "parentAreaId": "120100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "120103",
                "areaType": 4,
                "areaName": "河西区",
                "parentAreaId": "120100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "120117",
                "areaType": 4,
                "areaName": "宁河区",
                "parentAreaId": "120100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "120113",
                "areaType": 4,
                "areaName": "北辰区",
                "parentAreaId": "120100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "120106",
                "areaType": 4,
                "areaName": "红桥区",
                "parentAreaId": "120100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "120111",
                "areaType": 4,
                "areaName": "西青区",
                "parentAreaId": "120100",
                "zip": null,
                "childAreas": null
              }
            ]
          }
        ]
      },
      {
        "areaId": "310000",
        "areaType": 2,
        "areaName": "上海市",
        "parentAreaId": "1",
        "zip": null,
        "childAreas": [
          {
            "areaId": "310100",
            "areaType": 3,
            "areaName": "上海城区",
            "parentAreaId": "310000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "310151",
                "areaType": 4,
                "areaName": "崇明区",
                "parentAreaId": "310100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "310115",
                "areaType": 4,
                "areaName": "浦东新区",
                "parentAreaId": "310100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "310120",
                "areaType": 4,
                "areaName": "奉贤区",
                "parentAreaId": "310100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "310116",
                "areaType": 4,
                "areaName": "金山区",
                "parentAreaId": "310100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "310113",
                "areaType": 4,
                "areaName": "宝山区",
                "parentAreaId": "310100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "310114",
                "areaType": 4,
                "areaName": "嘉定区",
                "parentAreaId": "310100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "310107",
                "areaType": 4,
                "areaName": "普陀区",
                "parentAreaId": "310100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "310101",
                "areaType": 4,
                "areaName": "黄浦区",
                "parentAreaId": "310100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "310110",
                "areaType": 4,
                "areaName": "杨浦区",
                "parentAreaId": "310100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "310117",
                "areaType": 4,
                "areaName": "松江区",
                "parentAreaId": "310100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "310105",
                "areaType": 4,
                "areaName": "长宁区",
                "parentAreaId": "310100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "310106",
                "areaType": 4,
                "areaName": "静安区",
                "parentAreaId": "310100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "310109",
                "areaType": 4,
                "areaName": "虹口区",
                "parentAreaId": "310100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "310112",
                "areaType": 4,
                "areaName": "闵行区",
                "parentAreaId": "310100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "310104",
                "areaType": 4,
                "areaName": "徐汇区",
                "parentAreaId": "310100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "310118",
                "areaType": 4,
                "areaName": "青浦区",
                "parentAreaId": "310100",
                "zip": null,
                "childAreas": null
              }
            ]
          }
        ]
      },
      {
        "areaId": "500000",
        "areaType": 2,
        "areaName": "重庆市",
        "parentAreaId": "1",
        "zip": null,
        "childAreas": [
          {
            "areaId": "500200",
            "areaType": 3,
            "areaName": "重庆郊县",
            "parentAreaId": "500000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "500229",
                "areaType": 4,
                "areaName": "城口县",
                "parentAreaId": "500200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "500238",
                "areaType": 4,
                "areaName": "巫溪县",
                "parentAreaId": "500200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "500236",
                "areaType": 4,
                "areaName": "奉节县",
                "parentAreaId": "500200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "500230",
                "areaType": 4,
                "areaName": "丰都县",
                "parentAreaId": "500200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "500243",
                "areaType": 4,
                "areaName": "彭水苗族土家族自治县",
                "parentAreaId": "500200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "500241",
                "areaType": 4,
                "areaName": "秀山土家族苗族自治县",
                "parentAreaId": "500200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "500235",
                "areaType": 4,
                "areaName": "云阳县",
                "parentAreaId": "500200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "500237",
                "areaType": 4,
                "areaName": "巫山县",
                "parentAreaId": "500200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "500231",
                "areaType": 4,
                "areaName": "垫江县",
                "parentAreaId": "500200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "500242",
                "areaType": 4,
                "areaName": "酉阳土家族苗族自治县",
                "parentAreaId": "500200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "500240",
                "areaType": 4,
                "areaName": "石柱土家族自治县",
                "parentAreaId": "500200",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "500233",
                "areaType": 4,
                "areaName": "忠县",
                "parentAreaId": "500200",
                "zip": null,
                "childAreas": null
              }
            ]
          },
          {
            "areaId": "500100",
            "areaType": 3,
            "areaName": "重庆城区",
            "parentAreaId": "500000",
            "zip": null,
            "childAreas": [
              {
                "areaId": "500117",
                "areaType": 4,
                "areaName": "合川区",
                "parentAreaId": "500100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "500152",
                "areaType": 4,
                "areaName": "潼南区",
                "parentAreaId": "500100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "500151",
                "areaType": 4,
                "areaName": "铜梁区",
                "parentAreaId": "500100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "500115",
                "areaType": 4,
                "areaName": "长寿区",
                "parentAreaId": "500100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "500120",
                "areaType": 4,
                "areaName": "璧山区",
                "parentAreaId": "500100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "500111",
                "areaType": 4,
                "areaName": "大足区",
                "parentAreaId": "500100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "500153",
                "areaType": 4,
                "areaName": "荣昌区",
                "parentAreaId": "500100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "500156",
                "areaType": 4,
                "areaName": "武隆区",
                "parentAreaId": "500100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "500103",
                "areaType": 4,
                "areaName": "渝中区",
                "parentAreaId": "500100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "500118",
                "areaType": 4,
                "areaName": "永川区",
                "parentAreaId": "500100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "500119",
                "areaType": 4,
                "areaName": "南川区",
                "parentAreaId": "500100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "500104",
                "areaType": 4,
                "areaName": "大渡口区",
                "parentAreaId": "500100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "500107",
                "areaType": 4,
                "areaName": "九龙坡区",
                "parentAreaId": "500100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "500101",
                "areaType": 4,
                "areaName": "万州区",
                "parentAreaId": "500100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "500102",
                "areaType": 4,
                "areaName": "涪陵区",
                "parentAreaId": "500100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "500110",
                "areaType": 4,
                "areaName": "綦江区",
                "parentAreaId": "500100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "500155",
                "areaType": 4,
                "areaName": "梁平区",
                "parentAreaId": "500100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "500154",
                "areaType": 4,
                "areaName": "开州区",
                "parentAreaId": "500100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "500116",
                "areaType": 4,
                "areaName": "江津区",
                "parentAreaId": "500100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "500114",
                "areaType": 4,
                "areaName": "黔江区",
                "parentAreaId": "500100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "500113",
                "areaType": 4,
                "areaName": "巴南区",
                "parentAreaId": "500100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "500108",
                "areaType": 4,
                "areaName": "南岸区",
                "parentAreaId": "500100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "500106",
                "areaType": 4,
                "areaName": "沙坪坝区",
                "parentAreaId": "500100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "500109",
                "areaType": 4,
                "areaName": "北碚区",
                "parentAreaId": "500100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "500105",
                "areaType": 4,
                "areaName": "江北区",
                "parentAreaId": "500100",
                "zip": null,
                "childAreas": null
              },
              {
                "areaId": "500112",
                "areaType": 4,
                "areaName": "渝北区",
                "parentAreaId": "500100",
                "zip": null,
                "childAreas": null
              }
            ]
          }
        ]
      },
      {
        "areaId": "810000",
        "areaType": 2,
        "areaName": "香港特别行政区",
        "parentAreaId": "1",
        "zip": null,
        "childAreas": [
          {
            "areaId": "810014",
            "areaType": 3,
            "areaName": "大埔區",
            "parentAreaId": "810000",
            "zip": null,
            "childAreas": []
          },
          {
            "areaId": "810011",
            "areaType": 3,
            "areaName": "屯門區",
            "parentAreaId": "810000",
            "zip": null,
            "childAreas": []
          },
          {
            "areaId": "810013",
            "areaType": 3,
            "areaName": "北區",
            "parentAreaId": "810000",
            "zip": null,
            "childAreas": []
          },
          {
            "areaId": "810016",
            "areaType": 3,
            "areaName": "沙田區",
            "parentAreaId": "810000",
            "zip": null,
            "childAreas": []
          },
          {
            "areaId": "810015",
            "areaType": 3,
            "areaName": "西貢區",
            "parentAreaId": "810000",
            "zip": null,
            "childAreas": []
          },
          {
            "areaId": "810008",
            "areaType": 3,
            "areaName": "黃大仙區",
            "parentAreaId": "810000",
            "zip": null,
            "childAreas": []
          },
          {
            "areaId": "810009",
            "areaType": 3,
            "areaName": "觀塘區",
            "parentAreaId": "810000",
            "zip": null,
            "childAreas": []
          },
          {
            "areaId": "810007",
            "areaType": 3,
            "areaName": "九龍城區",
            "parentAreaId": "810000",
            "zip": null,
            "childAreas": []
          },
          {
            "areaId": "810006",
            "areaType": 3,
            "areaName": "深水埗區",
            "parentAreaId": "810000",
            "zip": null,
            "childAreas": []
          },
          {
            "areaId": "810001",
            "areaType": 3,
            "areaName": "中西區",
            "parentAreaId": "810000",
            "zip": null,
            "childAreas": []
          },
          {
            "areaId": "810004",
            "areaType": 3,
            "areaName": "南區",
            "parentAreaId": "810000",
            "zip": null,
            "childAreas": []
          },
          {
            "areaId": "810002",
            "areaType": 3,
            "areaName": "灣仔區",
            "parentAreaId": "810000",
            "zip": null,
            "childAreas": []
          },
          {
            "areaId": "810018",
            "areaType": 3,
            "areaName": "離島區",
            "parentAreaId": "810000",
            "zip": null,
            "childAreas": []
          },
          {
            "areaId": "810005",
            "areaType": 3,
            "areaName": "油尖旺區",
            "parentAreaId": "810000",
            "zip": null,
            "childAreas": []
          },
          {
            "areaId": "810003",
            "areaType": 3,
            "areaName": "東區",
            "parentAreaId": "810000",
            "zip": null,
            "childAreas": []
          },
          {
            "areaId": "810012",
            "areaType": 3,
            "areaName": "元朗區",
            "parentAreaId": "810000",
            "zip": null,
            "childAreas": []
          },
          {
            "areaId": "810010",
            "areaType": 3,
            "areaName": "荃灣區",
            "parentAreaId": "810000",
            "zip": null,
            "childAreas": []
          },
          {
            "areaId": "810017",
            "areaType": 3,
            "areaName": "葵青區",
            "parentAreaId": "810000",
            "zip": null,
            "childAreas": []
          }
        ]
      },
      {
        "areaId": "820000",
        "areaType": 2,
        "areaName": "澳门特别行政区",
        "parentAreaId": "1",
        "zip": null,
        "childAreas": [
          {
            "areaId": "820002",
            "areaType": 3,
            "areaName": "花王堂區",
            "parentAreaId": "820000",
            "zip": null,
            "childAreas": []
          },
          {
            "areaId": "820003",
            "areaType": 3,
            "areaName": "望德堂區",
            "parentAreaId": "820000",
            "zip": null,
            "childAreas": []
          },
          {
            "areaId": "820006",
            "areaType": 3,
            "areaName": "嘉模堂區",
            "parentAreaId": "820000",
            "zip": null,
            "childAreas": []
          },
          {
            "areaId": "820008",
            "areaType": 3,
            "areaName": "聖方濟各堂區",
            "parentAreaId": "820000",
            "zip": null,
            "childAreas": []
          },
          {
            "areaId": "820001",
            "areaType": 3,
            "areaName": "花地瑪堂區",
            "parentAreaId": "820000",
            "zip": null,
            "childAreas": []
          },
          {
            "areaId": "820007",
            "areaType": 3,
            "areaName": "路氹填海區",
            "parentAreaId": "820000",
            "zip": null,
            "childAreas": []
          },
          {
            "areaId": "820005",
            "areaType": 3,
            "areaName": "風順堂區",
            "parentAreaId": "820000",
            "zip": null,
            "childAreas": []
          },
          {
            "areaId": "820004",
            "areaType": 3,
            "areaName": "大堂區",
            "parentAreaId": "820000",
            "zip": null,
            "childAreas": []
          }
        ]
      }
    ];
    
    provinceData.map((province) {
      provinceTreeData.add(PickerItem(
        text: province['areaName'],
        value: province['areaId'],
        children: province['childAreas'].map((city) {
          PickerItem(
            text: city['areaName'],
            value: city['areaId'],
            children: city['childAreas'].map((area) {
              PickerItem(text: area['areaName'], value: area['areaId']);
            }),
          );
        }),
      ));
    });
  }

  @override
  void initState() {
    formatData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
