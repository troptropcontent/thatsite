class FontPair < ApplicationRecord
    def self.all_names
        pluck(:primary).push(*pluck(:secondary)).uniq
    end
end
