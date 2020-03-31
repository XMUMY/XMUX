import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:xmux/components/floating_card.dart';
import 'package:xmux/components/refreshable.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/moodle/models/assignment.dart';

class AssignmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Refreshable<List<Course>>(
      onRefresh: () async => moodleApi.assignments,
      builder: (context, data) {
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) => AnimationConfiguration.staggeredList(
            position: index,
            child: SlideAnimation(
              verticalOffset: 50,
              child: FadeInAnimation(
                child: AssignmentCard(data[index]),
              ),
            ),
          ),
        );
      },
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
