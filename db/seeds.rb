# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

color_palette = FactoryBot.create(:color_palette)
font_pair = FactoryBot.create(:font_pair)
business = FactoryBot.create(:business)
site = FactoryBot.create(:site, color_palette: color_palette, font_pair: font_pair, business: business)
contact = FactoryBot.create(:contact, site: site)
home = FactoryBot.create(:home, site: site)
about = FactoryBot.create(:about, site: site)

color_palette = FactoryBot.create(
    :color_palette,
    first: "e63946",
    second: "f1faee",
    third: "a8dadc",
    fourth: "457b9d",
    fifth: "1d3557"
)
font_pair = FactoryBot.create(
    :font_pair,
    link_tag_href: "https://fonts.googleapis.com/css2?family=Libre+Baskerville&family=Roboto:wght@300&display=swap",
    primary: "Libre Baskerville",
    primary_backup: "serif",
    secondary: "Roboto",
    secondary_back_up: "sans-serif",
)
business = FactoryBot.create(:business, name: "my other business")
site = FactoryBot.create(:site, color_palette: color_palette, font_pair: font_pair, business: business)
contact = FactoryBot.create(:contact, site: site)
home = FactoryBot.create(:home, site: site)
about = FactoryBot.create(:about, site: site)
