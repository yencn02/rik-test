require "rails_helper"
describe 'Create user' do
  it 'should create user successfully' do
    visit root_path
    fill_in('user_username', :with => 'test')
    click_button 'Create'
    user = User.first
    expect(user).not_to be_nil
    expect(page.current_path).to eq(user_path(user))
  end
end