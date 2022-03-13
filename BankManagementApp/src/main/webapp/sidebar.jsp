<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sidebar</title>
<link type="text/css" rel="stylesheet" href="sidebar.css">
<link href="label.css" type="text/css" rel="stylesheet">
<link href="button.css" type="text/css" rel="stylesheet">
</head>
<body>
<div>
<form class="sidebar">
<br>
<button type="submit" formaction="CustomerServlet" formmethod="post">Customer</button>
<button type="submit" formaction="AccountServlet" formmethod="post">Account</button>
<input type="hidden" name="action" value="Customer">
<button name="moneyexchange" value="deposit" type="submit" formaction="CustomerCount" formmethod="post">Deposit</button>
<button name="moneyexchange" value="withdraw" type="submit" formaction="CustomerCount" formmethod="post">Withdraw</button>
<button name="moneyexchange" value="transaction" type="submit" formaction="CustomerCount?moneyexchange=transaction" formmethod="post">Transfer to Other Account</button>
<button name="moneyexchange" value="logout" type="submit" formaction="LogOutServlet?moneyexchange=logout" formmethod="post">Log Out</button>
</form>
</div>
</body>
</html>