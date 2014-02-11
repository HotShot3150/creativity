# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  body        :text
#  user_id     :integer
#  category_id :integer
#  slug        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Post < ActiveRecord::Base
  attr_accessible :body, :category_id, :title

  belongs_to :category
  belongs_to :user

  validates :title, :category_id, presence: true

	extend FriendlyId
	friendly_id :title, use: :slugged

end
