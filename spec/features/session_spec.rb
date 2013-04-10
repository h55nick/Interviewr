require 'spec_helper'

describe 'GET /' do
  it 'displays login link' do
    visit root_path
    page.should have_link('Login')
  end
end

describe 'GET /login' do
  it 'displays the login form', :js => true do
    visit root_path
    click_link('Login')
    page.should have_button('Login')
  end
end

describe 'POST /login' do
 it 'logs the user into the system if credentials are correct', :js => true do
    visit root_path
    click_link('Login')
    fill_in('Email', :with => 'bob@gmail.email')
    fill_in('Password', :with => 'a')
    click_button('Login')
    page.should_not have_button('Login')
    page.should_not have_link('Register')
  end
end

