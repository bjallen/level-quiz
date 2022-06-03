class PillarsController < ApplicationController
  before_action :set_pillar, only: %i[ show edit update destroy ]

  # GET /pillars or /pillars.json
  def index
    @pillars = Pillar.all
  end

  # GET /pillars/1 or /pillars/1.json
  def show
  end

  # GET /pillars/new
  def new
    @pillar = Pillar.new
  end

  # GET /pillars/1/edit
  def edit
  end

  # POST /pillars or /pillars.json
  def create
    @pillar = Pillar.new(pillar_params)

    respond_to do |format|
      if @pillar.save
        format.html { redirect_to pillar_url(@pillar), notice: "Pillar was successfully created." }
        format.json { render :show, status: :created, location: @pillar }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pillar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pillars/1 or /pillars/1.json
  def update
    respond_to do |format|
      if @pillar.update(pillar_params)
        format.html { redirect_to pillar_url(@pillar), notice: "Pillar was successfully updated." }
        format.json { render :show, status: :ok, location: @pillar }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pillar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pillars/1 or /pillars/1.json
  def destroy
    @pillar.destroy

    respond_to do |format|
      format.html { redirect_to pillars_url, notice: "Pillar was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pillar
      @pillar = Pillar.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pillar_params
      params.require(:pillar).permit(:name)
    end
end
