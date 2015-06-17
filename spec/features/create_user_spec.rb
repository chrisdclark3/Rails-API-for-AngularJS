require 'rails_helper'

RSpec.describe 'creating user' do

  before do
    visit '/users/new'
  end

  it 'creates a new user and renders JSON output' do
    fill_in 'First Name', with: 'Stephen'
    fill_in 'Last Name', with: 'Curry'
    fill_in 'Password', with: 'password'
    click_button 'Register'

    expect(current_path).to eq('/users')
    expect(page).to have_text('Stephen')
  end

end