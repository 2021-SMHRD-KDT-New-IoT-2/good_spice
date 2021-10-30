package com.model;

public class RecipeVO {
	
	private String recipe_name;
	private String salt;
	private String sugar;
	private String pepper;
	
	public RecipeVO(String recipe_name, String salt, String sugar, String pepper) {
		this.recipe_name = recipe_name;
		this.salt = salt;
		this.sugar = sugar;
		this.pepper = pepper;
	}
	public RecipeVO() {
		
	}
	public String getRecipe_name() {
		return recipe_name;
	}

	public String getSalt() {
		return salt;
	}

	public String getSugar() {
		return sugar;
	}

	public String getPepper() {
		return pepper;
	}
}