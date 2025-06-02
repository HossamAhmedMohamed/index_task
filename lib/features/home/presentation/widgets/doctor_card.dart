// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:index_login/features/home/presentation/models/doctors_models.dart';
import 'package:index_login/features/home/presentation/widgets/doctors_info_card.dart';

class BuildDoctorCard extends StatefulWidget {
  const BuildDoctorCard({super.key, required this.doctor, required this.index});

  final Doctor doctor;
  final int index;
  @override
  State<BuildDoctorCard> createState() => _BuildDoctorCardState();
}

class _BuildDoctorCardState extends State<BuildDoctorCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
    margin: const EdgeInsets.only(bottom: 16),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.08),
          blurRadius: 10,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.shade200,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset(
                      widget.doctor.image,
                      fit: BoxFit.cover,
                      width: 60,
                      height: 60,
                    ),
                  ),
                ),

                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        widget.doctor.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.doctor.specialty,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFFFF6B35),
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // التقييم
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ...List.generate(5, (starIndex) {
                            return Icon(
                              starIndex < widget.doctor.rating.floor()
                                  ? Icons.star
                                  : Icons.star_border,
                              color: Colors.amber,
                              size: 22,
                            );
                          }),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 8),
              ],
            ),

            const SizedBox(height: 16),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    buildInfoItem(
                      'assets/images/ticket-discount_blue.png',
                      widget.doctor.reviewsCount,
                      const Color(0xFF4F5BD3),
                       
                    ),

                    const SizedBox(width: 8),

                    buildInfoItem(
                      'assets/images/coin.png',
                      widget.doctor.availableTime,
                      const Color(0xFF9C27B0),
                       
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                Row(
                  children: [
                    buildInfoItem(
                      'assets/images/ticket-discount_light.png',
                      widget.doctor.sessionPrice,
                      const Color(0xFFF26522),
                     
                    ),
                    const SizedBox(width: 8),
                    buildInfoItem(
                      'assets/images/ticket-discount.png',
                      widget.doctor.discount,
                      Colors.blue,
                       
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                Row(
                  children: [
                    buildInfoItem(
                      'assets/images/location.png',
                      widget.doctor.location,
                      Colors.black,
                       
                    ),
                    const SizedBox(width: 8),

                    buildInfoItem(
                      'assets/images/routing.png',
                      '15 ك',
                      Colors.black,
                     
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),

        Positioned(
          left: 0,
          top: 10,
          child: GestureDetector(
            onTap: () {
              setState(() {
                widget.doctor.isFavorite = !widget.doctor.isFavorite;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFEF3F23).withOpacity(0.1),
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: Icon(
                widget.doctor.isFavorite ? Icons.favorite : Icons.favorite_border,

                color: Colors.red,
                size: 22,
              ),
            ),
          ),
        ),
      ],
    ),
  );
  }
}

