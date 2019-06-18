class ImagesController < ApplicationController
  def new
    @image = Image.order('created_at DESC')
  end

  # @ is instance variable. Rails will pass instance var to view
  def create
    @image = Image.new(params.require(:image).permit(:url, :tag_list))

    if check_url(@image.url)
      flash[:success] = 'Image saved to the database successfully!'
      @image.save
      redirect_to @image
    else
      flash[:danger] = 'Invalid image url'
      redirect_to(action: 'new')
    end
  end

  # Method which checks if urlvalue is a valid Http Image URL
  def check_url(urlvalue) # rubocop:disable Metrics/MethodLength
    url = URI.parse(urlvalue)
    Net::HTTP.start(url.host, url.port, use_ssl: true) do |http|
      response = http.head(url.path)
      case response
      when Net::HTTPSuccess, Net::HTTPRedirection
        case response.content_type
        when 'image/png', 'image/gif', 'image/jpeg'
          return true
        else
          return false
        end
      else
        return false
      end
    end
  rescue StandardError
    false
  end

  def show
    @image = Image.find(params[:id])
  end

  def index
    @image = Image.order('created_at DESC')
  end
end
