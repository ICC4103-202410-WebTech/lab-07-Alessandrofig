class User < ApplicationRecord
    has_many :posts
    # Validations
    validates :name, presence: { message: "El nombre no puede estar en blanco." }
    validates :email, presence: { message: "El correo electrónico no puede estar en blanco." }, uniqueness: { message: "El correo electrónico ya está en uso." }, format: { with: URI::MailTo::EMAIL_REGEXP, message: "El formato del correo electrónico no es válido." }
    validates :password, presence: { message: "La contraseña no puede estar en blanco." }, length: { minimum: 6, message: "La contraseña debe tener al menos 6 caracteres." }
  
    # Callbacks
    # Aquí puedes agregar cualquier callback que necesites, por ejemplo:
    # after_create :send_welcome_email
  end