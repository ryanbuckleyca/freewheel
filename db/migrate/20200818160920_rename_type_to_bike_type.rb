class RenameTypeToBikeType < ActiveRecord::Migration[6.0]
  def change
    rename_column :bikes, :type, :bike_type
  end
end
