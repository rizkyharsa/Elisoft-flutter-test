import 'package:elisoft_flutter_test/cubit/dashboard/dashboard_cubit.dart';
import 'package:elisoft_flutter_test/cubit/dashboard/dashboard_state.dart';
import 'package:elisoft_flutter_test/utils/pref_util.dart';
import 'package:elisoft_flutter_test/utils/skeleton_shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final SharedPref sharedPref = SharedPref();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => DashboardCubit()..getArticles(),
        child: BlocBuilder<DashboardCubit, DashboardState>(
          builder: (context, state) {
            return state.article.isEmpty
                ? SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SkeletonShimmerWidget(height: 25, width: 150),
                          const SizedBox(height: 20),
                          SizedBox(
                            height: 220,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    SkeletonShimmerWidget(height: 20, width: 80),
                                    SizedBox(height: 8),
                                    SkeletonShimmerWidget(height: 180, width: 210),
                                  ],
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(width: 20);
                              },
                              itemCount: 10,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Expanded(
                            child: ListView.separated(
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 200,
                                  width: 320,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Stack(
                                    children: [
                                      SkeletonShimmerWidget(
                                        height: 200,
                                        width: MediaQuery.of(context).size.width,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 80,
                                                  width: 80,
                                                  decoration: BoxDecoration(
                                                    color: const Color(0xFF989898).withOpacity(.5),
                                                    borderRadius: BorderRadius.circular(6),
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
                                                Container(
                                                  height: 40,
                                                  width: 240,
                                                  decoration: BoxDecoration(
                                                    color: const Color(0xFF989898).withOpacity(.5),
                                                    borderRadius: BorderRadius.circular(6),
                                                  ),
                                                )
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            Container(
                                              height: 60,
                                              width: 330,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFF989898).withOpacity(.5),
                                                borderRadius: BorderRadius.circular(6),
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Align(
                                              alignment: Alignment.bottomRight,
                                              child: Container(
                                                height: 20,
                                                width: 150,
                                                decoration: BoxDecoration(
                                                  color: const Color(0xFF989898).withOpacity(.5),
                                                  borderRadius: BorderRadius.circular(6),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(height: 20);
                              },
                              itemCount: 10,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome, User",
                            style: GoogleFonts.inter(
                              fontSize: 20,
                            ),
                          ),
                          // FutureBuilder<String?>(
                          //   future: sharedPref.getName(),
                          //   builder: (context, snapshot) {
                          //     if (snapshot.hasData) {
                          //       final username = snapshot.data!;
                          //       print(username);
                          //       return RichText(
                          //         text: TextSpan(
                          //           children: [
                          //             TextSpan(
                          //               text: "Welcome, ",
                          //               style: GoogleFonts.inter(
                          //                 fontSize: 20,
                          //               ),
                          //             ),
                          //             TextSpan(
                          //               text: username,
                          //               style: GoogleFonts.inter(
                          //                 fontSize: 20,
                          //                 fontWeight: FontWeight.bold,
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //       );
                          //     } else {
                          //       return Text("");
                          //     }
                          //   },
                          // ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 220,
                            child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final article = state.article[index];
                                return Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: const Color(0xFF247881)),
                                  ),
                                  height: 190,
                                  width: 210,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        article.title ?? '',
                                        style: GoogleFonts.inter(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: const Color(0xFF247881),
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        article.content ?? '',
                                        maxLines: 5,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.inter(fontSize: 16),
                                      )
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(width: 20);
                              },
                              itemCount: state.article.length,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Expanded(
                            child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                final article = state.article[index];
                                var date = article.created!.date.toString();
                                var dateFormat = DateFormat("dd MMM yyyy, HH:mm:ss").format(DateTime.parse(date));
                                return Container(
                                  padding: const EdgeInsets.all(8),
                                  height: 200,
                                  width: 320,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: const Color(0xFF247881).withOpacity(.15),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 80,
                                            width: 80,
                                            decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius: BorderRadius.circular(12),
                                              image: DecorationImage(
                                                  image: NetworkImage(article.image ?? ''), fit: BoxFit.cover),
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Flexible(
                                            child: Text(
                                              article.title ?? '',
                                              style: GoogleFonts.inter(fontSize: 16),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 12, right: 12),
                                        child: Text(
                                          article.content ?? '',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                          style: GoogleFonts.inter(fontSize: 16),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Text(
                                          dateFormat,
                                          style: GoogleFonts.inter(fontSize: 16),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(height: 20);
                              },
                              itemCount: state.article.length,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
