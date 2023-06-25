import 'package:bloc/bloc.dart';
import 'package:elisoft_flutter_test/cubit/dashboard/dashboard_state.dart';
import 'package:elisoft_flutter_test/repositories/dashboard_repository.dart';

class DashboardCubit extends Cubit<DashboardState>{
  DashboardCubit() : super(const DashboardState(article: []));
  
  Future<void> getArticles()async{
    try{
      final article = await DashboardRepository().getArticle();
      emit(DashboardState(article: article));
    }catch(e){
      print('Error: $e');
      emit(state);
    }
  }
}