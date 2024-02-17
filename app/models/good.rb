class Good < ApplicationRecord
  belongs_to :event
  #has_many :posts, through: :post_events, dependent: :destroy
  has_one_attached :image

  validates :name, presence: true
  validates :introduction, presence: true
  validates :post_status, inclusion:[true, false]
  # validates :image, presence: true
  validates :price, presence:true, numericality: {only_integer: true }

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'sample-author.jpg', content_type: 'image/jpeg')
    end
      image.variant(resize_to_limit: [width, height]).processed
  end
end
