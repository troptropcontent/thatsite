# frozen_string_literal: true

RSpec.shared_examples 'it should have database columns' do |expected_columns|
  it 'should have the database columns' do
    expect(subject.attributes.keys).to contain_exactly(*expected_columns)
  end
end
