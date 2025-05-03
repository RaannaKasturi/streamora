import 'package:streamora/model/video_data.dart';

class ProviderData {
  final String providerName;
  final dynamic providerFunction;
  List<VideoData> videoDataList;
  bool? streamFound;
  bool? isSearching;

  ProviderData({
    required this.providerName,
    required this.providerFunction,
    required this.videoDataList,
    this.streamFound,
    this.isSearching,
  });
}
