class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries do |t|
      t.integer :kind, null: false
      t.string :name, null: false
      t.string :email, null: false
      t.string :content, null: false

      t.timestamps
    end
  end
end
