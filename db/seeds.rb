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
  'banner_title' => 'Votre site web',
  'banner_text' => "En quelques questions c'est tout !",
  'what_we_believe_in_text' => "Nous souhaitons donner à chaque entreprise la possibilité d'etre visible sur internet en quelques minutes",
  'who_we_are_text' => "Nous sommes une equipe de passionnés de design et de choses bien faites. Chaque commerce, chaque entreprise à droit à la visibilite qu'il mérite",
  'what_we_do_text' =>
    'Nous avons mis au point une solution qui, se base de vos réponses à une serie de question, construit en direct un site internet. Choisissez parmis nos palettes de couleurs et nos polices libres pour obtenir un site unique et repondez a nos questions, nous nous chargeons du reste.',
  'cta' => 'Démarrer le formulaire'
}.freeze

CONTACT_PAGE_DEFAULT_SECTIONS = {
  'banner_title' => 'Contactez nous'
}.freeze
# rubocop:enable Layout/LineLength

unless Site.count.positive?

  color_palette = ColorPalette.create(
    first: "e63946",
    second: "f1faee",
    third: "a8dadc",
    fourth: "457b9d",
    fifth: "1d3557",
  )
  font_pair = FontPair.create(
    link_tag_href: "https://fonts.googleapis.com/css2?family=Commissioner:wght@300&family=Fraunces&display=swap",
    primary: "Fraunces",
    primary_backup: "serif",
    secondary: "Commissioner",
    secondary_back_up: "sans-serif",
  )
  business = Business.create(name: "thasite")
  office = Office.create(
    business: business,
    address_full: '38 rue ordener',
    address_zipcode: '75018',
    addresse_city: 'Paris',
    name: 'Paris 18',
    phone: '0607053868'
  )

  office.business_hours.create(weekday: :monday, opens_at: Time.current.change(hour: 9, minute: 0),
                               closes_at: Time.current.change(hour: 19, minute: 0))
  office.business_hours.create(weekday: :tuesday, opens_at: Time.current.change(hour: 9, minute: 0),
                               closes_at: Time.current.change(hour: 19, minute: 0))
  office.business_hours.create(weekday: :wednesday, opens_at: Time.current.change(hour: 9, minute: 0),
                               closes_at: Time.current.change(hour: 19, minute: 0))
  office.business_hours.create(weekday: :thursday, opens_at: Time.current.change(hour: 9, minute: 0),
                               closes_at: Time.current.change(hour: 19, minute: 0))
  office.business_hours.create(weekday: :friday, opens_at: Time.current.change(hour: 9, minute: 0),
                               closes_at: Time.current.change(hour: 19, minute: 0))
  office.business_hours.create(weekday: :saturday, opens_at: Time.current.change(hour: 9, minute: 0),
                               closes_at: Time.current.change(hour: 14, minute: 0))

  site = Site.create(
    color_palette: color_palette, 
    font_pair: font_pair, 
    business: business,
    name: 'thatsite'
  )
  Home.create(site: site)
  Contact.create(site: site)
  About.create(site: site)
  Team.create(site: site)

  color_palette = ColorPalette.create(
    first: '284b63ff',
    second: 'ffffffff',
    third: 'd9d9d9ff',
    fourth: '3c6e71ff',
    fifth: '353535ff'
  )
  font_pair = FontPair.create(
    link_tag_href: 'https://fonts.googleapis.com/css2?family=Libre+Baskerville&family=Roboto:wght@300&display=swap',
    primary: 'Libre Baskerville',
    primary_backup: 'serif',
    secondary: 'Roboto',
    secondary_back_up: 'sans-serif'
  )
  business = Business.create(name: 'my other business')
  office = Office.create(
    business: business,
    address_full: '38 rue ordener',
    address_zipcode: '75018',
    addresse_city: 'Paris',
    name: 'Paris 18',
    phone: '0607053868'
  )

  office.business_hours.create(weekday: :monday, opens_at: Time.current.change(hour: 9, minute: 0),
                               closes_at: Time.current.change(hour: 19, minute: 0))
  office.business_hours.create(weekday: :tuesday, opens_at: Time.current.change(hour: 9, minute: 0),
                               closes_at: Time.current.change(hour: 19, minute: 0))
  office.business_hours.create(weekday: :wednesday, opens_at: Time.current.change(hour: 9, minute: 0),
                               closes_at: Time.current.change(hour: 19, minute: 0))
  office.business_hours.create(weekday: :thursday, opens_at: Time.current.change(hour: 9, minute: 0),
                               closes_at: Time.current.change(hour: 19, minute: 0))
  office.business_hours.create(weekday: :friday, opens_at: Time.current.change(hour: 9, minute: 0),
                               closes_at: Time.current.change(hour: 19, minute: 0))
  office.business_hours.create(weekday: :saturday, opens_at: Time.current.change(hour: 9, minute: 0),
                               closes_at: Time.current.change(hour: 14, minute: 0))
  site = Site.create(
    color_palette: color_palette,
    font_pair: font_pair,
    business: business,
    name: 'template2'
  )
  Home.create(site: site)
  Contact.create(site: site)
  About.create(site: site)
  Team.create(site: site)

end

Site.all.each do |record|
  home = record.pages.find_by(type: 'Home')
  home.sections.destroy_all
  HOME_PAGE_DEFAULT_SECTIONS.each do |k, v|
    home.sections.find_or_create_by(name: k).update!(content: v)
  end
end
