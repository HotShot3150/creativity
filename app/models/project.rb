# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  body        :text
#  user_id     :integer
#  category_id :integer
#  slug        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string(255)
#

class Project < ActiveRecord::Base
   attr_accessible :body, :title, :category_id, :image

  belongs_to :user, dependent: :destroy
  belongs_to :category
  has_many :comments, as: :commentable, dependent: :destroy
  mount_uploader :image, ImageUploader
  
  validates :title, :body, :user_id, :category_id, presence: true

  extend FriendlyId
  friendly_id :title, use: :slugged
end
