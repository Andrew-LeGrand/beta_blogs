class CreateBlogs < ActiveRecord::Migration[7.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :content
      t.string :image_path, default: "https://upload.wikimedia.org/wikipedia/commons/b/b9/No_Cover.jpg"

      t.timestamps
    end
  end
end
