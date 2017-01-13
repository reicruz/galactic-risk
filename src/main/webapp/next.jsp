<%@ page import="edu.gatech.cs2340.risk.model.GameLogic" %>
<%@ page import="edu.gatech.cs2340.risk.model.Player" %>
<%@ page import="edu.gatech.cs2340.risk.model.Planet" %>
<%@ page import="edu.gatech.cs2340.risk.model.StarSystem" %>
<%@ page import="java.util.*" %>




<% ArrayList<Player> players = 
    (ArrayList<Player>) request.getAttribute("players"); 
   
   ArrayList<StarSystem> systems = 
    (ArrayList<StarSystem>) request.getAttribute("systems"); 
  
   GameLogic game = (GameLogic) request.getAttribute("game"); %>


	
<html>
    <head>
        <title>Star Galaxy</title>
        <script src="jquery.js"></script>
        <link rel="stylesheet" type="text/css" href="mapStyle.css"/>
    </head>
    <body>
		<table>
			<tr>
				<td id="0" height="200" width="200">
					<div class="container" id="starSystem1">
						<img src="images/starSystem.gif" width="200" height="200">
						<div class="planetTemp" id="-1">
							0
							<a href="planetStats.jsp"><span></span></a> <!--Using empty span to make div clickable -->
						</div>
						<div class="planetTemp" id="-2">
							0
							 <a href="planetStats.jsp"><span></span></a>
						</div>
						<div class="planetTemp" id="-3">
							0
							 <a href="planetStats.jsp"><span></span></a>
						</div>
						<div class="planetTemp" id="-4">
							0
							 <a href="planetStats.jsp"><span></span></a>
						</div>
						<div class="planetTemp" id="-5">
							0
							 <a href="planetStats.jsp"><span></span></a>
						</div>
					</div>
				</td>
				<td id="3" height="200" width="200"></td>
				<td id="1" height="200" width="200"></td>
			</tr>
			<tr>
				<td height="200" width="200"><td>
			</tr>
			<tr>
				<td id="4" height="200" width="200"></td>
				<td id="2" height="200" width="200"></td>
				<td id="5" height="200" width="200"></td>
			</tr>
		</table>

			


		<script type="text/javascript">
			for (var i = 1; i < <%= players.size() %>; i++) {
				$('#starSystem1').clone().appendTo('#' + i);
			}
			$(".container").each( function(index) {
				$(this).removeAttr('id');
				$(this).attr('id', 'startSystem' + (index + 1));
			})
				
			<% for (int i = 0; i <  systems.size(); i++) {
					 StarSystem currentSystem =  systems.get(i); %>
				$(".planetTemp").each( function(index) {
					<% int planetCount = 0; %>
					<% ArrayList<Planet> planetArray = currentSystem.getPlanets(); %>  
					<% Planet currPlanet = planetArray.get(planetCount);%>
					<% planetCount++; %>
					var newId = 'planet' + (<%=i%>+1) + (this).id;
					var newColor = '<%= currentSystem.getOwner().getColor() %>';
					var currPlanetFleets = <%= currPlanet.getFleets() %>;
					$(this).removeAttr('class');
					$(this).attr('class', 'planet');
					$(this).attr('id', newId);
					$(this).css("background", newColor);
					$(this).innerHtml = currPlanetFleets.toString();
					// window.alert(currPlanetFleets.toString());
					if ((index + 1)%5 == 0) {
						<% planetCount = 0; %>
						return false;
					}
				})
			<%}%>
			
			$(document).ready(function() {
			   $('.planet').mouseenter(function() {
				   $(this).animate({
					   height: '+=.5em'
					   width: '+=.5em'
					   -webkit-border-radius: '-=0.25em'
					   
				   });
			   });
			   $('.planet').mouseleave(function() {
				   $(this).animate({
					   height: '-=.5em'
					   width: '-=.5em'
					   -webkit-border-radius: '-=0.25em'
				   }); 
			   });
			 });
			
			
		</script>

		<form action="//servlet method here" method="POST">
		<input id='quit' type="submit" value="End Turn!">

    </body>
</html>
