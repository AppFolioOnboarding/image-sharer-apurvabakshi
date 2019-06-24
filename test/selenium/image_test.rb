require '/Users/apurva.bakshi/Documents/Assignments/image-sharer-apurvabakshi/test/test_helper.rb'

class ImageTest < ActionDispatch::IntegrationTest

  def test_add_image_test
    # require 'pry'; binding.pry
  new_page = Images::NewPage.visit
  image = new_page.img
  image.url.set('https://static.toiimg.com/photo/msid-67868104/67868104.jpg?1368689')
  image.tag.set('red, rose, flower')
  show_page = new_page.submit!

  assert_equal 'red, rose, flower', show_page.tag.text
  end

  def test_delete_image_test
    Image.create!(
      url: 'https://static.toiimg.com/photo/msid-67868104/67868104.jpg?1368689',
      tag_list: 'red, rose, flower'
    )

    index_page = Images::IndexPage.visit
    index_page2 = index_page.images.first.delete! do |alert|
      assert_equal 'Are you sure you want to delete the Image?',
                   alert.text
    end

    assert_equal 0, index_page2.images.size
  end
end
