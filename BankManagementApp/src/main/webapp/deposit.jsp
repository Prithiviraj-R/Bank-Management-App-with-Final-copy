<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
    <%@page import="Details.AccountDetails" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Deposit/withdraw</title>
</head>
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css"> -->
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"> -->
<link href="commonstyle.css" type="text/css" rel="stylesheet">
<link href="label.css" type="text/css" rel="stylesheet">
<link href="button.css" type="text/css" rel="stylesheet">
<style>
form.new
{
width:1000px;
padding:41px;
}
div.div
{
float:right;
}
div.search_select_box
{
height:60px;
margin-left:250px;
}
.search_select_box button
{
background-color:#080342;
padding:15px;
color:#fff;
}
</style>
<script>
document.getElementById("myAnchor").addEventListener("click", function(event){
	  event.stopPropagation()
	});
</script>
<body>
<%if(session.getAttribute("lastId")==null)
{
	RequestDispatcher rd=request.getRequestDispatcher("login.jsp");  
    rd.forward(request, response);
} %>
<jsp:include page="Header.jsp" />
<h1><b>DEPOSIT/WITHDRAW</b></h1>
<jsp:include page="sidebar.jsp" />
<div class="new">
<form onsubmit="return validSelect();" class="new" method="post" name="myform" id="myform">
<label for="cusId"><b>CustomerID</b></label>
<br>
<br>
<!-- <div class="search_select_box"> -->
<select class="cusId" name="cars" id="cusId" data-live-search="true">
<option value="0">select</option>
<%List<Integer> obj=(List<Integer>) request.getAttribute("AllId"); 
  for(Integer i:obj)
  {
	  
%>
<option name="cusId" value="<%=i%>"><%=i%></option>
<%
}
%>
</select>
<!-- </div> -->
<br>
<br>
<br>
<label for="AccNo"><b>Account Number</b></label>
<br>
<br>
<!-- <div class="search_select_box"> -->
<select class="accNo" name="AccNo" id="AccNum" data-live-search="true">
<option value="0">select</option>
<%Map<Integer,Map<Long,AccountDetails>> obj1=(Map<Integer,Map<Long,AccountDetails>>) request.getAttribute("AccountMap"); 
  for(Integer i:obj1.keySet())
  {
	  for(Long k:obj1.get(i).keySet())
	  {
	     if(obj1.get(i).get(k).isStatus()==true)
	     {
%>
<option value="<%=k%>"><%=k%></option>
<%
}
	  }
  }
%>
</select>
<!-- </div> -->
<br>
<br>
<br>
<label for="Amount"><b>Amount:</b></label>
<br>
<br>
<input type="number" id="Amount" name="Amount" max="50000" required>
<br>
<br>
<button type="submit" formaction="Deposit?moneyexchange=<%=(String)request.getAttribute("moneyexchange")%>" formmethod="post">Submit</button>
<br>
<h4 class=warning><b><%if(request.getAttribute("text")!=null)
	{
	     out.println("**"+(String) request.getAttribute("text"));
	}
%></b></h4>
</form>
</div>
<script>
function validSelect()
{
	  var x = document.myform.Amount;
	  if(Math.sign(x.value)==(-1))
	  {
		  alert("You are tried to enter the negative value");
		  return false;
	  }
		var x=document.myform.cars.value;
	    var y=document.myform.AccNo.value;
		if(y==0)
			{
			   alert("select valid Account Number");
			   return false;
			}
		else if(x==0)
		{
			   alert("Select valid Customer Id");
			   return false;
		}
		else
			{
			return true;
			}
}
// $(document).ready(function()
// {
// 	$('search_select_box select').selectpicker();
// });
</script>
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script> -->
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script> -->
</body>
</html>