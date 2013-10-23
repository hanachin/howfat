class User < ActiveRecord::Base
  validates :name, presence: true

  def create_remember_token
    # TODO: かぶらないよにする
    self.remember_token ||= SecureRandom.urlsafe_base64
    save
    remember_token
  end
end
