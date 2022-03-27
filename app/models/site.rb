class Site < ApplicationRecord
  belongs_to :color_palette, optional: true
  belongs_to :font_pair, optional: true
  has_many :sites_user
  has_many :users, through: :sites_user
  has_one :business
  has_many :pages

  validates :name, uniqueness: true
  validates :name, format: { with: /\A[a-z-]+\z/ }

  def to_param 
    name
  end
end
