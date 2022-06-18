class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.create(catalog_id: params[:catalog_id])
    redirect_back(fallback_location: root_path)
  end
end
