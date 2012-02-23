class CreateStylesheetsStylesheets < ActiveRecord::Migration

  def up
    create_table :refinery_stylesheets do |t|
      t.string :name
      t.text :content
      t.string :style_type
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-stylesheets"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/stylesheets/stylesheets"})
    end

    drop_table :refinery_stylesheets

  end

end
