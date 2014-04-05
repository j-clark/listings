class CreateListing < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.text :description
    end
  end
end
