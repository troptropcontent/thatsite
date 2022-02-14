# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# rubocop:disable Layout/LineLength
HOME_PAGE_DEFAULT_SECTIONS = {
  'banner_title' => 'Votre Site Web',
  'banner_text' => "En quelques questions c'est tout !",
  'what_we_believe_in_bottom' => "Nous souhaiter donner a chaque entreprise la possibilite d'etre visible sur internet en quelques minutes",
  'what_we_believe_in_top' => 'Notre vision',
  'about_title' => 'Qui sommes nous',
  'about_short_description' => "Nous sommes une equipe de passionnés de design et de choses bien faites. Chaque commerce, chaque entreprise a droit a la visibilite qu'il mérite",
  'what_we_do_description' =>
    'Nous avons mis au point une solution qui, se base de vos reponse a une serie de question, construit en direct un site internet. Choisissez parmis nos palettes de couleurs et nos polices libres pour obtenir un site unique et repondez a nos questions, nous nous chargeons du reste.',
  'what_we_do_title' => 'Que faisons nous',
  'cta_title' => "C'est parti",
  'cta_btn' => 'Démarrer le formulaire'
}.freeze
# rubocop:enable Layout/LineLength

unless Site.count.positive?

  color_palette = FactoryBot.create(:color_palette)
  font_pair = FactoryBot.create(:font_pair)
  business = FactoryBot.create(:business)
  site = FactoryBot.create(:site, color_palette: color_palette, font_pair: font_pair, business: business)
  FactoryBot.create(:home, site: site)
  FactoryBot.create(:contact, site: site)
  FactoryBot.create(:about, site: site)
  FactoryBot.create(:team, site: site)

  color_palette = FactoryBot.create(
    :color_palette,
    first: '284b63ff',
    second: 'ffffffff',
    third: 'd9d9d9ff',
    fourth: '3c6e71ff',
    fifth: '353535ff'
  )
  font_pair = FactoryBot.create(
    :font_pair,
    link_tag_href: 'https://fonts.googleapis.com/css2?family=Libre+Baskerville&family=Roboto:wght@300&display=swap',
    primary: 'Libre Baskerville',
    primary_backup: 'serif',
    secondary: 'Roboto',
    secondary_back_up: 'sans-serif'
  )
  business = FactoryBot.create(:business, name: 'my other business')
  site = FactoryBot.create(:site, color_palette: color_palette, font_pair: font_pair, business: business)
  FactoryBot.create(:home, site: site)
  FactoryBot.create(:contact, site: site)
  FactoryBot.create(:about, site: site)
  FactoryBot.create(:team, site: site)

end

Site.all.each do |record|
  home = record.pages.find_by(type: 'Home')
  home.sections.destroy_all
  HOME_PAGE_DEFAULT_SECTIONS.each do |k, v|
    home.sections.find_or_create_by(name: k).update!(content: v)
  end
end
