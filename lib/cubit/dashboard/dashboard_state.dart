import 'package:elisoft_flutter_test/models/dashboard/article.dart';
import 'package:equatable/equatable.dart';

class DashboardState extends Equatable {
  final List<ArticleElement> article;

  const DashboardState({required this.article});

  @override
  List<Object> get props => [article];
}


