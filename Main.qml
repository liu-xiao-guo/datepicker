import QtQuick 2.0
import Ubuntu.Components 1.1
import Ubuntu.Components.Pickers 1.0

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "datapicker.liu-xiao-guo"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    //automaticOrientation: true

    // Removes the old toolbar and enables new features of the new header.
    useDeprecatedToolbar: false

    width: units.gu(60)
    height: units.gu(85)

    Page {
        title: i18n.tr("datapicker")

        Flickable {
            anchors.fill: parent
            contentHeight: content.childrenRect.height

            Column {
                id: content
                anchors.centerIn: parent

                spacing: units.gu(1)
                Label {
                    text: "Selected date: W" + datePicker.week + " - " +
                          Qt.formatDate(datePicker.date, "dddd, dd-MMMM-yyyy")
                }
                DatePicker {
                    id: datePicker
                }

                Label {
                    text: "Selected month: " + Qt.formatDate(datePicker1.date, "MMMM-yyyy")
                }
                DatePicker {
                    id: datePicker1
                    mode: "Years|Months"
                }

                Label {
                    text: "Selected time: " + Qt.formatTime(datePicker2.date, "hh:mm:ss")
                }
                DatePicker {
                    id: datePicker2
                    mode: "Hours|Minutes|Seconds"
                }

                Label {
                    text: "Selected date: " + Qt.formatDate(datePicker3.date, "dddd, dd-MMMM-yyyy")
                }
                DatePicker {
                    id: datePicker3
                    minimum: {
                        var d = new Date();
                        d.setFullYear(d.getFullYear() - 1);
                        return d;
                    }
                    maximum: Date.prototype.getInvalidDate.call()
                }
            }
        }
    }
}

