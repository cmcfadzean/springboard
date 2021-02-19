class VaultsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_vault, only: [:show, :edit, :update, :destroy]

  # GET /vaults
  # GET /vaults.json
  def index
    @vaults = current_user.vaults
  end

  # GET /vaults/1
  # GET /vaults/1.json
  def show
    @vaults = current_user.vaults
  end

  # GET /vaults/new
  def new
    @vaults = current_user.vaults
    @vault = current_user.vaults.build
  end

  # GET /vaults/1/edit
  def edit
    @vaults = current_user.vaults
  end

  # POST /vaults
  # POST /vaults.json
  def create
    @vault = current_user.vaults.build(vault_params)

    respond_to do |format|
      if @vault.save
        format.html { redirect_to @vault, notice: 'Vault was successfully created.' }
        format.json { render :show, status: :created, location: @vault }
      else
        format.html { render :new }
        format.json { render json: @vault.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vaults/1
  # PATCH/PUT /vaults/1.json
  def update
    respond_to do |format|
      if @vault.update(vault_params)
        format.html { redirect_to @vault, notice: 'Vault was successfully updated.' }
        format.json { render :show, status: :ok, location: @vault }
      else
        format.html { render :edit }
        format.json { render json: @vault.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vaults/1
  # DELETE /vaults/1.json
  def destroy
    @vault.destroy
    respond_to do |format|
      format.html { redirect_to vaults_url, notice: 'Vault was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vault
      @vault = Vault.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vault_params
      params.require(:vault).permit(:name)
    end
end
