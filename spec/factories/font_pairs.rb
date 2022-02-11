FactoryBot.define do
  factory :font_pair do
    link_tag_href { "https://fonts.googleapis.com/css2?family=Commissioner:wght@300&family=Fraunces&display=swap" }
    primary { "Fraunces" }
    primary_backup { "serif" }
    secondary { "Commissioner" }
    secondary_back_up { "sans-serif" }
  end
end
