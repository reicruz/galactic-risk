<%@ page import="edu.gatech.cs2340.risk.model.Player" %>
<%@ page import="java.util.*" %>

<% ArrayList<Player> players = 
	(ArrayList<Player>) request.getAttribute("players"); %>
<html>
    <head>
        <title>Player Selection</title>
        <link rel="stylesheet" type="text/css" href="stylesheet.css"/>
		<script src="jquery.js"></script>
		<script type="text/javascript" src="script.js"></script>

    </head>
    <body>
		<h1>Select your Players</h1>
        <div id="Red"></div>
        <div id="Blue"></div>
        <div id="Yellow"></div>
        <div id="Green"></div>
		<div id="Purple"></div> 
        <div id="Orange"></div>

	<table>
		<tr>
			<th>Name</th><th>Color</th><th>Fleets</th>
		</tr>
		<% for (int id = 0; id < players.size(); id++) { %>
		<% Player player = players.get(id); %>
		<tr>
			<form action="/risk/update/<%= id %>" method="POST">
			  <!-- hidden operation element to simulate HTTP PUT method in server -->

			  <script type="text/javascript">
				document.getElementById('<%= player.getColor() %>').style.display = "none";
			  </script>

			  <input type="hidden" name="operation" value="PUT"/>
			  <td><input id="name" type="text" name="name" value="<%= player.getName() %>"/></td>
			  <td>
				<input id="playerColor" type="text" style="background-color: <%= player.getColor()%>" readonly="readonly"/>
				<input type="hidden" name="color" value="<%= player.getColor() %>"/>
			  </td>

			  <% int totalFleets = 35;
				 if (players.size() == 4)
					totalFleets = 30;
				 else if (players.size() == 5)
					totalFleets = 25;
				 else if (players.size() == 6)
					totalFleets = 20;
				 player.setTotalFleets(totalFleets);
			  %>


			  <td><%= player.getFleets() %></td>
			<!--  <td><input type="submit" value="Update"/></td> -->
			</form>

			  <form action="/risk/delete/<%= id %>" method="POST">
			  <!-- hidden operation element to simulate HTTP DELETE method in server -->
				<input type="hidden" name="operation" value="DELETE"/>
			<!--	<input type="submit" value="Delete"/> -->
			  </form>

		</tr>			
		<% } %>
		<tr>			
		<script type="text/javascript">
			function blank(a) { if(a.value == a.defaultValue) a.value = ""; }
			function unblank(a) { if(a.value == "") a.value = a.defaultValue; }
		</script>
			<form action="/risk/create" method="POST">
			  <td><input id="name2" type="text" name="name" value="Enter your name" onFocus="blank(this)" onBlur="unblank(this)"/></td>
			  <td>
				<input id="colorBar" type="text" value="" readonly="readonly"/>
				<input id="color" name="color" type="hidden" value=""/>
			  </td>
			  <td><input id="add" type="submit" value="Add" disabled/></td>
			   <script type="text/javascript">
         		if('<%= players.size() %>' >= '6') {
          			document.getElementById('add').disabled = true;
        		}
        		if(document.getElementById('playerColor').style.backgroundColor=="") 
        		{
        			document.getElementById('add').disabled = true;
        		}
        		if(document.getElementById('name2').value!="Enter your name") 
        		{
        			document.getElementById('add').disabled = false;
       			}
        		</script>	
      </script>      
			</form>
			<td></td> <!-- empty cell to align with previous cells -->
		</tr>
		<tr><td></td></tr>
		<tr>
			<td>

			<form action="/risk/game" method="POST">
				<input type="hidden" name="operation" value="GAME">
				<a href="map.jsp">
					<input id='start' type="submit" value="Start!">
					<script type="text/javascript">
         				if('<%= players.size() %>' < '3') {
          					document.getElementById('start').disabled = true;
        				}
        			</script>	
				</a>
			</form>


			<form action="/risk/create" method="POST">
				<input type="hidden" name="operation" value="RANDOM">
				<input type="submit" value="Randomize Order"/>
			</form>		
			</td>
		</tr>
	</table>

    </body>
</html>
			
    </body>
</html>
