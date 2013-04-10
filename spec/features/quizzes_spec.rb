require 'spec_helper'

describe 'GET /' do
  it 'displays register link' do
    visit root_path
    page.should have_link("Login")
  end
end