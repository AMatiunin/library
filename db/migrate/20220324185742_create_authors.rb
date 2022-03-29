class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name, presence: true, length: { minimum: 2, maximum: 32 }
      t.date :birth, presence: true, format: { with: /\d{4}-\d{2}-\d{2}/, :message => "should be in format: yyyy-mm-dd" }
      t.date :death
      t.string :nationality

      t.timestamps
    end
  end
end
