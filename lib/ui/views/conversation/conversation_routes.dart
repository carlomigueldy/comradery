import 'package:stacked/stacked_annotations.dart';

import 'views/conversation_detail/conversation_detail_view.dart';

const routes = [
  CustomRoute(
    page: ConversationDetailView,
    path: '/conversations/:conversationId',
  ),
];
