# frozen_string_literal: true

class CreateGardens < ActiveRecord::Migration[5.2]
  def change
    create_table :gardens do |t|
      t.string :name
      t.boolean :organic

      t.timestamps
    end
  end
end
