class Initialization < ActiveRecord::Migration
  def up

    create_table :people do |t|
      t.string :name
      t.string :phone
      t.string :email
    end

    create_table :potlucks do |t|
      t.string :name
      t.datetime :timestamp

    end

    create_table :items do |t|
      t.string :name
      t.integer :potluck_id
      t.integer :person_id
    end

    create_table :tags do |t|
      t.string :name
    end

    create_table :items_tags, :id => false do |t|
      t.integer :item_id
      t.integer :tag_id
    end

  end

  def down
    drop_table :potlucks
    drop_table :items_tags
    drop_table :tags
    drop_table :items
    drop_table :people
  end

end
