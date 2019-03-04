class Item < ApplicationRecord
  validates :image_url, :title, :description, :price, presence:true, message: "Merci de remplir tous les champs obligatoires"
  validates :price, numericality: { greater_than: 0 }, message: "Le prix doit être supérieur à 0"
  validates :description, length: { minimum: 40 }, message: "La description doit faire au minimum 40 caractères"
end