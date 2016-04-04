class User < ActiveRecord::Base

  acts_as_url :username, :url_attribute => :slug, :sync_url => true
  validates :username, :presence => true

  before_save :update_caesar_cipher

  def to_param
    slug
  end

  def generate_caesar_cipher(string, shift = 1)
    alphabet  = Array('a'..'z')
    shift = shift.to_i
    non_caps  = Hash[alphabet.zip(alphabet.rotate(shift))]
    
    alphabet = Array('A'..'Z')
    caps     = Hash[alphabet.zip(alphabet.rotate(shift))]
    
    encrypter = non_caps.merge(caps)
    
    string.chars.map { |c| encrypter.fetch(c, c) }.join()
  end

  private
    def update_caesar_cipher
      if self.message.present?
        self.caesar_cipher = self.generate_caesar_cipher(self.message, self.shift)
      end
    end
end