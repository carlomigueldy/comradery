import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/ui/widgets/dumb_widgets/app_bar/app_top_bar.dart';
import 'package:comradery/ui/widgets/dumb_widgets/dumb_widgets.dart';
import 'package:comradery/ui/widgets/dumb_widgets/spinner/app_spinner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import 'conversation_detail_viewmodel.dart';

class ConversationDetailView extends StatefulWidget {
  const ConversationDetailView({
    Key? key,
    @PathParam(
      'conversationId',
    )
        required this.conversationId,
  }) : super(key: key);

  final String conversationId;

  @override
  _ConversationDetailViewState createState() => _ConversationDetailViewState();
}

class _ConversationDetailViewState extends State<ConversationDetailView>
    with UiUtilMixin {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return ViewModelBuilder<ConversationDetailViewModel>.reactive(
      onModelReady: (model) => model.init(),
      viewModelBuilder: () => ConversationDetailViewModel(
        conversationId: widget.conversationId,
      ),
      builder: (
        BuildContext context,
        ConversationDetailViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppTopBar(
            title: model.fetchMessagesBusy ||
                    model.fetchConversationBusy ||
                    model.fetchParticipantsBusy
                ? 'Loading...'
                : model.conversation?.name ??
                    (model.conversation?.participantNames
                            .replaceAll(',', '')
                            .replaceAll(model.authUserFullName, '') ??
                        '...'),
            backgroundColor: uiUtil.colors.backgroundColor,
            action: PopupMenuButton(
              padding: uiUtil.edgeInsets.horizontalSymmetric25,
              shape: RoundedRectangleBorder(
                borderRadius: uiUtil.borderRadius.large,
              ),
              child: Padding(
                padding: uiUtil.edgeInsets.horizontalSymmetric25,
                child: Icon(
                  Icons.more_horiz_rounded,
                  color: uiUtil.colors.black,
                ),
              ),
              onSelected: (value) async {
                switch (value) {
                  case 'invite_to_team':
                    return model.inviteToTeam();

                  case 'request_to_join_team':
                    return model.requestToJoinTeam();

                  default:
                    return;
                }
              },
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    value: 'invite_to_team',
                    child: Text('Invite to Team'),
                  ),
                  PopupMenuItem(
                    value: 'request_to_join_team',
                    child: Text('Request to Join Team'),
                  ),
                ];
              },
            ),
          ),
          body: Container(
            height: mediaQuery.size.height,
            color: uiUtil.colors.backgroundColor,
            child: Stack(
              children: [
                !model.fetchMessagesBusy
                    ?
                    // Chat Layout
                    _ChatLayout(model: model)
                    : AppSpinner(),
                Positioned(
                  bottom: 25,
                  left: 25,
                  right: 25,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: uiUtil.borderRadius.large,
                      boxShadow: [
                        uiUtil.boxShadows.normal,
                      ],
                    ),
                    child: _TextField(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ChatLayout extends StatelessWidget with UiUtilMixin {
  const _ChatLayout({
    Key? key,
    required this.model,
  }) : super(key: key);

  final ConversationDetailViewModel model;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: uiUtil.edgeInsets.horizontalSymmetric25,
      reverse: true,
      child: Column(
        children: [
          uiUtil.verticalSpacing.large,
          uiUtil.verticalSpacing.veryLarge,
          ListView.separated(
            shrinkWrap: true,
            itemCount: model.messages.length,
            physics: NeverScrollableScrollPhysics(),
            // reverse: true,
            itemBuilder: (context, index) {
              final message = model.messages[index];
              final isMe = message.createdBy == model.authUserId;

              return Row(
                mainAxisAlignment:
                    isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                children: [
                  Container(
                    padding: uiUtil.edgeInsets.all10,
                    decoration: BoxDecoration(
                      color: isMe
                          ? theme.primaryColor.withOpacity(0.1)
                          : uiUtil.colors.veryLightGrey,
                      borderRadius: uiUtil.borderRadius.large,
                    ),
                    child: Text(message.content),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) {
              return uiUtil.verticalSpacing.normal;
            },
          ),
          uiUtil.verticalSpacing.veryLarge,
          uiUtil.verticalSpacing.veryLarge,
        ],
      ),
    );
  }
}

class _TextField extends HookViewModelWidget<ConversationDetailViewModel> {
  const _TextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    ConversationDetailViewModel model,
  ) {
    final messageController = useTextEditingController();

    void sendMessage() {
      model.sendMessage().then((value) {
        messageController.clear();
      });
    }

    return AppTextField(
      name: 'message',
      label: 'Message',
      controller: messageController,
      onChanged: model.onInputMessageChange,
      onEditingComplete: () => sendMessage(),
      suffixIcon: model.sendMessageBusy
          ? AppSpinner()
          : IconButton(
              icon: Icon(Icons.send_rounded),
              onPressed: () => sendMessage(),
            ),
    );
  }
}
