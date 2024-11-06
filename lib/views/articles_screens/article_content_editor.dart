import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:thetech_getx/components/my_components.dart';
import 'package:thetech_getx/controller/article/manage_article_controller.dart';

class ArticleContentEditor extends StatelessWidget {
  ArticleContentEditor({super.key});
  final HtmlEditorController controller = HtmlEditorController();
  var manageArticleController = Get.put(ManageArticleController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!kIsWeb) {
          controller.clearFocus();
        }
      },
      child: Scaffold(
        appBar: appBar('نوشتن/ویرایش مقاله'),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HtmlEditor(
                controller: controller,
                htmlEditorOptions: HtmlEditorOptions(
                  hint: 'میتونی مقاله تو اینجا بنویسی...',
                  shouldEnsureVisible: true,
                  initialText:
                      manageArticleController.articleInfoModel.value.content!,
                ),
                callbacks: Callbacks(
                  onChangeContent: (p0) {
                    manageArticleController.articleInfoModel.update(
                      (val) {
                        val?.content = p0;
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
