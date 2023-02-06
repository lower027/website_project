class RemoveInterestFromProfile < ActiveRecord::Migration[7.0]
  def change
    remove_column :profiles, :interest, :string
  end
end
