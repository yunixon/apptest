class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :title
      t.string :file
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
  end
end
