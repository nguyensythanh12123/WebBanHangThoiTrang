//Load data in table when documents is ready
$(document).ready(function () {
    loadData();
});

//Load data function
function loadData() {
    $.ajax({
        url: "/AjaxTT/List",
        type: "GET",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var html = '';
            $.each(result, function (key, item) {
                html += '<tr>';
                html += '<td>' + item.MaSP + '</td>';
                html += '<td>' + item.TenSP + '</td>';
                html += '<td>' + item.GiaBan + '</td>';
                html += '<td>' + item.GiamGia + '</td>';
                html += '<td>' + item.MoTa + '</td>';
                html += '<td>' + item.MaNCC + '</td>';
                html += '<td>' + item.MaLoai + '</td>';
                html += '<td>' + item.Anh + '</td>';
                html += '<td>' + item.AnhCT + '</td>';
                html += '<td>' + item.Size + '</td>';
                html += '<td><a href="#" onclick="return GetbyID(' + item.MaSP + ')">Edit</a> |'
                     + ' <a href="#" onclick="Delete(' + item.MaSP + ')">Delete</a></td>';
                html += '</tr>';
            });
            $('.tbody').html(html);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
function Add() {
    var empObj = {
        MaSP: $('#MaSP').val(),
        TenSP: $('#TenSP').val(),
        GiaBan: $('#GiaBan').val(),
        GiamGia: $('#GiamGia').val(),
        MoTa: $('#MoTa').val(),
        MaNCC: $('#MaNCC').val(),
        MaLoai: $('#MaLoai').val(),
        Anh: $('#Anh').val(),
        AnhCT: $('#AnhCT').val(),
        Size: $('#Size').val(),
    };
    $.ajax({
        url: "/PhanTrangAJAX/Add",
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

function GetbyID(MaSP) {
    $.ajax({
        url: "/PhanTrangAJAX/GetbyID/" + MaSP,
        type: "GET",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            $('#MaSP').val(result.MaSP);
            $('#TenSP').val(result.TenSP);
            $('#GiaBan').val(result.GiaBan);
            $('#GiamGia').val(result.GiamGia);
            $('#MoTa').val(result.MoTa);
            $('#MaNCC').val(result.MaNCC);
            $('#MaLoai').val(result.MaLoai);
            $('#Anh').val(result.Anh);
            $('#AnhCT').val(result.AnhCT);
            $('#Size').val(result.Size);
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
        MaSP: $('#MaSP').val(),
        TenSP: $('#TenSP').val(),
        GiaBan: $('#GiaBan').val(),
        GiamGia: $('#GiamGia').val(),
        MoTa: $('#MoTa').val(),
        MaNCC: $('#MaNCC').val(),
        MaLoai: $('#MaLoai').val(),
        Anh: $('#Anh').val(),
        AnhCT: $('#AnhCT').val(),
        Size: $('#Size').val(),
    };
    $.ajax({
        url: "/PhanTrangAJAX/Update",
        data: JSON.stringify(empObj),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            $('#iopen').trigger('click');
            $('#MaSP').val("");
            $('#TenSP').val("");
            $('#GiaBan').val("");
            $('#GiamGia').val("");
            $('#MoTa').val("");
            $('#MaNCC').val("");
            $('#MaLoai').val("");
            $('#Anh').val("");
            $('#AnhCT').val("");
            $('#Size').val("");
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function Delete(MaSP) {
    var ans = confirm("Are you sure you want to delete this?");
    if (ans) {
        $.ajax({
            url: "/PhanTrangAJAX/Delete/" + MaSP,
            type: "GET",
            contentType: "application/json;charset=UTF-8",
            dataType: "json",
            success: function (result) {
                //loadData();
                return;
            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }
}
