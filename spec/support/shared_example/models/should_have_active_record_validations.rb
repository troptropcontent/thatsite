# frozen_string_literal: true

RSpec.shared_examples 'it should have presence validation' do |attributes|
  let(:valid_instance) { FactoryBot.create(described_class.model_name.element) }
  attributes.each do |attribute|
    it "on #{attribute}" do
      valid_instance[attribute] = nil
      expect(valid_instance).to be_invalid
    end
  end
end
