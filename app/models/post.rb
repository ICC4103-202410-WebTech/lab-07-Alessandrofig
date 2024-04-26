class Post < ApplicationRecord
    has_many :post_tags
    has_many :tags, through: :post_tags
    
    belongs_to :parent_post, class_name: "Post", optional: true
    has_many :replies, class_name: "Post", foreign_key: "parent_post_id"
    belongs_to :user
  
    validates :title, presence: { message: "Debe proporcionar un título para el post." }
    validates :content, presence: { message: "El contenido del post no puede estar vacío." }
    validates :user_id, presence: { message: "El usuario asociado al post no puede estar vacío." }
    validates :answers_count, numericality: { greater_than_or_equal_to: 0, message: "La cantidad de respuestas debe ser un número mayor o igual a cero." }
    validates :likes_count, numericality: { greater_than_or_equal_to: 0, message: "La cantidad de likes debe ser un número mayor o igual a cero." }
  
    before_validation :set_default_published_at, on: :create
  
    private
  
    def set_default_published_at
      self.published_at ||= Time.current
    end
  end