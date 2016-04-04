class User < ActiveRecord::Base

  acts_as_url :username, :url_attribute => :slug, :sync_url => true
  
  def to_param
    slug
  end

end