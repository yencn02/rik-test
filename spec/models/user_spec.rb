describe 'User' do
  before :each do
    @user = User.new
  end

  it 'should create user successfully' do
    @user.username = 'test'
    @user.save
    expect(@user.errors.empty?).to eq(true)
    expect(@user.caesar_cipher).to be_nil
  end

  it 'username is required' do
    @user.message = 'abc'
    @user.save
    expect(@user.errors.empty?).to eq(false)
    expect(@user.errors.full_messages).to eq(["Username can't be blank"])
  end

  it 'should generate caesar_cipher' do
    @user.username = 'abc'
    @user.message = 'abc'
    @user.save
    expect(@user.caesar_cipher).not_to be_nil
  end
end