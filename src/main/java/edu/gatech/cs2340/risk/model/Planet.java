package edu.gatech.cs2340.risk.model;
/**
 * This class contains pointers to previous and next planets in its star system
 * This class defines a Planet in our game
 */

public class Planet
{
    private Planet prevPlanet, nextPlanet;
    private Player owner;
    private int numFleets; 
    private static int currentName;
    private int name;

    /**
    * Set's the Planet's owner and number of fleets to the variables passed in
    */

    public Planet(Player owner, int numFleets) {
        this.owner = owner;
        this.numFleets = numFleets; 
        name = ++currentName;
    }
    /**
    * Setter for the owner of this planet
    */
    
    public void setOwner (Player owner) {
        this.owner = owner;
    }
    /**
    * Get's the owner for the Planet
    */
    public Player getOwner() {
        return owner;
    }
    /**
    * Set's the number of fleets on a Planet
    */
    public void setFleets(int numFleets) {
        this.numFleets = numFleets;
    }
    /**
    * Return the number of fleets on the Planet
    */
    public int getFleets() {
        return numFleets;
    }

    public int getName(){
        return name;
    }

    public int getCurrentName(){
        return currentName;
    }

}
