class DisordersController < ApplicationController
  before_action :set_disorder, only: %i[show update destroy]

  # GET /disorders
  def index
    @disorders = Disorder.all

    render json: @disorders
  end

  # GET /disorders/1
  def show
    render json: @disorder
  end

  # POST /disorders
  def create
    @disorder = Disorder.new(disorder_params)

    if @disorder.save
      render json: @disorder, status: :created, location: @disorder
    else
      render json: @disorder.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /disorders/1
  def update
    if @disorder.update(disorder_params)
      render json: @disorder
    else
      render json: @disorder.errors, status: :unprocessable_entity
    end
  end

  # DELETE /disorders/1
  def destroy
    @disorder.destroy
  end

  def with_hpo_ids
    disorders = Disorder.with_hpo_ids(with_hpo_ids_params)
    render json: disorders
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_disorder
    @disorder = Disorder.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def disorder_params
    params
      .require(:disorder)
      .permit(
        :orpha_code,
        :expert_link,
        :name,
        :type_id,
        :group_id
      )
  end

  def with_hpo_ids_params
    params.require(:_json)
  end
end
