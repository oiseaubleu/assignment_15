class FavoritesController < ApplicationController

  def create
    @fav = current_user.favorites.build(blog_id: params[:blog_id])
    #binding.irb
    respond_to do |format|
      if @fav.save
        flash.now[:notice] = 'お気に入りに登録しました'
        format.js { render :favorite }
      else
        flash.now[:notice] = 'お気に入りの登録に失敗しました'
        format.js { render :favorite }
      end
    end

  end

  def destroy
    #current_user.favorites.find_by(id: params[:id]).destroy
    @fav = current_user.favorites.find_by(id: params[:id])
    @fav.destroy!
    respond_to do |format|
      flash.now[:notice] = 'お気に入りが削除されました'
      format.js { render :favorite }
    end
  end

end
