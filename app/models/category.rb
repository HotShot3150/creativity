# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  slug        :string(255)
#

class Category < ActiveRecord::Base
  attr_accessible :description, :title

  belongs_to :user
  has_many :posts, dependent: :destroy
  

  validates :title, :description, presence: true

  extend FriendlyId
  friendly_id :title, use: :slugged
end
