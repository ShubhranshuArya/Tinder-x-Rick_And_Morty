import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grroom_tinder_lite/core/services/api_service.dart';
import 'package:grroom_tinder_lite/model/apiModel.dart';
import 'package:grroom_tinder_lite/view/widgets/swipe_item.dart';

class ListDataController extends GetxController {
  var _isLoading = true.obs;

  var _listLength = 0.obs;

  var _staticData = Rx<ApiModel>(ApiModel());

  var _likedList = <Result>[].obs;

  var _dislikedList = <Result>[].obs;

  var _nextBatch = "".obs;

  bool get isLoading => _isLoading.value;

  int get itemIndex => _listLength.value;

  ApiModel get staticData => _staticData.value;

  List<Result> get likedList => _likedList;

  List<Result> get dislikedlist => _dislikedList;

  String get nextBatch => _nextBatch.value;

  @override
  void onInit() {
    fetchListData();
    super.onInit();
  }

  void fetchListData() async {
    _isLoading.value = true;
    try {
      var apiData =
          await ApiService.getData("https://rickandmortyapi.com/api/character");
      if (apiData != null) {
        _staticData.value = apiData;
        _nextBatch.value = _staticData.value.info.next;
      }
    } finally {
      _isLoading.value = false;
    }
    update();
  }

  /// Pagination working. Card container is not updating.

  void paginateData(String url) async {
    _isLoading.value = true;
    try {
      _staticData.value = ApiModel();
      var apiData = await ApiService.getData(url);
      if (apiData != null) {
        _staticData.value = apiData;
        _nextBatch.value = _staticData.value.info.next;
      }
      cards();
    } finally {
      _isLoading.value = false;
    }
    update();
  }

  List<Widget> cards() {
    return List.generate(
      _staticData.value.results.length,
      (int index) {
        return SwipeItem(
          apiData: _staticData.value.results[index],
        );
      },
    );
  }

  void addToLikedList() {
    _likedList.add(_staticData.value.results[_listLength.value]);
    _listLength.value++;
  }

  void addToDislikedList() {
    _dislikedList.add(_staticData.value.results[_listLength.value]);
    _listLength.value++;
  }

  void deleteFromLiked(int index) {
    _likedList.removeWhere((result) => result.name == _likedList[index].name);
    update();
  }

  void deleteFromDisLiked(int index) {
    _dislikedList
        .removeWhere((result) => result.name == _dislikedList[index].name);
    update();
  }
}
