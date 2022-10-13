# frozen_string_literal: true

require 'test_helper'

class CatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cat = cats(:a_chan)
  end

  test 'should get index' do
    get cats_url
    assert_response :success
  end

  test 'should get new' do
    get new_cat_url
    assert_response :success
  end

  test 'should create cat' do
    assert_difference('Cat.count') do
      post cats_url, params: { cat: { name: @cat.name } }
    end

    assert_redirected_to cats_url
  end

  test 'should get edit' do
    get edit_cat_url(@cat)
    assert_response :success
  end

  test 'should update cat' do
    patch(
      cat_url(@cat),
      params: {
        cat_form: {
          cat_name: @cat.name,
          subjects: @cat.subjects.pluck(:id, :name).map { %i[id name].zip(_1).to_h }
        }
      }
    )

    assert_redirected_to cats_url
  end

  test 'should destroy cat' do
    assert_difference('Cat.count', -1) do
      delete cat_url(@cat)
    end

    assert_redirected_to cats_url
  end
end
