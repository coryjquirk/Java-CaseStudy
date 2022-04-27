console.log("Hello from Tomato Farm's JavaScript")
const plotTable = document.getElementById("plotTable");
const rowCt = plotTable.rows.length;
function availableSpaces() {
    for (let i = 1; i < rowCt; i++) {
        //ridiculous JavaScript way of accessing table cell values
        let spacesTakenCellVal = plotTable.rows[i].cells[4].innerHTML.valueOf();
        let spacesTotalCellVal = plotTable.rows[i].cells[6].innerHTML.valueOf();
        //if available <= total, available cell is red
        plotTable.rows[i].cells[5].innerHTML = spacesTotalCellVal - spacesTakenCellVal;
        if(spacesTotalCellVal - spacesTakenCellVal <= 0){
            plotTable.rows[i].cells[5].style="background-color:#FF8055;"
        }
    }
}
availableSpaces();

function showPasswordLogin() {
    var x = document.getElementById("password");
    if (x.type === "password") {
        x.type = "text";
    } else {
        x.type = "password";
    }
}
function showPasswordRegister() {
    var y = document.getElementById("passwordId");
    var z = document.getElementById("confirmPasswordId");
    if (y.type === "password") {
        y.type = "text";
    } else {
        y.type = "password";
    }
    if (z.type === "password") {
        z.type = "text";
    } else {
        z.type = "password";
    }
}
function showPasswordChange() {
    var w = document.getElementById("newPasswordId");
    var v = document.getElementById("confirmPasswordId");
    if (w.type === "password") {
        w.type = "text";
    } else {
        w.type = "password";
    }
    if (v.type === "password") {
        v.type = "text";
    } else {
        v.type = "password";
    }
}