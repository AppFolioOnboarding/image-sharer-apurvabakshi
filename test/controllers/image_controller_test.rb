require 'test_helper'

class ImagesControllerTest < ActionController::TestCase
  def test_index
    Image.create(url: 'https://i.ytimg.com/vi/EvXvgvCgOPs/hqdefault.jpg')
    Image.create(url: 'https://images.unsplash.com/photo-1500382017468-9049fed747ef?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80')

    get :index
    assert response.body.include? 'Welcome'
    assert_select 'img', 2
  end

  def test_new
    get :new
    assert_select 'form'
  end

  def test_create
    assert_difference 'Image.count' do
      post :create, params:
        { image: { url: 'https://i.ytimg.com/vi/EvXvgvCgOPs/hqdefault.jpg', tag_list: 'orange, tree, plane ' } }
    end

    image = Image.last
    assert_equal 'https://i.ytimg.com/vi/EvXvgvCgOPs/hqdefault.jpg', image.url
    assert_equal %w[orange tree plane], image.tag_list
  end

  def test_create__invalid
    assert_no_difference 'Image.count' do
      post :create, params: { image: { url: 'https://asqytcczer.com/vieault.jpg', tag_list: 'a, b, c' } }
    end
  end

  def test_show
    image = Image.create!(url: 'https://i.ytimg.com/vi/EvXvgvCgOPs/hqdefault.jpg')
    get :show, params: { id: image.id }
    assert response.body.include? 'https://i.ytimg.com/vi/EvXvgvCgOPs/hqdefault.jpg'
  end
end
