class PokemonsController < ApplicationController
	
	def capture
		@pokemon = Pokemon.find(params[:id])
		@pokemon.trainer = current_trainer
		@pokemon.save
		redirect_to root_path
	end

	def damage
	    @pokemon = Pokemon.find(params[:id])
	    if @pokemon.health > 0
	    	@pokemon.health = @pokemon.health - 10
	    else
	    	@pokemon.destroy
	    end
	    @pokemon.save
	    redirect_to trainer_path(current_trainer)
	end

	def new
		@pokemon = Pokemon.new
	end

	def create
		@pokemon = Pokemon.new(pokemon_params)
		@pokemon.health = 100
		@pokemon.level = 1
		@pokemon.trainer = current_trainer
		if @pokemon.save == false
			flash[:error] = @pokemon.errors.full_messages.to_sentence
			redirect_to new_pokemon_path
		else
			redirect_to trainer_path(current_trainer)
		end
		
		
	end

	def pokemon_params
		params.require(:pokemon).permit(:name)
	end

end

