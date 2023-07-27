
class AboutController < ApplicationController


  def show
    @about = About.find(params[:id])
  end

  def edit
    @about = About.find(params[:id])
  end

  def update
    @about = About.find(params[:id])

    if @about.update(about_params)
      flash[:success] = "About content has been updated!"
      redirect_to about_path(@about)
    else
      render action: :edit
    end

  end

  private

  def about_params
    params.require(:about).permit(:title, :content, :image)
  end
end
