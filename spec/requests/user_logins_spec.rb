require 'rails_helper'

RSpec.describe "UserLogins", type: :request do
  it "validates user and create cookie" do
    user = create(:user)
    visit '/'
    fill_in 'session_email', :with => user.email
    fill_in 'session_password', :with => user.password
    click_button('Logga in')
  end 
end
