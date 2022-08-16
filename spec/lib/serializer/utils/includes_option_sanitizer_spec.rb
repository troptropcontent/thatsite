# frozen_string_literal: true

require 'rails_helper'

module Serializer::Utils
  RSpec.describe IncludesOptionSanitizer do
    describe '#call' do
      let(:includes_option) { 'foo' }
      context 'when includes_option is an symbol or a string' do
        it 'returns a hash with a nill value' do
          expect(described_class.new(includes_option).call).to eq({ foo: nil })
        end
      end
      context 'when includes_option is an hash' do
        context 'with no nested hash' do
          let(:includes_option) { { foo: :bar } }
          it 'works' do
            expect(described_class.new(includes_option).call).to eq({ foo: :bar })
          end
        end
        context 'with nested hash' do
          let(:includes_option) { { foo: { bar: :baz } } }
          it 'works and passes the nested hash untouched along' do
            expect(described_class.new(includes_option).call).to eq({ foo: { bar: :baz } })
          end
        end
      end
      context 'when includes_option is an array' do
        describe 'an array with no subarray' do
          let(:includes_option) { [:foo, { bar: :baz }] }
          it 'works' do
            expect(described_class.new(includes_option).call).to eq({ foo: nil, bar: :baz })
          end
        end

        describe 'an array with subarrays' do
          let(:includes_option) { [:foo, [bar: :baz, boo: :bee]] }
          it 'works' do
            expect(described_class.new(includes_option).call).to eq({ foo: nil, bar: :baz, boo: :bee })
          end
        end
      end
    end
  end
end
