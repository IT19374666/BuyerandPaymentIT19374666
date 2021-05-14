
$(document).ready(function() {
	alert("Bid.js file connected")
	if ($("#alertSuccess").text().trim() == "") {
		$("#alertSuccess").hide();
	}
	$("#alertError").hide();
});


$(document).on("click", "#btnSave", function(event) {
	// Clear alerts---------------------
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();
	// Form validation-------------------
	var status = validateItemForm();
	if (status != true) {
		$("#alertError").text(status);
		$("#alertError").show();
		return;
	}
	// If valid------------------------
	var type = ($("#hidBidIDSave").val() == "") ? "POST" : "PUT";
	alert(type);
	$.ajax(
		{
			url: "BidApi",
			type: type,
			data: $("#formItem").serialize(),
			dataType: "text",
			complete: function(response, status) {
				onItemSaveComplete(response.responseText, status);
			}
		});
});

function onItemSaveComplete(response, status) {
	if (status == "success") {
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success") {
			$("#alertSuccess").text("Successfully saved.");
			$("#alertSuccess").show();
			$("#divItemsGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error") {
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error") {
		$("#alertError").text("Error while saving.");
		$("#alertError").show();
	} else {
		$("#alertError").text("Unknown error while saving..");
		$("#alertError").show();
	}
	
	$("#hidBidIDSave").val("");
	$("#formItem")[0].reset();
}


$(document).on("click", ".btnRemove", function(event) {
	$.ajax(
		{
			url: "BidApi",
			type: "DELETE",
			data: "bidId=" + $(this).data("bidid"),
			dataType: "text",
			complete: function(response, status) {
				onItemDeleteComplete(response.responseText, status);
			}
		});
});
function onItemDeleteComplete(response, status) {
	if (status == "success") {
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success") {
			$("#alertSuccess").text("Successfully deleted.");
			$("#alertSuccess").show();
			$("#divItemsGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error") {
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error") {
		$("#alertError").text("Error while deleting JS.");
		$("#alertError").show();
	} else {
		$("#alertError").text("Unknown error while deleting..");
		$("#alertError").show();
	}
}

// UPDATE==========================================
$(document).on("click", ".btnUpdate", function(event) {
	
	$("#hidBidIDSave").val($(this).data("bidid")); 
	$("#itemCode").val($(this).closest("tr").find('td:eq(1)').text());
	$("#customerId").val($(this).closest("tr").find('td:eq(2)').text());
	$("#amount").val($(this).closest("tr").find('td:eq(3)').text());
	$("#sConditions").val($(this).closest("tr").find('td:eq(4)').text());
	$("#dueDate").val($(this).closest("tr").find('td:eq(5)').text());
	
});

// CLIENT-MODEL================================================================
function validateItemForm() {
	// Item
	if ($("#itemCode").val().trim() == "") {
		return "Insert Item Code.";
	}
	// Customer
	if ($("#customerId").val().trim() == "") {
		return "Insert Customer ID.";
	}
	// Amount-------------------------------
	if ($("#amount").val().trim() == "") {
		return "Insert Amount.";
	}
	// is numerical value
	var tmpAmount = $("#amount").val().trim();
	if (!$.isNumeric(tmpAmount)) {
		return "Insert a numerical value for Amount.";
	}
	// convert to decimal price
	$("#amount").val(parseFloat(tmpAmount).toFixed(2));

	return true;
}

