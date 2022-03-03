# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ContentBuilder do
  describe '#call' do
    context 'Home' do
        let(:site) {FactoryBot.create(:site)}
        let(:page) {FactoryBot.create(:home, site: site)}
        context "when the page have no sections" do
            let(:expected) {
                {
                    "what_we_believe_in"=>"Notre vision",
                    "what_we_do"=>"Que faisons nous ?", 
                    "who_we_are"=>"Qui sommes nous ?", 
                    "know_more"=>"En savoir plus",
                    "let_s_go"=>"C'est parti", 
                    "cta"=>"Contactez-nous", 
                    "banner_title"=>nil, 
                    "banner_text"=>nil, 
                    "what_we_believe_in_text"=>nil, 
                    "who_we_are_text"=>nil, 
                    "what_we_do_text"=>nil
                }
            }
            it "returns the default content with nil values" do
                expect(described_class.new(page).call).to eq(expected)
            end
        end
        context "when there is page sections" do
            context "default section" do
                let!(:default_section) {FactoryBot.create(:section, page: page, name: "banner_title", content: "Testez votre site")}
                let(:expected) {
                {
                    "what_we_believe_in"=>"Notre vision",
                    "what_we_do"=>"Que faisons nous ?", 
                    "who_we_are"=>"Qui sommes nous ?", 
                    "know_more"=>"En savoir plus",
                    "let_s_go"=>"C'est parti", 
                    "cta"=>"Contactez-nous", 
                    "banner_title"=>"Testez votre site", 
                    "banner_text"=>nil, 
                    "what_we_believe_in_text"=>nil, 
                    "who_we_are_text"=>nil, 
                    "what_we_do_text"=>nil
                }
                }
                it "replaces the nil value by the section content" do
                    expect(described_class.new(page).call).to eq(expected)
                end
            end

            context "static section" do
                let!(:static_section) {FactoryBot.create(:section, page: page, name: "cta", content: "Remplir le formulaire")}
                let(:expected) {
                {
                    "what_we_believe_in"=>"Notre vision",
                    "what_we_do"=>"Que faisons nous ?", 
                    "who_we_are"=>"Qui sommes nous ?", 
                    "know_more"=>"En savoir plus",
                    "let_s_go"=>"C'est parti", 
                    "cta"=>"Remplir le formulaire", 
                    "banner_title"=>nil, 
                    "banner_text"=>nil, 
                    "what_we_believe_in_text"=>nil, 
                    "who_we_are_text"=>nil, 
                    "what_we_do_text"=>nil
                }
                }
                it "overwrite the static i18n content with the custom section content" do
                    expect(described_class.new(page).call).to eq(expected)
                end
            end

            context "custom section" do
                let!(:custom_section) {FactoryBot.create(:section, page: page, name: "custom_section", content: "special stuff")}
                let(:expected) {
                {
                    "what_we_believe_in"=>"Notre vision",
                    "what_we_do"=>"Que faisons nous ?", 
                    "who_we_are"=>"Qui sommes nous ?", 
                    "know_more"=>"En savoir plus",
                    "let_s_go"=>"C'est parti", 
                    "cta"=>"Contactez-nous", 
                    "banner_title"=>nil, 
                    "banner_text"=>nil, 
                    "what_we_believe_in_text"=>nil, 
                    "who_we_are_text"=>nil, 
                    "what_we_do_text"=>nil,
                    "custom_section" => "special stuff"
                }
                }
                it "add a new section to the content" do
                    expect(described_class.new(page).call).to eq(expected)
                end
            end
        end
    end
  end
end
