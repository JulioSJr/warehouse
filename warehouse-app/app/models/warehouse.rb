class Warehouse < ApplicationRecord
    validates :name, :code, :city, :description, :adress, :cep, :area, presence: true
    validates :code, length: { is: 3 }
    validates :code, uniqueness: true
end
