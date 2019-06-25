class ImagesController < ApplicationController
  def new
    @image = Image.order('created_at DESC')
  end

  # @ is instance variable. Rails will pass instance var to view
  def create
    @image = Image.new(params.require(:image).permit(:url, :tag_list))

    if @image.valid?
      flash[:success] = 'Image saved to the database successfully!'
      @image.save
      redirect_to @image
    else
      flash[:danger] = 'Invalid image url'
      redirect_to(action: 'new')
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  def index
    @image = if params[:tag]
               Image.tagged_with(params[:tag]).order 'created_at DESC'
             else
               Image.order('created_at DESC')
             end
  end
end
