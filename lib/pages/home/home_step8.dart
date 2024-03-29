import 'package:app/configs/colors.dart';
import 'package:app/configs/routes.dart';

import 'package:app/configs/text_styles.dart';
import 'package:app/controllers/home_controller.dart';
import 'package:app/controllers/manager_controller.dart';
import 'package:app/controllers/review_controller.dart';

import 'package:app/helpers/date_calculator.dart';
import 'package:app/widgets/loading/loading.dart';

import 'package:app/widgets/button/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../controllers/auth_controller.dart';
import '../../widgets/button/grey_border_button.dart';
import '../../widgets/modal/result_modal.dart';
import '../mypage/my_reservation.dart';

class HomeStep8Items extends StatelessWidget {
  HomeStep8Items({Key? key}) : super(key: key);
  HomeController homeController = Get.find();
  ReviewController reviewController = Get.put(ReviewController());
  ManagerController managerController = Get.find();
  AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: managerController.managerModelList.length * 99,
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(0),
                  scrollDirection: Axis.vertical,
                  itemCount: managerController.managerModelList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                "${managerController.managerModelList[index].value!.profileImage}",
                                width: 89,
                                height: 89,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Image.asset(
                                  "images/empty_profile.png",
                                  width: 89,
                                  height: 89,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    text: managerController
                                        .managerModelList[index].value!.name,
                                    style: IcoTextStyle.boldTextStyle19B,
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: ' 도우미',
                                          style: IcoTextStyle
                                              .mediumTextStyle12Grey4),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                RatingBar(
                                  ignoreGestures: true,
                                  initialRating: managerController
                                      .managerModelList[index]
                                      .value!
                                      .managerRate
                                      .toDouble(),
                                  direction: Axis.horizontal,
                                  allowHalfRating: false,
                                  itemCount: 5,
                                  ratingWidget: RatingWidget(
                                    full:
                                        SvgPicture.asset('icons/star_full.svg'),
                                    half:
                                        SvgPicture.asset('icons/star_full.svg'),
                                    empty: SvgPicture.asset(
                                        'icons/star_empty.svg'),
                                  ),
                                  itemSize: 14,
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Text(
                                    "${managerController.managerModelList[index].value!.companyName} 소속",
                                    style: IcoTextStyle.mediumTextStyle12Grey4),
                              ],
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () async {
                                  startLoadingIndicator();

                                  reviewController.finalReviewModelList =
                                      await reviewController.getJsonReviews(
                                          managerController
                                              .managerModelList[index]
                                              .value!
                                              .uid,
                                          'manager',
                                          0,
                                          3,
                                          '기말');

                                  await reviewController
                                      .extractFirstIndexPictures(
                                          reviewController.totalReviews.value!,
                                          managerController
                                              .managerModelList[index]
                                              .value!
                                              .uid,
                                          'manager',
                                          0,
                                          3,
                                          '기말',
                                          reviewController
                                              .reviewListWithPicture);
                                  finishLoadingIndicator();
                                  Get.toNamed(Routes.MANAGER, arguments: index);
                                },
                                child: Container(
                                  height: 89,
                                  alignment: Alignment.centerRight,
                                  child: SvgPicture.asset(
                                    'icons/arrow_wide.svg',
                                    color: IcoColors.grey3,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    );
                  })),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(17),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: IcoColors.grey1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset("icons/calander_icon.svg"),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "서비스 일정",
                          style: IcoTextStyle.boldTextStyle15B,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 11,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(thickness: 1),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        "서비스 시작일",
                        style: IcoTextStyle.mediumTextStyle12Grey4,
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Text(
                        "${homeController.reservationModel.value!.serviceStartDate}",
                        style: IcoTextStyle.mediumTextStyle15Grey4,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        "서비스 기간",
                        style: IcoTextStyle.mediumTextStyle12Grey4,
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${homeController.reservationModel.value!.serviceStartDate!} ~ ${homeController.reservationModel.value!.serviceEndDate}",
                            style: IcoTextStyle.mediumTextStyle15B,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: BorderButton(
                  textStyle: IcoTextStyle.mediumTextStyle15B,
                  borderColor: IcoColors.grey2,
                  onTap: () {
                    Get.to(MyReservationPage());
                  },
                  width: double.infinity,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: BorderButton(
                  textStyle: IcoTextStyle.mediumTextStyle15W,
                  borderColor: IcoColors.primary,
                  buttonColor: IcoColors.primary,
                  buttonText: '서비스 문의',
                  onTap: () {
                    BottomButtonSheet(
                        authController.reservationModel.value!.chosenCompany!);
                  },
                  width: double.infinity,
                ),
              ),
            ],
          )
        ],
      );
    });
  }
}
