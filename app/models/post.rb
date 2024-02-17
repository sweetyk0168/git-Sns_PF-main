class Post < ApplicationRecord
  belongs_to :customer
  belongs_to :event, optional: true
  belongs_to :event_questionnaires_question, optional: true
  # belongs_to :event_repo, optional: true
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_one_attached :image
  has_one :notification, as: :subject, dependent: :destroy


  validates :title, presence: true
  validates :body, presence: true, allow_blank: true
  # attr_accessor :event_repo_ids
  # attr_accessor :event_id

  # before_save :set_default_event_id

  # def set_default_event_id
  #   self.event_id ||= Event.first.id
  # end

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'sample-author.jpg', content_type: 'image/jpeg')
    end
      image.variant(resize_to_limit: [width, height]).processed
  end

  def favorited?(customer)
    favorites.exists?(customer_id: customer.id)
  end

  #検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @post = Post.where("title LIKE?", "#{word}")
    elsif search == "forward_match"
      @post = Post.where("title LIKE?", "#{word}%")
    elsif search == 'backward_match'
      @post = Post.where("title LIKE?", "%#{word}")
    elsif search == 'partial_match'
      @post = Post.where("title LIKE?", "%#{word}%")
    else
      @post = Post.all
    end
  end
end
