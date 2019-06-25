# require 'routes'

module Images
  class NewPage < AePageObjects::Document
    path Rails.application.routes.url_helpers.new_image_path
    element :submit_button, locator: '.js-submit'
    form_for :img do
      element :url, locator: '.js-image-url'
      element :tag, locator: '.js-image-tag'
    end

    def submit!
      submit_button.node.click
      stale!
      window.change_to(ShowPage)
    end
  end
end
