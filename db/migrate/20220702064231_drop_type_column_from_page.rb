# frozen_string_literal: true

class DropTypeColumnFromPage < ActiveRecord::Migration[7.0]
  def change
    remove_column :pages, :type
  end
end
