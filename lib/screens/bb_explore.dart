import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/bitbucket.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/repository_item.dart';
import 'package:provider/provider.dart';

class BbExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<BbRepo, String>(
      title: AppBarTitle('Explore'),
      onLoadMore: (nextUrl) async {
        final res = await context.read<AuthModel>().fetchBbWithPage(
            nextUrl ?? '/repositories?role=member&sort=-updated_on');
        return ListPayload(
          cursor: res.cursor,
          hasMore: res.hasMore,
          items: <BbRepo>[
            for (var v in res.data) BbRepo.fromJson(v),
          ],
        );
      },
      itemBuilder: (v) {
        return RepositoryItem.bb(payload: v);
      },
    );
  }
}
