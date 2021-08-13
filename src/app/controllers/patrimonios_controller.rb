class PatrimoniosController < ApplicationController
  before_action :set_patrimonio, only: [:show, :edit, :update, :destroy]

  # GET /patrimonios
  def index
    @patrimonios = policy_scope(Patrimonio)
  end

  # GET /patrimonios/1
  def show
  end

  # GET /patrimonios/new
  def new
    @patrimonio = Patrimonio.new
    authorize @patrimonio
  end

  # GET /patrimonios/1/edit
  def edit
  end

  # POST /patrimonios
  def create
    @patrimonio = Patrimonio.new(patrimonio_params)
    @patrimonio.user = current_user
    authorize @patrimonio

    if @patrimonio.save
      redirect_to @patrimonio, notice: 'Patrimonio was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /patrimonios/1
  def update
    if @patrimonio.update(patrimonio_params)
      redirect_to @patrimonio, notice: 'Patrimonio was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /patrimonios/1
  def destroy
    @patrimonio.destroy
    redirect_to patrimonios_url, notice: 'Patrimonio was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patrimonio
      @patrimonio = Patrimonio.find(params[:id])
       authorize @patrimonio
    end

    # Only allow a list of trusted parameters through.
    def patrimonio_params
      params.require(:patrimonio).permit(:name)
    end
end
