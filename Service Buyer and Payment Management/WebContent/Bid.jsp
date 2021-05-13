<%@page import="com.Bid"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bid Management</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">

<script src="/Components/jquery-3.6.0.min.js"></script>
<script src="jquery-3.6.0.min.js"></script>
<script src="Components/bids.js"></script>


<script src="bids.js"></script>

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-6">
				<h1>Bids Management</h1>
				<form id="formItem" name="formItem">

					<br> Item Code: <input id="itemCode" name="itemCode"
						type="text" class="form-control form-control-sm"> <br>
					Customer ID: <input id="customerId" name="customerId" type="text"
						class="form-control form-control-sm"> <br> Bid
					Amount: <input id="amount" name="amount" type="text"
						class="form-control form-control-sm"> <br> Special
					Conditions: <input id="sConditions" name="sConditions" type="text"
						class="form-control form-control-sm"> <br> Due Date:
					<input id="dueDate" name="dueDate" type="text"
						class="form-control form-control-sm"> <br> <input
						id="btnSave" name="btnSave" type="button" value="Save"
						class="btn btn-primary"> <input type="hidden"
						id="hidBidIDSave" name="hidBidIDSave" value="">
				</form>
				<div id="alertSuccess" class="alert alert-success"></div>
				<div id="alertError" class="alert alert-danger"></div>
				<br>
				<div id="divItemsGrid">
					<%
					Bid bidObj = new Bid();

					out.print(bidObj.readBids());
					%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>