require File.dirname(__FILE__) + '/../spec_helper'
 
describe PeopleController do
  render_views
  before do
    @user = Factory.create(:user)
    request.env['warden'] = mock_model(Warden, :authenticate? => @user, :authenticate! => @user, :authenticate => @user)

    sign_in :user, @user   
  end

  it "index should yield search results for substring of person name" do
    Person.should_receive(:search)

    get :index, :q => "Eu"
  end

end
