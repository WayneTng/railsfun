class AddCountryToProduct < ActiveRecord::Migration
  def change
    add_column :products, :countries, :string
  end
end
