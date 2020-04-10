import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:xmux/components/empty_error_button.dart';
import 'package:xmux/components/empty_error_page.dart';
import 'package:xmux/components/floating_card.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/moodle/models/assignment.dart';
import 'package:xmux/redux/actions/actions.dart';

class AssignmentPage extends StatelessWidget {
  final List<Course> assignments;

  AssignmentPage(this.assignments);

  Future<void> _handleUpdate() async {
    var action = UpdateAssignmentsAction();
    store.dispatch(action);
    await action.future;
  }

  @override
  Widget build(BuildContext context) {
    if (assignments == null) return EmptyErrorButton(onRefresh: _handleUpdate);
    if (assignments.isEmpty) return EmptyErrorPage();

    return RefreshIndicator(
      onRefresh: _handleUpdate,
      child: ListView.builder(
        itemCount: assignments.length,
        itemBuilder: (context, index) => AnimationConfiguration.staggeredList(
          position: index,
          child: SlideAnimation(
            verticalOffset: 50,
            child: FadeInAnimation(
              child: AssignmentCard(assignments[index]),
            ),
          ),
        ),
      ),
    );
  }
}

class AssignmentCard extends StatelessWidget {
  final Course course;

  AssignmentCard(this.course);

  @override
  Widget build(BuildContext context) {
    return FloatingCard(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Text(
            course.fullName,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            course.shortName,
            style: Theme.of(context).textTheme.caption,
          ),
          Divider(),
          for (var a in course.assignments) Text(a.name),
        ],
      ),
    );
  }
}
