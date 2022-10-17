import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note/api/models/task.dart';
import 'package:note/controllers/notes_provider.dart';
import 'package:note/services/locator.dart';
import 'package:note/services/navigation_service.dart';
import 'package:note/ui/shared/widgets/card.dart';
import 'package:note/utils/resources/styles_manager.dart';
import 'package:note/utils/resources/values_manager.dart';
import 'package:provider/provider.dart';

class SearchScreen extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '',
        icon: Icon(Icons.close),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => locator<NavigationService>().pop(),
      icon: Icon(Icons.arrow_back_ios_new_rounded),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Task> notes = context.watch<NotesProvider>().tasks;
    notes = notes.where((element) => element.title!.contains(query)).toList();
    return notes.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/searchNF.png'),
                Text(
                  'File not found. Try searching again.',
                  style: getSemiBoldStyle(),
                ),
              ],
            ),
          )
        : ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppPadding.p25.w, vertical: AppPadding.p16.h),
              child: NoteCard(task: notes[index]),
            ),
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Task> notes = context.watch<NotesProvider>().tasks;
    notes = notes.where((element) => element.title!.contains(query)).toList();
    return query.isEmpty
        ? Text('')
        : ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppPadding.p25.w, vertical: AppPadding.p16.h),
              child: GestureDetector(
                  onTap: () => query = notes[index].title!,
                  child: Text('${notes[index].title}')),
            ),
          );
  }
}
