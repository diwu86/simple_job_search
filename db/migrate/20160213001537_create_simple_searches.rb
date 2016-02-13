class CreateSimpleSearches < ActiveRecord::Migration
  def change
    create_table :simple_searches do |t|
      t.string :keywords
      t.string :location

      t.timestamps null: false
    end
  end
end
