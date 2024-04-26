class Tag < ApplicationRecord
    has_many :post_tags
    has_many :posts, through: :post_tags
    
    validates :name, presence: { message: "El nombre de la etiqueta no puede estar en blanco." }, uniqueness: { message: "La etiqueta ya existe, elige otro nombre." }
  end