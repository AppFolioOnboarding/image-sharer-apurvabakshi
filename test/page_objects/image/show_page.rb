module Images
  class ShowPage < AePageObjects::Document
    # path :image_path
    # path Rails.application.routes.url_helpers.image_path(:id)
    path '/images/980190963'
    # path '/images/\d+'
    # path /images\/\d+/

    element :image, locator: '.js-image'
    element :tag, locator: '.js-tag'
  end
end
