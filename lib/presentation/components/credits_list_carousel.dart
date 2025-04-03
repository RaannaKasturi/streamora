import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:streamora/model/person_list_data.dart';

class CreditsListCarousel extends StatelessWidget {
  final List<PersonListData> creditsData;
  final bool isCast;
  const CreditsListCarousel({
    super.key,
    required this.creditsData,
    required this.isCast,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          alignment: Alignment.topLeft,
          child: Text(
            isCast ? "Cast" : "Crew",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        (creditsData.isNotEmpty)
            ? SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: creditsData
                      .map(
                        (cast) => Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          margin: const EdgeInsets.only(
                            left: 5,
                            right: 5,
                            bottom: 10,
                          ),
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundImage: CachedNetworkImageProvider(
                                  cast.profilePath,
                                ),
                                radius: 40,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                cast.name,
                                style: const TextStyle(fontSize: 16),
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                cast.characterName,
                                style: const TextStyle(fontSize: 14),
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              )
            : Center(
                child: Text(
                  "No ${isCast ? "Cast" : "Crew"} Found",
                  style: TextStyle(fontSize: 16),
                ),
              ),
      ],
    );
  }
}
