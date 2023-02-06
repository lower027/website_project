class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|

      t.text :avatar
      t.text :mini_bio
      t.string :location
      t.string :interests
      t.string :employment

      t.timestamps
    end
  end
end
