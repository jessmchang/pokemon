class TrainersController < ApplicationController
  before_filter :authenticate_trainer!

  def index
    @trainers = Trainer.all
  end

  def show
    @trainer = Trainer.find(params[:id])
    @trainer_pokemon = Pokemon.where(trainer_id:current_trainer)
    
    unless @trainer == current_trainer
      redirect_to :back, :alert => "Access denied."
    end
  end

  

end
