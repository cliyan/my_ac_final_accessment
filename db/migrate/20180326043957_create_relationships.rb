class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships do |t|
      t.references :follower, references: :users
      t.references :following, references: :users
      t.timestamps
    end
  end
end
