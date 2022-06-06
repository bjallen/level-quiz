class BehaviorsController < ApplicationController
  before_action :require_login
  before_action :set_behavior, only: %i[ show edit update destroy ]

  # GET /behaviors or /behaviors.json
  def index
    @behaviors = Behavior.all
  end

  # GET /behaviors/1 or /behaviors/1.json
  def show
  end

  # GET /behaviors/new
  def new
    @behavior = Behavior.new
    @competencies = Competency.all
    @levels = Level.all
  end

  # GET /behaviors/1/edit
  def edit
    @competencies = Competency.all
    @levels = Level.all
  end

  # POST /behaviors or /behaviors.json
  def create
    @behavior = Behavior.new(behavior_params)

    respond_to do |format|
      if @behavior.save
        format.html { redirect_to behavior_url(@behavior), notice: "Behavior was successfully created." }
        format.json { render :show, status: :created, location: @behavior }
      else
        @competencies = Competency.all
        @levels = Level.all
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @behavior.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /behaviors/1 or /behaviors/1.json
  def update
    respond_to do |format|
      if @behavior.update(behavior_params)
        format.html { redirect_to behavior_url(@behavior), notice: "Behavior was successfully updated." }
        format.json { render :show, status: :ok, location: @behavior }
      else
        @competencies = Competency.all
        @levels = Level.all
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @behavior.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /behaviors/1 or /behaviors/1.json
  def destroy
    @behavior.destroy

    respond_to do |format|
      format.html { redirect_to behaviors_url, notice: "Behavior was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_behavior
      @behavior = Behavior.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def behavior_params
      params.require(:behavior).permit(:description, :competency_id, :level_id)
    end
end
