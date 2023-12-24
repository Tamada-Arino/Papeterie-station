class CreateInquiries < ActiveRecord::Migration[6.1]
  def change
    create_table :inquiries do |t|
      t.string :name
      t.string :address
      t.text :text

      t.timestamps
    end
  end
end
