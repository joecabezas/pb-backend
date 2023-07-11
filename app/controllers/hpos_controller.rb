class HposController < ApplicationController
  before_action :set_hpo, only: %i[ show update destroy ]

  # GET /hpos
  def index
    @hpos = Hpo.all

    render json: @hpos
  end

  # GET /hpos/1
  def show
    render json: @hpo
  end

  # POST /hpos
  def create
    @hpo = Hpo.new(hpo_params)

    if @hpo.save
      render json: @hpo, status: :created, location: @hpo
    else
      render json: @hpo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hpos/1
  def update
    if @hpo.update(hpo_params)
      render json: @hpo
    else
      render json: @hpo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hpos/1
  def destroy
    @hpo.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hpo
      @hpo = Hpo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hpo_params
      params.require(:hpo).permit(:hpo_id, :term, :frequency_id)
    end
end
