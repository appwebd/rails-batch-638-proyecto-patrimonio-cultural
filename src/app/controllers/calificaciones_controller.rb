class CalificacionesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  before_action :set_calificacion, only: %i[destroy edit update]
  before_action :get_calificacion_params, only: %i[update]

  # GET /calificaciones
  def index
    # para mostrar todas las calificaciones del patrimonio dado
    @patrimonio_id = get_patrimonio_id
    @patrimonio = Patrimonio.find(@patrimonio_id)
    @calificaciones = Calificacion.where(patrimonio_id: @patrimonio_id)

    # Para agregar un nuevo usuario en la vista index.
    if user_signed_in?
      @user = current_user
      @calificacion = Calificacion.new
      @calificacion.user = current_user
    end
  end

  # GET /calificaciones/new
  def new
    @user = current_user
    @patrimonio_id = get_patrimonio_id
    @calificacion = Calificacion.new
    @calificacion.patrimonio_id = @patrimonio_id
    authorize @calificacion
  end

  # POST /calificaciones
  def create
    @calificacion = Calificacion.new(get_calificacion_params)
    @calificacion.user = current_user
    @calificacion.fecha = Calificacion.get_date

    if @calificacion.save
      redirect_to calificaciones_path(patrimonio_id: @calificacion.patrimonio_id), notice: 'Se ha creado su reseña exitosamente.'
    else
      render :new
    end
    authorize @calificacion
  end

  # GET /calificacion/1/edit
  def edit

  end

  # PATCH/PUT /calificacion/1
  def update
    if @calificacion.update(get_patrimonio_params)
      redirect_to @calificacion, notice: 'Calificación fue actualizado exitosamente.'
    else
      render :edit
    end
  end

  # DELETE /calificacion/1
  def destroy
    @calificacion.destroy
    redirect_to calificaciones_path(patrimonio_id: @calificacion.patrimonio_id), notice: 'Calificacion fue eliminado exitosamente.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_calificacion
    @user = current_user
    @calificacion = Calificacion.find(params[:id])
    authorize @calificacion
  end

  def get_patrimonio_id
    params[:patrimonio_id]
  end

  # Only allow a list of trusted parameters through.
  def get_calificacion_params
    params.require(:calificacion).permit(:descripcion,
                                         :ranking,
                                         :patrimonio_id
    )
  end
end
