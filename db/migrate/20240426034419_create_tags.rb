class CreateTags < ActiveRecord::Migration[7.1]
  def change
    unless table_exists?(:tags) # Verifica si la tabla ya existe
      create_table :tags do |t|
        # Define las columnas de la tabla
        t.string :name
        # Otras columnas...
        t.timestamps
      end
    end
  end
end