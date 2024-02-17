class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :cart_tickets, dependent: :destroy
  has_many :ticket_orders, dependent: :destroy
  has_many :notifications, dependent: :destroy

  #コメント機能モデルとの関連付け
  has_many :post_comments, dependent: :destroy
  has_many :event_questionnaires_answers

  #フォローをした、されたの関係
  has_many :followers, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followeds, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  #一覧画面で使う
  has_many :following_customers, through: :followers, source: :followed
  has_many :follower_users, through: :followeds, source: :follower

  #バリデーション
   validates :last_name, presence: true
   validates :first_name, presence: true
   validates :last_name_kana, presence: true
   validates :first_name_kana, presence: true
   validates :email, presence: true
   validates :telephone_number, presence: true
   validates :postal_code, presence: true
   validates :address, presence: true


  def customer_status
    if is_deleted == true
      "退会"
    else
      "有効"
    end
  end

  #enum設定
  #enum is_deleted: { 有効: 0, 無効: 1}
  def active_for_authentication?
    super && (is_deleted == false)
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.last_name = "ゲスト"
      customer.first_name ="ゲスト"
      customer.last_name_kana = "ゲスト"
      customer.first_name_kana = "ゲスト"
      customer.telephone_number = "12345678910"
      customer.postal_code = "1234567"
      customer.address = "a県a市△-△-△"
      customer.is_deleted = false
      customer.customer_introduction = "ゲストユーザーです。"
    end
  end

  #プロフィール画像
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  #フォローした時の処理
  def follow(customer_id)
    followers.create(followed_id: customer_id)
  end

  #フォローを外すときの処理
  def unfollow(customer_id)
    followers.find_by(followed_id: customer_id).destroy
  end

  #フォローしているか判定
  def following?(customer)
    following_customers.include?(customer)
  end

  def follower_customers
    follower_users
  end

  #検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @customer = Customer.where("last_name LIKE?", "#{word}")
    elsif search == "forward_match"
      @customer = Customer.where("last_name LIKE?", "#{word}%")
    elsif search == "backward_match"
      @customer = Customer.where("last_name LIKE?", "%#{word}")
    elsif search == "partial_match"
      @customer = Customer.where("last_name LIKE?", "%#{word}%")
    else
      @customer = Customer.all
    end
  end
end