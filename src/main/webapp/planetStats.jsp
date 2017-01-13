<%@ page import="edu.gatech.cs2340.risk.model.*" %>
<%@ page import="edu.gatech.cs2340.risk.controller.*" %>
<%@ page import="java.util.*" %>

<% Player player = 
    (Player) request.getAttribute("player"); 
   
   ArrayList<StarSystem> systems = 
    (ArrayList<StarSystem>) request.getAttribute("systems"); 
  
  Planet planet = 
    (Planet) request.getAttribute("planet");
    
   GameLogic game = (GameLogic) request.getAttribute("game"); %>

<html>
    <head>
        <title>Planet's Stats</title>
        <link rel="stylesheet" type="text/css" href="stylesheet.css"/>
		<script src="jquery.js"></script>
		<script type="text/javascript" src="script.js"></script>

    </head>

    <body> Planet's Owner is <%players%>

    </body>
</html>

