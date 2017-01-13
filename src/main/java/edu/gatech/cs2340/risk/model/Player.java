package edu.gatech.cs2340.risk.model;

/**
* This class represents a player in Star Galaxy Risk
*/
public class Player {
	private String name, color;
	private int totalFleets, numPlanets, numStarSystems;

	public Player(String name, String color, int totalFleets){
		this.name = name;
		this.color = color;
		this.totalFleets = totalFleets;
		numPlanets = 5; 
		numStarSystems = 1;
	}

	public Player(String name, String color){
		this.name = name;
		this.color = color;
		totalFleets = 35;
		numPlanets = 5; 
		numStarSystems = 1;
	}

	public int getFleets(){
		return totalFleets;
	}

	public void removeFleet(){
		totalFleets--;
	}

	public void setTotalFleets(int newTotalFleets){
		totalFleets = newTotalFleets;
	}

	public int calcMoreFleets(){
		int newFleetsAdded = 0;
		if(numPlanets < 9 && numPlanets > 0){
			newFleetsAdded = (3 + (numStarSystems * 3));
			totalFleets += newFleetsAdded;
		}else if(numPlanets >= 9){
			newFleetsAdded = ((numPlanets/3) + (numStarSystems * 3));
			totalFleets += newFleetsAdded;
		}
		return newFleetsAdded;
	}

	public String getName(){
		return name;
	}

	public String getColor(){
		return color;
	}

	public int getNumStarSystems(){
		return numStarSystems;
	}

	public void setNumStarSystems(int newNumStarSystems){
		numStarSystems = newNumStarSystems;
	}

	public int getNumPlanets(){
		return numPlanets;
	}

	public void setNumPlanets(int newNumPlanets){
		numPlanets = newNumPlanets;
	}

	public void setName(String newName) {
		name = newName;
	}






}