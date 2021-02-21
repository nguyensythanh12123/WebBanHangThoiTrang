//Load data in table when documents is ready
$(document).ready(function () {
    loadData();
});

//Load data function
function loadData() {
    $.ajax({
        url: "/Home/List",
        type: "GET",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var html = '';
            $.each(result, function (key, item) {
                html += '<tr>';
                html += '<td>' + item.id + '</td>';
                html += '<td>' + item.name + '</td>';
                html += '<td>' + item.type + '</td>';
                html += '<td>' + item.price + '</td>';
                html += '<td><a href="#" onclick="return GetbyID(' + item.id + ')">Edit</a> |'
                     + ' <a href="#" onclick="Delete(' + item.id + ')">Delete</a></td>';
                html += '</tr>';
            });
            $('.tbody').html(html);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
//Add data function
function Add() {
    var empObj = {
        id: $('#ID').val(),
        name: $('#Name').val(),
        type: $('#Type').val(),
        price: $('#Price').val(),
    };
    $.ajax({
        url: "/Home/Add",
        data: JSON.stringify(empObj),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            loadData();
            $('#btnAdd').show();
            $('#iclose').trigger('click');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

//Load food detail
function GetbyID(ID) {
    $.ajax({
        url: "/Home/GetbyID/" + ID,
        type: "GET",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            $('#ID').val(result.id);
            $('#Name').val(result.name);
            $('#Type').val(result.type);
            $('#Price').val(result.price);
            $('#iopen').trigger('click');
            $('#btnUpdate').show();
            $('#btnAdd').hide();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
    return false;
}


//Update food
function Update() {
    var empObj = {
        id: $('#ID').val(),
        name: $('#Name').val(),
        type: $('#Type').val(),
        price: $('#Price').val(),
    };
    $.ajax({
        url: "/Home/Update",
        data: JSON.stringify(empObj),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            loadData();
            $('#iopen').trigger('click');
            $('#ID').val("");
            $('#Name').val("");
            $('#Type').val("");
            $('#Price').val("");
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

//Delete food
function Delete(ID) {
    var ans = confirm("Are you sure you want to delete this?");
    if (ans) {
        $.ajax({
            url: "/Home/Delete/" + ID,
            type: "GET",
            contentType: "application/json;charset=UTF-8",
            dataType: "json",
            success: function (result) {
                loadData();
            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }
}
