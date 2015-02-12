class Identity
  include Mongoid::Document

  belongs_to :user
  
  validates_presence_of :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider

  field :provider, type: String
  field :accesstoken, type: String
  field :refreshtoken, type: String
  field :uid, type: String
  field :name, type: String
  field :email, type: String
  field :nickname, type: String
  field :image, type: String
  field :phone, type: String
  field :urls, type: String
  
  index({ uid: 1}, {drop_dups: false, background: true})

  # def self.serialize_from_session(key, salt)
  #   record = to_adapter.get(key[0]["$oid"])
  #   record if record && record.authenticatable_salt == salt
  # end

  # def self.find_for_oauth(auth)
  #   identity = create(uid: auth.uid, provider: auth.provider) if identity.nil?
  #   identity = find_by(provider: auth.provider, uid: auth.uid)
  #   user.identity.accesstoken = auth.credentials.token
  #   user.identity.refreshtoken = auth.credentials.refresh_token
  #   user.uidentity.name = auth.info.name
  #   user.identity.email = auth.info.email
  #   user.identity.nickname = auth.info.nickname
  #   user.identity.image = auth.info.image
  #   user.identity.phone = auth.info.phone
  #   user.identity.urls = (auth.info.urls || "").to_json
  #   user.identity.save
  #   user.identity
  # end




end
