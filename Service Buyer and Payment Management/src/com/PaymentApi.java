package com;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PaymentApi
 */
@WebServlet("/PaymentApi")
public class PaymentApi extends HttpServlet {
	private static final long serialVersionUID = 1L;
    Payment payment = new Payment();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentApi() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String output = payment.insertPayment(request.getParameter("itemCode"),
				request.getParameter("bidId"),
				request.getParameter("customerId"),
				request.getParameter("amount"),
				request.getParameter("pMethod"),
				request.getParameter("cardNo"));
				
		response.getWriter().write(output);
	}

}
