# flutter_app

A new Flutter chat application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Ŀ¼�ṹ˵��

- Flutter SDK
    - /model��ʵ����
    - /proto��protobuf3Э���ļ�
    - im_client.dart����¼���ͷ�����ͨ�ţ�����ҵ��ģ�����send���������յ������ص���
    - im_message.dart��������Ϣ����ȡ��ʷ��Ϣ
    - im_session.dart����ȡ�Ự�б�
- gui
    - /model��ʵ����
    - /widget���������
    - page_chat.dart����Ϣtab
    - page_home.dart����ҳ
    - page_me.dart����
    - page_message.dart���������

## ʵ�ֵĹ���

- [x] ����ҳ
- [x] ��¼
    - [x] ��ס����
    - [x] �Զ�������������BUG��
    - [ ] �Զ���¼
    - [ ] ��������״̬��ʾ
- [x] �Ự�б�
    - [x] ������Ϣ
    - [x] Բ��ͷ��
    - [x] δ������С���
- [x] ����
    - [x] �շ��ı�
    - [x] ʧ���ط�
    - [x] ������ѯ������ʷ��Ϣ
- [ ] SDK
    - [x] SQFilte����Ự�б�

- [x] ����ȫ��
- [ ] ����
- [x] �������-�Է���ɫ������ʾ
- [ ] �ǳ�
- [ ] ͷ��
- [ ] ��ϵ�˹���
- [ ] �Զ���¼
- [ ] �Ự�Զ�ˢ�£���һ�Ρ��»Ự��
- [x] ���δ������
- [x] tab���õ��
- [x] ��Ϣʱ��
- [x] emotion�洢����������
- [ ] ��Ϣ��������ʾδ������

## Ԥ��
����� demo �ļ����µ�ͼƬ

## ����

������106.14.172.35  
im_gate:8000/tcp����¼����Ϣ�����  
im_http:18080/http���û�ע��  

�����˺ţ�1007��1008  
���룺12345  

## ��������

### Building for iOS Simulator, but the linked and embedded framework 'App.framework' was built for iOS. (in target 'Runner' from project 'Runner')
1. ɾ��ios/flutter/app.framework
2. ���±���

### iosͼ���滻
1. mac�������ذ�װicon maker(����:https://pan.baidu.com/s/1j2WZSJ83RYu6hLnK4ICSYw  ����:1t9p)
2. �򿪺�ѡ��һ��pngͼ�꣬Ȼ��ѡRounded Corner�����IOS��
3. �����ɵ�Ŀ¼IOS/Assets.xcassets/AppIcon.appiconset�����滻��ios/Runner/Assets.xcassets/AppIcon.appiconset
4. ���±��뼴��

### pb����

1. ����protobuf���µĿ��ð汾��[https://github.com/dart-lang/protobuf](https://github.com/dart-lang/protobuf)
2. ��pubspec.yaml������protobuf����İ汾Ϊ���µļ��ɡ�

## ��ϵ��
email��xmcy0011@sina.com