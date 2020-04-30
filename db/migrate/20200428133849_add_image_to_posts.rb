class AddImageToPosts < ActiveRecord::Migration[6.0]
  def change
    change_table :posts do |t|
      t.string :image
      t.rename :text, :description
    end
  end
end
