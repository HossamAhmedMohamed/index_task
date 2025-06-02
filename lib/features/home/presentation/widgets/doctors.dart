// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:index_login/features/home/presentation/models/doctors_models.dart';
import 'package:index_login/features/home/presentation/widgets/doctor_card.dart';
import 'package:index_login/features/home/presentation/widgets/search_bar.dart';

class DoctorsSearchPage extends StatefulWidget {
  const DoctorsSearchPage({super.key});

  @override
  State<DoctorsSearchPage> createState() => _DoctorsSearchPageState();
}

class _DoctorsSearchPageState extends State<DoctorsSearchPage> {
  final TextEditingController searchController = TextEditingController();
  List<Doctor> allDoctors = [];
  List<Doctor> filteredDoctors = [];

  @override
  void initState() {
    super.initState();
    _initializeDoctors();
    searchController.addListener(_filterDoctors);
  }

  void _initializeDoctors() {
    allDoctors = [
      Doctor(
        name: "د. سارة محمد",
        specialty: "اختصاصي طب الفم والأسنان",
        image: "assets/images/sara.png",
        rating: 4.8,
        reviewsCount: 'خصم 20% طول السنة',
        availableTime: "15 نقطة متاحة",
        sessionPrice: "كشف مجاني",
        discount: "خصم %40 على تبييض الأسنان",
        location: "مدينة أسيوط - من الجمهورية",
      ),
      Doctor(
        name: "د. محمد طارق",
        specialty: "اختصاصي طب الفم والأسنان",
        image: "assets/images/mohamed.png",
        rating: 4.9,
        reviewsCount: 'خصم 20% طول السنة',
        availableTime: "15 نقطة متاحة",
        sessionPrice: "كشف مجاني",
        discount: "خصم %40 على تبييض الأسنان",
        location: "مدينة أسيوط - من الجمهورية",
      ),
      Doctor(
        name: "د. فاطمة أحمد",
        specialty: "اختصاصي طب الأطفال",
        image: "assets/images/sara.png",
        rating: 4.7,
        reviewsCount: 'خصم 20% طول السنة',
        availableTime: "30 نقطة متاحة",
        sessionPrice: "الكشف 150 جنيه",
        discount: "خصم %25 على الاستشارة",
        location: "مدينة القاهرة - مصر الجديدة",
      ),
      Doctor(
        name: "د. أحمد حسن",
        specialty: "اختصاصي القلب والأوعية الدموية",
        image: "assets/images/mohamed.png",
        rating: 4.9,
        reviewsCount: 'خصم 20% طول السنة',
        availableTime: "45 نقطة متاحة",
        sessionPrice: "الكشف 200 جنيه",
        discount: "خصم %30 على الفحص الشامل",
        location: "مدينة الإسكندرية - سموحة",
      ),
      Doctor(
        name: "د. منى خالد",
        specialty: "اختصاصي الجلدية والتناسلية",
        image: "assets/images/sara.png",
        rating: 4.6,
        reviewsCount: 'خصم 20% طول السنة',
        availableTime: "20 نقطة متاحة",
        sessionPrice: "الكشف 120 جنيه",
        discount: "خصم %20 على العلاج",
        location: "مدينة المنصورة - وسط البلد",
      ),
    ];

    filteredDoctors = List.from(allDoctors);
  }

  void _filterDoctors() {
    String query = searchController.text.toLowerCase().trim();

    setState(() {
      if (query.isEmpty) {
        filteredDoctors = List.from(allDoctors);
      } else {
        filteredDoctors =
            allDoctors.where((doctor) {
              return doctor.name.toLowerCase().contains(query) ||
                  doctor.specialty.toLowerCase().contains(query) ||
                  doctor.location.toLowerCase().contains(query);
            }).toList();
      }
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildSearchBar(
          searchController,
          context,
        ),
        Expanded(
          child:
                ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: filteredDoctors.length,
                    itemBuilder: (context, index) {
                      return BuildDoctorCard(doctor: filteredDoctors[index], index: index, );
                    },
                  ),
        ),
      ],
    );
  }
}
