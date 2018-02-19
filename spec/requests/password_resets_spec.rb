require 'rails_helper'

RSpec.describe "PasswordResets", type: :request do
  it 'emails user when requesting password reset' do 
    user = create(:user)
    # visit post_login_path(user)
  end
end
