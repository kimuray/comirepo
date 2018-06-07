class User < ApplicationRecord
  def self.find_or_create_from_auth_hash(auth_hash)
    provider = auth_hash[:provider]
    uid = auth_hash[:uid]
    nickname = auth_hash[:info][:nickname]
    avater = auth_hash[:info][:image]
    access_token = auth_hash[:credentials][:token]
    access_token_secret = auth_hash[:credentials][:secret]
    find_or_create_by(provider: provider, uid: uid) do |user|
      user.nickname = nickname
      user.avater = avater
      user.access_token = access_token
      user.access_token_secret = access_token_secret
    end
  end
end
