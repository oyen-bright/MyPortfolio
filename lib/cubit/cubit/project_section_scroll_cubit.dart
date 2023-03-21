import 'package:bloc/bloc.dart';

part 'project_section_scroll_state.dart';

class ProjectSectionScrollCubit extends Cubit<ProjectSectionScrollState> {
  ProjectSectionScrollCubit() : super(const ProjectSectionScrollState());

  changeMainScreenSroll(bool canScroll) {
    if (canScroll != state.mainCanScrokk) {
      if (canScroll) {
        emit(const ProjectSectionScrollState());
      }
      emit(ProjectSectionScrollState(
          mainCanScrokk: canScroll, projectSectionCanScroll: true));
    }
  }
}
