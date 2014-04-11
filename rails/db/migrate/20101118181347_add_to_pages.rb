class AddToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :title, :string
    add_column :pages, :keywords, :string
    add_column :pages, :description, :text
  end

  def self.down
    remove_column :pages, :title
    remove_column :pages, :keywords
    remove_column :pages, :description
  end
end
