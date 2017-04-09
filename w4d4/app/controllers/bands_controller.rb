class BandsController < ApplicationController
  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to bands_url
    else
      flash[:errors] = @band.errors.full_messages
      redirect_to new_band_url
    end
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end
end
