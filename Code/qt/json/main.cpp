#include <iostream>
#include <QtCore/QJsonObject>
#include <QtCore/QJsonDocument>
#include <QtCore/QJsonArray>

#define TEST_THIS(cmd) std::cout << #cmd << ":" << (cmd) << std::endl;


void Decode() {
  QByteArray msgRaw = "[2,\"090c417b-1943-4c22-b1d5-172a15119eb5\",\"BootNotification\",{\"chargeBoxSerialNumber\":\"123456\",\"chargePointModel\":\"AdvancedWB\",\"chargePointSerialNumber\":\"\",\"chargePointVendor\":\"Schneider\",\"firmwareVersion\":\"\",\"iccid\":\"\",\"imsi\":\"\",\"meterSerialNumber\":\"\",\"meterType\":\"\"}]";

  // read and write for the fun
  QJsonDocument msgJson(QJsonDocument::fromJson(msgRaw));
  QJsonArray msgArray = msgJson.array();

  TEST_THIS(msgJson.toJson().constData());

  TEST_THIS(msgJson.isArray());
  TEST_THIS(msgJson.array().size());
  TEST_THIS(msgArray.size());
  TEST_THIS(msgJson.isObject());

  TEST_THIS(msgArray[0].isDouble());
  TEST_THIS(msgArray[0].toDouble());
  TEST_THIS(msgArray[1].isString());
  TEST_THIS(msgArray[1].toString().toStdString());
  TEST_THIS(msgArray[2].toString().toStdString());
  TEST_THIS(msgArray[3].isObject());

  QJsonObject msgBody = msgArray[3].toObject();
  
//TEST_THIS(msgBody.find("chargeBoxSerialNumberXXX") == QJsonObject::const_iterator::end());
  TEST_THIS(*msgBody.find("chargeBoxSerialNumberXXX") == QJsonValue::Null);
  TEST_THIS(msgBody["chargeBoxSerialNumberXXX"] == QJsonValue::Null);
  TEST_THIS(msgBody["chargeBoxSerialNumberXXX"].toString().toStdString());
  TEST_THIS(msgBody["chargeBoxSerialNumberXXX"].toString().size());
  TEST_THIS(msgBody["chargeBoxSerialNumber"].toString().size());
  TEST_THIS(msgBody["chargeBoxSerialNumber"].toString().toStdString());
}

void Encode_(QJsonObject &obj, const std::string& p_key, const std::string& p_value) {
  obj[QString::fromStdString(p_key)] = QString::fromStdString(p_value);
}

void Encode_(QJsonObject &obj, const std::string& p_key, const int& p_value) {
  obj[QString::fromStdString(p_key)] = p_value;
}

void Encode() {
  QJsonObject msgBody;
  QJsonDocument doc;
  msgBody["chargeBoxSerialNumber"] = QString("123456");
  Encode_(msgBody, "chargePointModel", "AdvancedWB");
  Encode_(msgBody, "thisIsANum", 123);

  doc.setObject(msgBody);

  TEST_THIS(doc.toJson().constData());
}

int main(int argc, char *argv[]) {
  Decode();
  Encode();
  return 0;
}
