import QtQuick
import QtQuick.Layouts
import org.kde.plasma.plasmoid
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.components as PlasmaComponents
import org.kde.kirigami as Kirigami

PlasmoidItem {
    // https://doc.qt.io/qt-6/qml-codingconventions.html
    id: root
    width:400
    height:200
    //Plasmoid.backgroundHints: PlasmaCore.Types.NoBackground
    // This element displays a rectangle with a gradient and a border
    Rectangle {
        x: 160
        y: 20
        width: 100
        height: 100
        radius: 8 // This gives rounded corners to the Rectangle
        gradient: Gradient { // This sets a vertical gradient fill
            GradientStop { position: 0.0; color: "aqua" }
            GradientStop { position: 1.0; color: "teal" }
        }
        border { width: 3; color: "white" } // This sets a 3px wide black border to be drawn
    }

    GridLayout {
        id: grid
        columns: 3

        Text { text: "Three"; font.bold: true; }
        Text { text: "words"; color: "red" }
        Text { text: "in"; font.underline: true }
        Text { text: "a"; font.pixelSize: 20 }
        Text { text: "row"; font.strikeout: true }
    }

}
