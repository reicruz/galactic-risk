<%@ page import="edu.gatech.cs2340.risk.model.GameLogic" %>
<%@ page import="edu.gatech.cs2340.risk.model.Player" %>
<%@ page import="edu.gatech.cs2340.risk.model.Planet" %>
<%@ page import="edu.gatech.cs2340.risk.model.StarSystem" %>
<%@ page import="java.util.*" %>

<%	
	ArrayList<Player> players = (ArrayList<Player>) request.getAttribute("players"); 
    GameLogic game = (GameLogic) request.getAttribute("game");
    Player currentPlayer = (Player) request.getAttribute("currentPlayer");
%>

<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <title>Star System Risk</title>
  
  <script src="jquery.js"></script>

  <style type="text/css">
  .PlayerColor {
  	color: #000;
  }
  .centertext {
  	text-align: center;
  }
  </style>

</head>

<body>

<!-- here is the table that shows all of the players stats -->
<table width="306" border="1" align="center">
  <tr>
    <th width="66" scope="col">Players</th>
    <th width="55" scope="col">Color</th>
    <th width="62" scope="col">Total Fleets</th>
    <th width="95" scope="col">Total Planets Owned</th>
  </tr>
  
  <!-- This for loop is pretty cool, it creates the table based on how
  		many people are playing -->
  <% for (int id = 0; id < players.size(); id++) { %>
      <form action="/risk/playerSelection/<%= id %>" method="POST">
      <tr>
        <td><%= players.get(id).getName() %></td>
        <th bgcolor= "<%= players.get(id).getColor()%>"> <%= players.get(id).getColor() %></th>
        <td><%= players.get(id).getFleets() %></td>
        <td><%= players.get(id).getNumPlanets() %></td>
      </tr>
      </form>
  <% } %>
</table>

<p align="center"><%= game.getLog() %></p>
<h1 align="center">It is <%= currentPlayer.getName() %>'s turn</h1>

<h2 align="center"><%= currentPlayer.getName() %> has <%=  game.getNewFleetsToBeAdded() %> fleets left to add</h2>


<p>&nbsp;</p>

<% int j=0; %>
<!-- here are all of the Systems and their attributes listed below-->
<% for (int id = 0; id < game.getAllSystems().size(); id++) { %>
	<% StarSystem currentSystem = game.getAllSystems().get(id); %>
    <table width="306" border="1" align="center">
      <tr>
        <th width="66" scope="col">Planet Name</th>
        <th width="55" scope="col">Owner</th>
        <th width="62" scope="col">Number Of Fleets</th>
        <th width="" scope="col"></th>
        <th width="" scope="col"></th>
        <th width="" scope="col">Fortification Source</th>
        <th width="" scope="col"></th>
        <th scope="col">Attack Source</th>
        <th scope="col">Attack Amount</th>
      </tr>
      <h1 align="center"> System <%= (id+1) %></h1>
      
	<% for (int k=0; k < currentSystem.getPlanets().size(); k++,j++) { %>
    <% Planet currentPlanet = currentSystem.getPlanets().get(k); %>
      <form action="/risk/game" method="POST">
         	<tr>
            <td><%= currentPlanet.getName()%></td>
            <th bgcolor="<%= currentPlanet.getOwner().getColor()%>"><%= currentPlanet.getOwner().getName() %></th>
            <td><%= currentPlanet.getFleets() %></td>
            
            <!-- So here are all of the buttons, the javascript enables them-->
            <td>
            <form action="/risk/create/<%= j %>" method="POST">
              <input type="hidden" name="operation" value="ADDFLEETS" />
              <input type="hidden" id="planetID" value="<%= currentPlanet.getOwner().getName()%>" name="currentPlayer" />
              <input type="hidden" id="planetID" name="planetID" value="<%= j %>" />
              <input type="submit" id="Add New Fleets" name="addNewFleets" value="Add New Fleets" disabled/>
            </form>
            <!-- first this disables all elements when page is loaded -->
            <!-- Had to throw the for loop in here to enable all of the elements -->
			<script type="text/javascript">
			var fleetButtons = document.getElementsByName("addNewFleets");
			for (var i=0; i<fleetButtons.length; i++) {
				if (<%= currentPlanet.getOwner().getName().equals(currentPlayer.getName()) %>) {
					fleetButtons[i].disabled = false;
        		}
			}
        	</script>	
            </td>
            <td>
              <form action="/risk/game" method="POST">
              <input type="hidden" name="operation" value="FORTIFY" />
              <input type="hidden" id="planetID" value="<%= currentPlanet.getOwner().getName()%>" name="currentPlayer" />
              <input type="hidden" id="planetID" name="planetID" value="<%= j %>" />
              <input type="submit" id="fortify" name="fortifyButtons" value="Fortify" disabled/>
            </td>
             <td>
              <select name="fortifyPlanets" disabled>
                <% for (StarSystem system : game.getAllSystems()) {
                    for (Planet planet : system.getPlanets()) {
                      if (planet.getOwner().equals(currentPlayer) 
                        && (!currentPlanet.equals(planet)) 
                          && (planet.getFleets() > 1)) {%>
                        <option value="<%= planet.getName()%>"><%=planet.getName()%></option>
                      <%}
                  }
               }%> 
              </select>
              </td>
              </form>
              <script type="text/javascript">
              var fortifyButtons = document.getElementsByName("fortifyButtons");
              var fortifyPlanets = document.getElementsByName("fortifyPlanets");
              for (var i=0; i<fortifyButtons.length; i++) {
                if (<%= currentPlanet.getOwner().getName().equals(currentPlayer.getName()) %>) {
                  fortifyButtons[i].disabled = false;
                  fortifyPlanets[i].disabled = false;
            }
      }
          </script> 
            </td>
            <td>
              <form action="/risk/game" method="POST">
              <input type="hidden" name="operation" value="ATTACK" />
              <input type="hidden" id="planetID" value="<%= currentPlanet.getOwner().getName()%>" name="currentPlayer" />
              <input type="hidden" id="planetID" name="planetID" value="<%= j %>" />
              <input type="submit" id="Attack" name="attackButtons" value="Attack" disabled/>
            </td>
            <td>
              <select name="viablePlanets" disabled>
               <% for (StarSystem system : game.getAllSystems()) {
                    for (Planet planet : system.getPlanets()) {
                      if (planet.getOwner().equals(currentPlayer) 
                        && (!currentPlanet.getOwner().equals(currentPlayer)) 
                          && (planet.getFleets() > 1)) {%>
                        <option value="<%= planet.getName()%>"><%=planet.getName()%></option>
                      <%}
                  }
               }%> 
              </select>
            </td>
            <td>
                <input type="text" name="fleetAmount" maxlength="3" size="1" disabled>
            </td>
            </form>
          </tr>  
         
  	<% } //ends inner for loop %>
  <% } //Ends outer loop %>
</table>

</form>
  <form action="/risk/game" method="POST">
  	  <input type="hidden" name="operation" value="GAME" />    
      <input type="submit" id="End Turn" value="End Turn" disabled/>
  </form>

<!-- keeps the buttons from displaying if the player has no fleets to add -->
<!-- also enables the attack buttons -->
 <script type="text/javascript">
      if (<%= game.getNewFleetsToBeAdded()%> == 0) {
        for (var i=0; i<document.getElementsByName("addNewFleets").length; i++){
          document.getElementsByName("addNewFleets")[i].disabled = true;
          // document.getElementsByName("fortifyButtons")[i].disabled = true;
          // document.getElementsByName("fortifyPlanets")[i].disabled = true;
        }
		for (var i=0; i<document.getElementsByName("attackButtons").length; i++){
          document.getElementsByName("attackButtons")[i].disabled = false;
          document.getElementsByName("viablePlanets")[i].disabled = false;
          document.getElementsByName("fleetAmount")[i].disabled = false;
        }

		document.getElementById("End Turn").disabled = false;
	 }
 </script>

</body>
</html>