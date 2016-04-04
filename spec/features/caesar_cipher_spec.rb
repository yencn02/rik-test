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

  it 'when user visits user page for the second time will be able to continue from the last saved state', :js => true do
    @user.update_attributes(message: 'fsdfdsfasdfa')
    visit user_path(@user)
    expect( find(:css, 'textarea.message').value ).to eq(@user.message)
    expect( find(:css, 'input.shift').value ).to eq("1")
    expect(page).to have_content(@user.caesar_cipher)
  end
end