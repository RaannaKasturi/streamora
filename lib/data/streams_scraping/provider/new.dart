// void main() async {
//   final provider = Embed();
//   final movieData = ScrapeStreamsData(
//     title: "Dhoom Dhaam",
//     imdbId: "tt14401230",
//     tmdbId: "822119",
//     mediaType: "movie",
//     year: "2025",
//   );
//   List<VideoData> streams = await provider.scrape(movieData: movieData);
//   for (var stream in streams) {
//     print(
//       "Stream: ${stream.videoSource} - ${stream.videoSourceUrl}\n${stream.videoSourceHeaders}",
//     );
//   }
// }
