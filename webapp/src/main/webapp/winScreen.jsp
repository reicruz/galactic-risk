<%@ page import="edu.gatech.cs2340.risk.model.Player" %>

<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<% 
    Player currentPlayer = (Player) request.getAttribute("currentPlayer");
%>

<p><%=currentPlayer.getName()%> won!</p>
<div id="click"><a href="/risk/playerSelection">PLAY</a></div>
