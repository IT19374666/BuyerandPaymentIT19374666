
$(document).ready(function()
{
	alert("Payments.js file connected")
if ($("#alertSuccess").text().trim() == "")
 {
 $("#alertSuccess").hide();
 }
 $("#alertError").hide();
}); 


$(document).on("click", "#btnSave", function(event)
{
// Clear alerts---------------------
 $("#alertSuccess").text("");
 $("#alertSuccess").hide();
 $("#alertError").text("");
 $("#alertError").hide();
// Form validation-------------------
var status = validatePaymentForm();
if (status != true)
 {
 $("#alertError").text(status);
 $("#alertError").show();
 return;
 }
// If valid------------------------



 $.ajax(
 {
 url : "PaymentApi",
 type : "POST",
 data : $("#formItem").serialize(),
 dataType : "text",
 complete : function(response, status)
 {
 	onItemSaveComplete(response.responseText, status);
 }
 });
});

function onItemSaveComplete(response, status)
{
if (status == "success")
 {
 var resultSet = JSON.parse(response);
 if (resultSet.status.trim() == "success")
 {
 $("#alertSuccess").text("Successfully saved.");
 $("#alertSuccess").show();
 $("#divItemsGrid").html(resultSet.data);
 } else if (resultSet.status.trim() == "error")
 {
 $("#alertError").text(resultSet.data);
 $("#alertError").show();
 }
 } else if (status == "error")
 {
 $("#alertError").text("Error while saving.");
 $("#alertError").show();
 } else
 {
 $("#alertError").text("Unknown error while saving..");
 $("#alertError").show();
 } 
14
 $("#hidBidIDSave").val("");
 $("#formItem")[0].reset();
}



// CLIENT-MODEL================================================================
function validatePaymentForm()
{
// Item
if ($("#itemCode").val().trim() == "")
 {
 return "Insert Item Code.";
 }
// Customer
if ($("#customerId").val().trim() == "")
 {
 return "Insert Customer ID.";
 }
// Amount-------------------------------
if ($("#amount").val().trim() == "")
 {
 return "Insert Amount.";
 }
// is numerical value
var tmpAmount = $("#amount").val().trim();
if (!$.isNumeric(tmpAmount))
 {
 return "Insert a numerical value for Amount.";
 }
// convert to decimal price
 $("#amount").val(parseFloat(tmpAmount).toFixed(2));

// Paymemt Method------------------------------
if ($("#pMethod").val().trim() == "")
 {
 return "Insert Payment Method.";
 }
// Amount-------------------------------
if ($("#cardNo").val().trim() == "")
 {
 return "Insert Card No.";
 }
return true;
}

