class LinksController < ApplicationController
	before_action :set_vault
	before_action :set_link, except: [:create]

	def create
		@link = @vault.links.create(link_params)
		redirect_to @vault, notice: "Link created"
	end

	def destroy
		if @link.destroy
			flash[:success] = "Link was deleted."
		else
			flash[:error] = "Link could not be deleted."
		end
		redirect_to @vault
	end

	private

	def set_vault
		@vault = Vault.find(params[:vault_id])
	end

	def set_link
		@link = @vault.links.find(params[:id])
	end

	def link_params
		params[:link].permit(:link)
	end

end
