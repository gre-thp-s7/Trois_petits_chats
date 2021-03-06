class Item < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
	has_many :card_items
  validates :image_url, :title, :description, :price, presence: { message: "Merci de remplir tous les champs obligatoires!" };
  validates :price, numericality: { greater_than: 0,  message: "Le prix doit être supérieur à 0" };
  validates :description, length: { minimum: 20, message: "La description doit faire au minimum 20 caractères" };
  has_one_attached :item_picture # active storage


 def to_param
    [id, title.parameterize, 'en solde sur notre boutique trois petits chats'.parameterize].join("-")
  end


end
