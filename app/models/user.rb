class User < ApplicationRecord
  def self.find_or_create_from_auth_hash(auth_hash)
    provider = auth_hash[:provider]
    uid = auth_hash[:uid]
    nickname = auth_hash[:info][:nickname]
    avater = auth_hash[:info][:image]
    find_or_create_by(provider: provider, uid: uid) do |user|
      user.nickname = nickname
      user.avater = avater
    end
  end
end
