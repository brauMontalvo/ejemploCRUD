// Add Record
function addRecord() {
    // get values
    var cve = $("#cve").val();
    var snombre = $("#snombre").val();
    var sapepat = $("#sapepat").val();
    

    // Add record
    $.post("ajax/addRecord.php", {
        cve: cve,
        snombre: snombre,
        sapepat: sapepat,
		
    }, function (data, status) {
        // close the popup
        $("#add_new_record_modal").modal("hide");

        // read records again
        readRecords();

        // clear fields from the popup
        $("#cve").val("");
        $("#snombre").val("");
        $("#sapepat").val("");
        
    });
}

// READ records
function readRecords() {
    $.get("ajax/readRecord.php", {}, function (data, status) {
        $("#records_content").html(data);
    });
}

// READ materias
function readMaterias() {
    $.get("ajax/leerMaterias.php", {}, function (data, status) {
        $("#tablaMaterias").html(data);
    });
}


function DeleteUser(id) {
    var conf = confirm("¿Está seguro, realmente desea eliminar el registro?");
    if (conf == true) {
        $.post("ajax/deleteUser.php", {
                id: id
            },
            function (data, status) {
                // reload Users by using readRecords();
                readRecords();
            }
        );
    }
}

function GetUserDetails(id) {
    // Add User ID to the hidden field for furture usage
    $("#hidden_user_id").val(id);
    $.post("ajax/readUserDetails.php", {
            id: id
        },
        function (data, status) {
            // PARSE json data
            var user = JSON.parse(data);
            // Assing existing values to the modal popup fields
            $("#update_idalumno").val(user.idalumno);
            $("#update_cve").val(user.cve);
            $("#update_snombre").val(user.snombre);
        }
    );
    // Open modal popup
    $("#update_user_modal").modal("show");
}

function UpdateUserDetails() {
    // get values
    var idalumno = $("#update_idalumno").val();
    var cve = $("#update_cve").val();
    var snombre = $("#update_snombre").val();

    // get hidden field value
    var id = $("#hidden_user_id").val();

    // Update the details by requesting to the server using ajax
    $.post("ajax/updateUserDetails.php", {
            id: id,
            idalumno: idalumno,
            cve: cve,
            snombre: snombre
        },
        function (data, status) {
            // hide modal popup
            $("#update_user_modal").modal("hide");
            // reload Users by using readRecords();
            readRecords();
        }
    );
}


$(document).ready(function () {
    // READ recods on page load
   readRecords(); // calling function
   readMaterias();
});