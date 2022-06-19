class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.create(catalog_id: params[:catalog_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @catalog = Catalog.find(params[:catalog_id])
    @favotite = current_user.favorites.find_by(catalog_id: @catalog.id)
    @favotite.destroy
    redirect_back(fallback_location: root_path)
  end
end
