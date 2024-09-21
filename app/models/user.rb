class User < ApplicationRecord
 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         mount_uploader :image, ImageUploader


         has_many :tweets, dependent: :destroy
         validates :name, presence: true #追記
         validates :profile, length: { maximum: 200 } #追記

         has_many :likes, dependent: :destroy
  has_many :liked_tweets, through: :likes, source: :tweet
  def already_liked?(tweet)
    self.likes.exists?(tweet_id: tweet.id)
  end

  has_many :comments, dependent: :destroy

  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :rooms, dependent: :destroy

  has_and_belongs_to_many :gengos
  #has_many :user_gengos, dependent: :destroy
  #has_many :gengos, through: :user_gengos


  LANGUAGES = [['English', 'English'], ['Chinese', 'Chinese'], ['Japanese','Japanese'], ['Korean','Korean']].freeze
  LANGUAGES2 = [['English', 'English'], ['Chinese', 'Chinese'], ['Japanese','Japanese'], ['Korean','Korean']].freeze

  enum gender: {other: 0 , male: 1, female: 2}
  #ユーザー名による絞り込み
scope :get_by_name, ->(name) {
  where("name like ?", "%#{name}%")
  }
  #性別による絞り込み
  scope :get_by_gender, ->(gender) {
  where(gender: gender)
  }
  scope :get_by_manabitaii, ->(manabitaii) {
  where(manabitaii: manabitaii)
}

scope :get_by_osierareru, ->(osierareru) {
  where(osierareru: osierareru)
}
end