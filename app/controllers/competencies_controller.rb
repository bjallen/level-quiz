class CompetenciesController < ApplicationController
  before_action :require_login
  before_action :set_competency, only: %i[ show edit update destroy ]

  # GET /competencies or /competencies.json
  def index
    @competencies = Competency.all
  end

  # GET /competencies/1 or /competencies/1.json
  def show
  end

  # GET /competencies/new
  def new
    @competency = Competency.new
    @pillars = Pillar.all
  end

  # GET /competencies/1/edit
  def edit
    @pillars = Pillar.all
  end

  # POST /competencies or /competencies.json
  def create
    @competency = Competency.new(competency_params)

    respond_to do |format|
      if @competency.save
        format.html { redirect_to competency_url(@competency), notice: "Competency was successfully created." }
        format.json { render :show, status: :created, location: @competency }
      else
        @pillars = Pillar.all
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @competency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /competencies/1 or /competencies/1.json
  def update
    respond_to do |format|
      if @competency.update(competency_params)
        format.html { redirect_to competency_url(@competency), notice: "Competency was successfully updated." }
        format.json { render :show, status: :ok, location: @competency }
      else
        @pillars = Pillar.all
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @competency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /competencies/1 or /competencies/1.json
  def destroy
    @competency.destroy

    respond_to do |format|
      format.html { redirect_to competencies_url, notice: "Competency was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competency
      @competency = Competency.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def competency_params
      params.require(:competency).permit(:name, :pillar_id)
    end
end
