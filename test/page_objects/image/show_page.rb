module Images
  class ShowPage < AePageObjects::Document
    # path :image_path # no
    # path Rails.application.routes.url_helpers.image_path(:id) # no
    # path '/images/980190963'  # worked locally
    # path '/images/\d+'  # no
    # path /images\/\d+/   # no
    path :image

    element :image, locator: '.js-image'
    element :tag, locator: '.js-tag'
  end
end
