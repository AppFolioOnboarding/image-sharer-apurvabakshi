require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  test 'valid image' do
    image = Image.new(url: 'https://sample-videos.com/img/Sample-jpg-image-500kb.jpg')
    assert_predicate image, :valid?
  end

  test 'invalid url' do
    image = Image.new(url: 'https://asd.com/vi/deault.jpg')
    assert_not_predicate image, :valid?
    assert image.errors.added?(:url, 'url is not valid')
  end

  test 'blank url' do
    image = Image.new(url: '')
    assert_not_predicate image, :valid?
    assert image.errors.added?(:url, :blank)
  end
end
