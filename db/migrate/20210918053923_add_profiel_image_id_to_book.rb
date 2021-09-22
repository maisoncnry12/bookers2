class AddProfielImageIdToBook < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :profiel_image_id, :string
  end
end
