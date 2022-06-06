class QuizGuessesController < ApplicationController
  before_action :require_login

  def show
    @quiz_guess = QuizGuess.find(params[:id])
  end

  def new
    @quiz_guess = QuizGuess.new
    @behavior = Behavior.order("RANDOM()").first
    @pillars = Pillar.all.includes(:competencies)
    @levels = Level.all
  end

  def create
    @quiz_guess = QuizGuess.new(quiz_guess_params)

    respond_to do |format|
      if @quiz_guess.save
        format.html { redirect_to quiz_guess_url(@quiz_guess), notice: "Quiz guess was successfully created." }
        format.json { render :show, status: :created, location: @quiz_guess }
      else
        @behavior = Behavior.find(quiz_guess_params["behavior_id"])
        @pillars = Pillar.all.includes(:competencies)
        @levels = Level.all
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quiz_guess.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def quiz_guess_params
      params.require(:quiz_guess).permit(:behavior_id, :level_id, :competency_id)
    end
end
