import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mere_maahi_dummy/Firebase/fechalldata.dart';
import 'package:mere_maahi_dummy/Screens/HomeScreen/widgets/home_ads.dart';
import 'package:mere_maahi_dummy/Screens/MatchesScreen/daily.dart';
import 'package:mere_maahi_dummy/application/matches/matches_fetch_bloc.dart';

class HomeScreenGridView extends StatelessWidget {
  const HomeScreenGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatchesFetchBloc, MatchesFetchState>(
      builder: (context, state) {
        if (state is RandomFetchSuccesState) {
          newmachesCount = state.list.users?.length;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 200,
              child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.list.users?.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 1.0,
                    mainAxisSpacing: 1.0,
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Stack(
                        children: [
                          InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (c) => Daily(
                                          appbar: true,
                                          about: state.list.users?[index].bio ??
                                              details[index].about,
                                          email: state.list.users?[index]
                                                  .firstName ??
                                              details[index].email,
                                          image: state.list.users?[index]
                                                  .profilePic ??
                                              details[index].profilePic,
                                          name: details[index].name,
                                        ))),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        state.list.users?[index].profilePic ??
                                            '',
                                        // fit: BoxFit.fill,
                                      ))),
                              // decoration: ,
                              // height: 150,
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 9,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 178, 177, 171),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                '  ${state.list.users?[index].firstName?.toUpperCase()}  ',
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
