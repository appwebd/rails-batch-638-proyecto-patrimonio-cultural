class PatrimoniosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  before_action :set_patrimonio, only: %i[destroy edit show update]
  before_action :get_patrimonio_params, only: %i[update]

  # GET /patrimonios
  def index
    @patrimonios = Patrimonio.all
  end

  # GET /patrimonios/new
  def new
    @user = current_user
    @patrimonio = Patrimonio.new
    authorize @patrimonio
  end

  # POST /patrimonios
  def create
    @patrimonio = Patrimonio.new(get_patrimonio_params)
    @patrimonio.user = current_user

    # TODO: Falta crear rescue or try para el control de errores.
    #
    @results = Geocoder.search(@patrimonio.ubicacion)
    @markers = @results.map do |pages|
      {
        lat: pages.latitude,
        lng: pages.longitude
      }
    end

    @patrimonio.geo_ref_latitud = @markers[0][:lat]
    @patrimonio.geo_ref_longitud = @markers[0][:lng]

    if @patrimonio.save
      redirect_to @patrimonio, notice: 'Se ha creado Patrimonio exitosamente.'
    else
      render :new
    end
    authorize @patrimonio
  end

  # GET /patrimonios/1
  def show
  end

  # GET /patrimonios/1/edit
  def edit
  end

  # PATCH/PUT /patrimonios/1
  def update
    if @patrimonio.update(get_patrimonio_params)
      redirect_to @patrimonio, notice: 'Patrimonio was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /patrimonios/1
  def destroy
    @patrimonio.destroy
    redirect_to patrimonios_path, notice: 'Patrimonio was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_patrimonio
    @user = current_user
    @patrimonio = Patrimonio.find(params[:id])
    authorize @patrimonio
  end

  # Only allow a list of trusted parameters through.
  def get_patrimonio_params
    params.require(:patrimonio).permit(:titulo,
                                       :descripcion,
                                       :ubicacion,
                                       :telefono,
                                       :email,
                                       :patrimonio_tipo_id,
                                       :photo)
  end
end
