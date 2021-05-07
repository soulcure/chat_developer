import 'dart:typed_data';

import 'package:buffer/buffer.dart';
import 'package:protobuf/protobuf.dart';

/// 序列号生成器 自增生成
class SeqGen {
  static final SeqGen singleton = SeqGen._internal();
  int _seqNumber;

  factory SeqGen() {
    return singleton;
  }

  SeqGen._internal() {
    _seqNumber = 0;
  }

  gen() {
    return ++_seqNumber;
  }
}

/// 协议头长度
const kHeaderLen = 16;
const kDefaultProtocolVersion = 1;

/// 16Byte协议头
class IMHeader {
  int length = 0; // 4 byte，消息体长度
  int version = 0; // 2 byte,default 1
  int flag = 0; // 2byte，保留
  int serviceId = 0; // 2byte，保留
  int commandId = 0; // 2byte，命令号
  int seqNumber = 0; // 2byte，包序号
  int reversed = 0; // 2byte，保留

  GeneratedMessage message;

  IMHeader();

  void setCommandId(int cmdId) {
    this.commandId = cmdId;
  }

  void setMsg(GeneratedMessage msg) {
    this.message = msg;
  }

  /// 设置消息序号，请使用 [SeqGen.singleton.gen()] 生成
  void setSeq(int seqNumber) {
    this.seqNumber = seqNumber;
  }

  static bool isAvailable(List<int> data) {
    if (data.length < kHeaderLen) {
      return false;
    }

    // get total len
    int length = data[0];
    for (int i = 1; i < 4; i++) {
      length = (length << 8) + data[i];
    }

    return length <= data.length;
  }

  /// 从二进制数据中尝试反序列化Header
  /// [data] 二进制数据
  /// [IMHeader] 实例
  bool readHeader(ByteDataReader reader) {
    this.length = reader.readInt32();
    this.version = reader.readInt16();
    this.flag = reader.readInt16();
    this.serviceId = reader.readInt16();
    this.commandId = reader.readInt16();
    this.seqNumber = reader.readInt16();
    this.reversed = reader.readInt16();
    return true;
  }

  Uint8List getBuffer() {
    Uint8List bodyData = message.writeToBuffer();

    //this.seqNumber = SeqGen.singleton.gen();
    this.length = kHeaderLen + bodyData.length;
    this.version = kDefaultProtocolVersion;

    ByteDataWriter contentWrite = ByteDataWriter();
    contentWrite.writeInt32(length); // 总长度
    contentWrite.writeInt16(version); // 协议版本号
    contentWrite.writeInt16(flag); // 标志位
    contentWrite.writeInt16(serviceId);
    contentWrite.writeInt16(commandId); // 命令号
    contentWrite.writeInt16(seqNumber); // 消息序号
    contentWrite.writeInt16(reversed);
    contentWrite.write(bodyData);

    return contentWrite.toBytes();
  }
}
