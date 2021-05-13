<%@page import="com.Payment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Management</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">


<script src="jquery-3.6.0.min.js"></script>
<script src="Components/jquery-3.6.0.min.js"></script>

<script src="Components/payments.js"></script>

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-6">
				<h1>Payment Management</h1>
				<form id="formItem" name="formItem">

					<br> Item Code: <input id="itemCode" name="itemCode"
						type="text" class="form-control form-control-sm"> <br>
					Bid ID: <input id="bidId" name="bidId" type="text"
						class="form-control form-control-sm"> <br> Customer
					ID: <input id="customerId" name="customerId" type="text"
						class="form-control form-control-sm"> <br> Amount: <input
						id="amount" name="amount" type="text"
						class="form-control form-control-sm"> <br> Payment
					Method: <input id="pMethod" name="pMethod" type="text"
						class="form-control form-control-sm"> <br> Card No: <input
						id="cardNo" name="cardNo" type="text"
						class="form-control form-control-sm"> <br> <input
						id="btnSave" name="btnSave" type="button" value="Save"
						class="btn btn-primary"> <input type="hidden"
						id="hidPaymentIDSave" name="hidPaymentIDSave" value="">
				</form>
				<div id="alertSuccess" class="alert alert-success"></div>
				<div id="alertError" class="alert alert-danger"></div>
				<br>
				<div id="divItemsGrid">
					<%
					Payment payObj = new Payment();
					String customerId = request.getParameter("customerId");
					out.print(payObj.getPayment(customerId));
					%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>