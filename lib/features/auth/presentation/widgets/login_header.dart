import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(padding: EdgeInsets.only(top: 100)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset('assets/images/logo.png')],
              ),
    
              const SizedBox(height: 10),
    
              Text(
                'اندكس يوفر، أنت تستمتع',
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Positioned(
            left: 20,
            top: 95,
            child: Image.asset('assets/images/star.png'),
          ),
    
          Positioned(
            right: 20,
            top: 180,
            child: Image.asset('assets/images/star2.png'),
          ),
        ],
      ),
    );
  }
}
