import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
// 去掉版本号，Qt 6 默认加载最新版

Page {
    id: loginPage
    title: "登录"

    background: Rectangle {
        color: "#f0f0f0"
    }
    ColumnLayout {
        anchors.centerIn: parent
        spacing: 20
        width: parent.width * 0.8
        Image{
            source:"logintest.jpg"
            Layout.preferredWidth: 120//保持比例
            Layout.preferredHeight: 120
            fillMode: Image.PreserveAspectFit
            Layout.alignment: Qt.AlignHCenter
        }
        Text {
            text: "欢迎登录"
            font.pixelSize: 24
            font.bold: true
            Layout.alignment: Qt.AlignHCenter
        }

        TextField {
            id: usernameField
            placeholderText: "请输入账号"
            Layout.fillWidth: true
        }

        TextField {
            id: passwordField
            placeholderText: "请输入密码"
            echoMode: TextInput.Password // 隐藏密码文字
            Layout.fillWidth: true
        }

        Button {
                    text: "登录"
                    Layout.fillWidth: true
                    highlighted: true

                    onClicked: {
                        // 1. 去除前后空格
                        let uname = usernameField.text.trim()
                        if(uname === "") {
                            console.log("请输入用户名")
                            return
                        }

                        // 2. 赋值当前用户
                        chatClient.currentUser = uname

                        // 3. 核心跳转：使用 StackView 的附加属性，并使用绝对的 qrc 路径
                        if (loginPage.StackView.view) {
                            // 使用 qrc:/ 绝对路径最稳妥，且确保大小写与实际文件名完全一致！
                            loginPage.StackView.view.push("qrc:/chat.qml")
                        } else {
                            console.error("无法找到 StackView 容器！")
                        }
                    }
                }
    }
}
