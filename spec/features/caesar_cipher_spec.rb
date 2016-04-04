require "rails_helper"
describe 'Caesar cipher', :type => :feature  do
  before :each do
    @user = User.create(username: 'testuser')
  end

  it 'should auto genreate caesar cipher', :js => true do
    visit user_path(@user)
    fill_in('message', :with => "this is a test message")
    sleep 2
    expect(page).to have_content(@user.generate_caesar_cipher('this is a test message', 1))
  end
end