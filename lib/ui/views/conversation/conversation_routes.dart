import 'package:stacked/stacked_annotations.dart';

import 'views/conversation_detail/conversation_detail_view.dart';

const routes = [
  MaterialRoute(
    page: ConversationDetailView,
    path: '/conversations/:conversationId',
  ),
];
