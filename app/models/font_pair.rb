class FontPair < ApplicationRecord
    validates :primary, presence: true, format: { with: /'*'/, message: "font name should be single quoted"}
    validates :secondary, presence: true, format: { with: /'*'/, message: "font name should be single quoted"}
end
