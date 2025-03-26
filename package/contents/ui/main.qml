import QtQuick
import QtQuick.Layouts
import org.kde.plasma.plasmoid
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.components as PlasmaComponents
import org.kde.kirigami as Kirigami

//import { Octokit, App } from "https://esm.sh/octokit";
//import "octokit.ts" as Octokit



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

    function printIt(xhrObject) {
        console.log(xhrObject.responseText);
    }



    function doRequest(method, url, callback) {

        // GraphQL query
        const myQuery = { "query": "{user(login: \"AndrewLoughran\") { contributionsCollection { contributionCalendar { colors totalContributions weeks {contributionDays {contributionCount date}}}}}}"};


        var xhr = new XMLHttpRequest();
        xhr.responseType = 'json';
        //xhr.onreadystatechange = (function (myxhr) {
        //    return function () {
        //        if (xhr.readyState === XMLHttpRequest.DONE)
        //            callback(myxhr);
        //    };
        //})(xhr);

        //xhr.addEventListener("load", reqListener)
        xhr.open(method, url, true);
        xhr.setRequestHeader("Content-Type", "application/json");
        xhr.setRequestHeader("Authorization", "bearer "); // personal bearer token removed to avoid Git uploading it, will abstract away later
        xhr.onload = function () {
            console.log('data returned:', JSON.stringify(xhr.response));
        }
        xhr.send(JSON.stringify(myQuery));
    }




    Component.onCompleted: doRequest("POST", "https://api.github.com/graphql", printIt)
    //Component.onCompleted: console.log(JSON.stringify())
    //Component.onCompleted: console.log(JSON.stringify({ x: 5, y: 6 }));
}


























