class AddPriceandAvailableToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :price, :float
    add_column :products, :available, :boolean
  end
end
