class PopularFilterListData {
  PopularFilterListData({
    this.titleTxt = "",
    this.isSelected = false,
  });

  String titleTxt;
  bool isSelected;

  static List<PopularFilterListData> popularFList = <PopularFilterListData>[
    PopularFilterListData(titleTxt: "免费早餐", isSelected: false,),
    PopularFilterListData(titleTxt: "免费停车位", isSelected: false,),
    PopularFilterListData(titleTxt: "游泳池", isSelected: false,),
    PopularFilterListData(titleTxt: "可带宠物", isSelected: false,),
    PopularFilterListData(titleTxt: "免费WIFI", isSelected: false,)
  ];

  static List<PopularFilterListData> accommodationList = <PopularFilterListData>[
    PopularFilterListData(titleTxt: "所有", isSelected:  false),
    PopularFilterListData(titleTxt: "旅馆", isSelected:  false),
    PopularFilterListData(titleTxt: "家庭", isSelected:  false),
    PopularFilterListData(titleTxt: "威尔拉", isSelected:  false),
    PopularFilterListData(titleTxt: "酒店", isSelected:  false),
    PopularFilterListData(titleTxt: "娱乐场", isSelected:  false),
  ];
}