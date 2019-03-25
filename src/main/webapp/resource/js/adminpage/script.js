function setBold() {
    var menu;
    menu = document.getElementById("menu").getAttribute("data-page");
    if (menu !== null) {
        document.getElementById(menu).className = "fontBold";
    }
}

function readURL(input, imgControlName) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $(imgControlName).attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}

function sortDropDownListByText() {
// Loop for each select element on the page.
    $("#first").each(function () {
// Keep track of the selected option.
        var selectedValue = $(this).val();
        // Sort all the options by text. I could easily sort these by val.
        $(this).html($("option", $(this)).sort(function (a, b) {
            return a.text.toUpperCase() == b.text.toUpperCase() ? 0 : a.text.toUpperCase() < b.text.toUpperCase() ? -1 : 1
        }));
        // Select one option.
        $(this).val(selectedValue);
    });
}

