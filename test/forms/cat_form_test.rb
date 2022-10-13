# frozen_string_literal: true

require 'test_helper'

class CatFormTest < ActiveSupport::TestCase
  test '#save should create Cat and Subject when valid params' do
    params = {
      cat_name: 'Eijirou',
      subjects: [
        { id: subjects(:a_wee_wee).id, name: 'Wee Wee' },
        { id: subjects(:a_poop).id, name: subjects(:a_poop).name },
        { id: nil, name: 'Weight' }
      ]
    }

    assert_difference('cats(:a_chan).subjects.size', 1) do
      assert(CatForm.new(params, cat: cats(:a_chan)).save)
    end
    assert_equal(cats(:a_chan).reload.name, 'Eijirou')
    assert_equal(subjects(:a_wee_wee).reload.name, 'Wee Wee')
  end

  test '#save should return false when invalid params' do
    params = {
      cat_name: '',
      subjects: [
        { id: subjects(:a_poop).id, name: 'Poop' },
        { id: subjects(:a_poop).id },
        { id: nil, name: '' }
      ]
    }

    cat_form = CatForm.new(params, cat: cats(:a_chan))
    assert_difference('cats(:a_chan).subjects.size', 0) do
      assert_not(cat_form.save)
    end
    assert_equal(cat_form.errors.messages, { cat_name: ["can't be blank"], subjects: ["can't be blank"] })
    assert_equal(cats(:a_chan).reload.name, 'A-chan')
    assert_equal(subjects(:a_wee_wee).reload.name, 'Wee Wee')
  end
end
