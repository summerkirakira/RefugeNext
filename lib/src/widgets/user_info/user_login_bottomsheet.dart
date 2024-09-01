import 'package:provider/provider.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:flutter/material.dart';
import '../../funcs/login.dart';
import 'dart:typed_data';
import '../../funcs/toast.dart';
import '../../datasource/data_model.dart';
import '../../repo/user.dart';

String cachedEmail = '';
String cachedPassword = '';
Uint8List? cachedCaptcha;

WoltModalSheetPage getLoginBottomSheet(
    BuildContext context, BuildContext itemContext) {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  return WoltModalSheetPage(
    navBarHeight: 50,
    pageTitle: const Padding(
        padding: EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('登录',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            Text('请输入你的RSI账号与密码\n这些信息将会被加密保存在本地',
                style: TextStyle(fontSize: 15, color: Colors.grey)),
          ],
        )),
    trailingNavBarWidget: Container(
      height: 38,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2), // 设置背景颜色
        shape: BoxShape.circle, // 设置形状为圆形
      ),
      child: IconButton(
        padding: const EdgeInsets.all(5),
        icon: const Icon(Icons.close, size: 22),
        onPressed: Navigator.of(context).pop,
      ),
    ),
    child: Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: '邮箱',
            ),
          ),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: '密码',
            ),
          ),
          const SizedBox(height: 100),
        ],
      ),
    ),
    stickyActionBar: Container(
      height: 80,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
      child: SizedBox(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            if (emailController.text.isEmpty) {
              return;
            }
            if (passwordController.text.isEmpty) {
              return;
            }

            loginFirstStep(
                    email: emailController.text,
                    password: passwordController.text)
                .then((status) {
              cachedEmail = emailController.text;
              cachedPassword = passwordController.text;
              if (status.success) {
                UserRepo().getCurrentUser().then((user) {
                  if (user != null) {
                    Provider.of<MainDataModel>(itemContext, listen: false)
                        .updateCurrentUser(user);
                  }
                  Navigator.of(context).pop();
                });
              } else {
                if (status.needCode) {
                  WoltModalSheet.of(context)
                      .addPage(getEmailInputBottomSheet(context, itemContext));
                  WoltModalSheet.of(context).showNext();
                } else if (status.needCaptcha) {
                  getCaptchaImage().then((captcha) {
                    cachedCaptcha = captcha;
                    WoltModalSheet.of(context).addPage(
                        getCaptchaInputBottomSheet(context, itemContext));
                    WoltModalSheet.of(context).showNext();
                  });
                }
              }
            });

            // WoltModalSheet.of(context).showNext();
          },
          child: const Text('下一步',
              style: TextStyle(
                fontSize: 16,
              )),
        ),
      ),
    ),
  );
}

WoltModalSheetPage getCaptchaInputBottomSheet(
    BuildContext context, BuildContext itemContext) {
  final captchaController = TextEditingController();

  return WoltModalSheetPage(
    navBarHeight: 50,
    pageTitle: const Padding(
        padding: EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('输入验证码',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            Text('请输入图片中的验证码',
                style: TextStyle(fontSize: 15, color: Colors.grey)),
          ],
        )),
    trailingNavBarWidget: Container(
      height: 38,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2), // 设置背景颜色
        shape: BoxShape.circle, // 设置形状为圆形
      ),
      child: IconButton(
        padding: const EdgeInsets.all(5),
        icon: const Icon(Icons.close, size: 22),
        onPressed: Navigator.of(context).pop,
      ),
    ),
    child: Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            alignment: Alignment.center,
            child: Image.memory(cachedCaptcha ?? Uint8List(0)),
          ),
          TextField(
            controller: captchaController,
            decoration: InputDecoration(
              hintText: '验证码',
            ),
          ),
          const SizedBox(height: 100),
        ],
      ),
    ),
    stickyActionBar: Container(
      height: 80,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
      child: SizedBox(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            if (captchaController.text.isEmpty) {
              return;
            }

            try {
              loginFirstStep(
                      email: cachedEmail,
                      password: cachedPassword,
                      captcha: captchaController.text)
                  .then((status) {
                if (status.success) {
                  final userRepo = UserRepo();

                  userRepo.getCurrentUser().then((user) {
                    if (user != null) {
                      Provider.of<MainDataModel>(itemContext, listen: false)
                          .updateCurrentUser(user);
                    }
                    Navigator.of(context).pop();
                  });
                } else {
                  if (status.needCode) {
                    WoltModalSheet.of(context).addPage(
                        getEmailInputBottomSheet(context, itemContext));
                    WoltModalSheet.of(context).showNext();
                  }
                }
              });
            } catch (e) {
              showToast(message: e.toString());
            }
            ;
          },
          child: const Text('下一步',
              style: TextStyle(
                fontSize: 16,
              )),
        ),
      ),
    ),
  );
}

WoltModalSheetPage getEmailInputBottomSheet(
    BuildContext context, BuildContext itemContext) {
  final codeController = TextEditingController();

  return WoltModalSheetPage(
    navBarHeight: 50,
    pageTitle: const Padding(
        padding: EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('输入验证码',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            Text('请输入RSI邮箱绑定的验证码',
                style: TextStyle(fontSize: 15, color: Colors.grey)),
          ],
        )),
    trailingNavBarWidget: Container(
      height: 38,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2), // 设置背景颜色
        shape: BoxShape.circle, // 设置形状为圆形
      ),
      child: IconButton(
        padding: const EdgeInsets.all(5),
        icon: const Icon(Icons.close, size: 22),
        onPressed: Navigator.of(context).pop,
      ),
    ),
    child: Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: codeController,
            decoration: InputDecoration(
              hintText: '验证码',
            ),
          ),
          const SizedBox(height: 100),
        ],
      ),
    ),
    stickyActionBar: Container(
      height: 80,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
      child: SizedBox(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            if (codeController.text.isEmpty) {
              return;
            }

            loginSecondStep(cachedEmail, cachedPassword, codeController.text)
                .then((status) {
              if (status.success) {
                UserRepo().getCurrentUser().then((user) {
                  if (user != null) {
                    Provider.of<MainDataModel>(itemContext, listen: false)
                        .updateCurrentUser(user);
                  }
                  Navigator.of(context).pop();
                });
              } else {
                showToast(message: status.msg);
                Navigator.of(context).pop();
              }
            });
          },
          child: const Text('下一步',
              style: TextStyle(
                fontSize: 16,
              )),
        ),
      ),
    ),
  );
}
