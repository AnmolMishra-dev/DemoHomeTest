# demohome

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Google Spread Sheet Script(Post/Sheet entry)
//

function doPost(request){
// Open Google Sheet using ID
var sheet = SpreadsheetApp.openById("1pryFtCGkkwOlABtD0epQKbbqmVeQx1RXXaZ1_8rb3tE");
var result = {"status": "SUCCESS"};
try{
// Get all Parameters
var name = request.parameter.name;
var email = request.parameter.email;
var mobileNo = request.parameter.mobileNo;
var feedback = request.parameter.feedback;
var currentDate = request.parameter.currentDate;

    // Append data on Google Sheet
    var rowData = sheet.appendRow([name, email, mobileNo, feedback ,currentDate]);

}catch(exc){
// If error occurs, throw exception
result = {"status": "FAILED", "message": exc};
}

// Return result
return ContentService
.createTextOutput(JSON.stringify(result))
.setMimeType(ContentService.MimeType.JSON);
}



Google Spread Sheet Script(get/Sheet Data get )
//

function doGet(request){
// Open Google Sheet using ID
var sheet = SpreadsheetApp.openById("1pryFtCGkkwOlABtD0epQKbbqmVeQx1RXXaZ1_8rb3tE");

// Get all values in active sheet
var values = sheet.getActiveSheet().getDataRange().getValues();
var data = [];

// Iterate values in descending order
for (var i = values.length - 1; i >= 1; i--) {

    // Get each row
    var row = values[i];

    // Create object
    var feedback = {};

    feedback['name'] = row[0];
    feedback['email'] = row[1];
    feedback['mobile_no'] = row[2];
    feedback['feedback'] = row[3];
    feedback['currentDate'] = row[4];

    // Push each row object in data
    data.push(feedback);
}

// Return result
return ContentService
.createTextOutput(JSON.stringify(data))
.setMimeType(ContentService.MimeType.JSON);
}

