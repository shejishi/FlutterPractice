import 'package:flutter/material.dart';
import 'package:flutter_demo/hotel/model/HotelList.dart';
import 'package:flutter_demo/hotel/model/HotelTheme.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HotelListView extends StatelessWidget {
  final HotelListData? hotelData;
  final AnimationController? animationController;
  final Animation<double>? animation;

  const HotelListView(
      {Key? key, this.hotelData, this.animationController, this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController!,
        builder: (BuildContext context, Widget? child) {
          return FadeTransition(
            opacity: animation!,
            child: Transform(
              transform: Matrix4.translationValues(
                  0.0, 50 * (1.0 - animation!.value), 0.0),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 24, right: 24, top: 8, bottom: 16),
                child: InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.6),
                          offset: const Offset(4, 4),
                          blurRadius: 16,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              AspectRatio(
                                aspectRatio: 2,
                                child: Image.asset(
                                  hotelData!.imagePath,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                color: HotelAppTheme.buildLightTheme()
                                    .backgroundColor,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 16, top: 8, bottom: 8),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                hotelData!.titleTxt,
                                                textAlign: TextAlign.start,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 22,
                                                ),
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    hotelData!.subTxt,
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.grey
                                                            .withOpacity(0.8)),
                                                  ),
                                                  const SizedBox(width: 4),
                                                  Icon(
                                                    FontAwesomeIcons
                                                        .mapMarkerAlt,
                                                    size: 12,
                                                    color: HotelAppTheme
                                                            .buildLightTheme()
                                                        .primaryColor,
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      '${hotelData!.dist.toStringAsFixed(1)} km to city',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.grey
                                                            .withOpacity(0.8),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 4),
                                                child: Row(
                                                  children: [
                                                    RatingBar(
                                                      ratingWidget:
                                                          RatingWidget(
                                                        empty: Icon(
                                                          Icons
                                                              .star_half_rounded,
                                                          color: HotelAppTheme
                                                                  .buildLightTheme()
                                                              .primaryColor,
                                                        ),
                                                        full: Icon(
                                                          Icons
                                                              .star_rate_rounded,
                                                          color: HotelAppTheme
                                                                  .buildLightTheme()
                                                              .primaryColor,
                                                        ),
                                                        half: Icon(
                                                          Icons
                                                              .star_half_rounded,
                                                          color: HotelAppTheme
                                                                  .buildLightTheme()
                                                              .primaryColor,
                                                        ),
                                                      ),
                                                      onRatingUpdate:
                                                          (rating) {},
                                                      itemPadding:
                                                          EdgeInsets.zero,
                                                      initialRating:
                                                          hotelData!.rating,
                                                      direction:
                                                          Axis.horizontal,
                                                      allowHalfRating: true,
                                                      itemCount: 5,
                                                      itemSize: 25,
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        ' ${hotelData!.reviews} 查看',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 16, top: 8),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            '\$${hotelData!.perNight}',
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 22,
                                            ),
                                          ),
                                          Text(
                                            '/per night',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  Colors.grey.withOpacity(0.8),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
