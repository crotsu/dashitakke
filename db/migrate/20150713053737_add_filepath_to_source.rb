class AddFilepathToSource < ActiveRecord::Migration
  def change
    add_column :sources, :filepath, :string
  end
end
