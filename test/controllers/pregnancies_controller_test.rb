require 'test_helper'

class PregnanciesControllerTest < ActionController::TestCase
  def setup
    @user = create :user
    sign_in @user
    @patient = create :patient,
                      name: 'Susie Everyteen', 
                      primary_phone: '123-456-7890', 
                      secondary_phone: '333-444-5555'
    @pregnancy = @patient.pregnancies.create(attributes_for :pregnancy)
  end

  it "should get index" do
    get :index
    assert_response :success
  end

  describe 'search method' do
    it 'should return on name, primary phone, and secondary phone' do
      ['Susie Everyteen', '123-456-7890', '333-444-5555'].each do |searcher|
        post :search, search: searcher, format: :js
        assert_response :success
      end
    end
  end
end