import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_icon/gradient_icon.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<Map<String, dynamic>> categories = [
    {'name': 'cardiologist', 'image': 'assets/cardiologist.jpeg'},
    {'name': 'audiologist', 'image': 'assets/audiologist.jpeg'},
    {'name': 'dentist', 'image': 'assets/dentist.jpeg'},
    {'name': 'psychiatrist', 'image': 'assets/psychiatrist.jpg'},
    {'name': 'gynecologist', 'image': 'assets/gynecologist.jpeg'},
  ];

  Future<void> fetchData() async {
    // Simulate fetching data (replace this with your actual data fetching logic)
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Find Your \nDesired Category",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 31.sp,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'BentonSans Bold',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 27.w),
                  child: FloatingActionButton(
                    onPressed: () {},
                    elevation: 0.3,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
                    backgroundColor: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 15.h),
                      child: GradientIcon(
                        icon: Icons.notifications_none,
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromRGBO(83, 232, 139, 1),
                            Color.fromRGBO(21, 190, 119, 1),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        size: 30.dg,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.w, top: 18.h),
            child: Row(
              children: [
                SizedBox(
                  width: 267.w,
                  height: 50.h,
                  child: TextField(
                    cursorColor: const Color.fromRGBO(249, 168, 77, 0.1),
                    style: GoogleFonts.roboto(
                      color: const Color.fromRGBO(218, 99, 23, 0.4),
                      fontSize: 12.sp,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.5,
                    ),
                    decoration: InputDecoration(
                      fillColor: const Color.fromRGBO(249, 168, 77, 0.1),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'What do you want to search?',
                      hintStyle: GoogleFonts.roboto(
                        color: const Color.fromRGBO(218, 99, 23, 0.4),
                        fontSize: 12.sp,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.5,
                      ),
                      prefixIcon: Container(
                        padding: EdgeInsets.all(15),
                        child: const Icon(Icons.search, color: const Color.fromRGBO(249, 168, 77, 1)),
                        width: 24.w,
                        height: 24.h,
                      ),
                    ),
                  ),
                ),
                Spacer(), // Added spacer to push the filter button to the right
                FloatingActionButton(
                  onPressed: () {},
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
                  backgroundColor: const Color.fromRGBO(249, 168, 77, 0.1),
                  child: Padding(
                    padding: EdgeInsets.only(),
                    child: Image.asset('assets/filter.png'),
                  ),
                ),
              ],
            ),
          ),
          // List of Categories
          Expanded(
            child: FutureBuilder(
              future: fetchData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color:  Color.fromRGBO(21, 190, 119, 1),
                    ),
                  );
                } else {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
                    child: RefreshIndicator(
                      onRefresh: fetchData,
                      color: const Color.fromRGBO(21, 190, 119, 1),
                      child: ListView.builder(
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 12.h),
                            child: SizedBox(
                              width: 347.w,
                              height: 103.h,
                              child: Card(
                                elevation: 0.3,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.r)),
                                color: Colors.white,
                                child: InkWell(
                                  onTap: () {
                                    // Handle category selection
                                  },
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 20.h, bottom: 20.h, left: 14.w),
                                        child: Container(
                                          width: 62.w,
                                          height: 62.h,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(15.r)),
                                            image: DecorationImage(
                                              image: AssetImage(categories[index]['image']),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.all(12.w),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                categories[index]['name'],
                                                style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontStyle: FontStyle.normal,
                                                  fontFamily: 'BentonSans Medium',
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
