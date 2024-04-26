
class CreatePostTags < ActiveRecord::Migration[7.1]
  def change
    unless table_exists?(:post_tags) # Verifica si la tabla post_tags ya existe
      create_table :post_tags do |t|
        t.references :post, foreign_key: true
        t.references :tag, foreign_key: true


        t.timestamps
      end
    end
  end
end
