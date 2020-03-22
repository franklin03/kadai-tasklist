class CreateUtasks < ActiveRecord::Migration[5.2]
  def change
    create_table :utasks do |t|
      t.string :content
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
