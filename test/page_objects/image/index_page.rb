module Images
  class IndexPage < AePageObjects::Document
    path '/images'

    collection :images, locator: '.row', item_locator: '.card' do
      element :image, locator: '.img-container'
      element :tags, locator: '.js-tag'
      element :delete_button, locator: '.js-delete'

      def delete!
        delete_button.node.click
        alert = node.base.driver.browser.switch_to.alert
        yield alert if block_given?
        alert.accept
        sleep 5
        stale!
        window.change_to(IndexPage)
      rescue Selenium::WebDriver::Error::NoAlertOpenError
        retry
      end
    end
  end
end
