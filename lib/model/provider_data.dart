class ProviderData {
  final String providerName;
  final dynamic providerFunction;
  bool? streamFound; // Make it nullable to track unsearched state
  bool? isSearching;

  ProviderData({
    required this.providerName,
    required this.providerFunction,
    this.streamFound,
    this.isSearching,
  });
}
