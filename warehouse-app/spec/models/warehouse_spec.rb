require 'rails_helper'

RSpec.describe Warehouse, type: :model do
    describe '#valid?' do
        it 'false when name is empty' do
            # Arrange
            warehouse = Warehouse.new(name: '', code: 'RIO', adress: 'Endereço', cep: '25000-000', city: 'Rio', area: 1000,
                                        description: 'Alguma descrição')

            # Act
            result = warehouse.valid?

            # Assert
            expect(result).to eq false
        end
        
        it 'false when code is empty' do
            # Arrange
            warehouse = Warehouse.new(name: 'Rio', code: '', adress: 'Endereço', cep: '25000-000', city: 'Rio', area: 1000,
                                        description: 'Alguma descrição')

            # Act
            result = warehouse.valid?

            # Assert
            expect(result).to eq false
        end

        it 'false when code is already in use' do
            # Arrange
            first_warehouse = Warehouse.create(name: 'Rio', code: 'Rio', adress: 'Endereço',
                                             cep: '25000-000', city: 'Rio', area: 1000,
                                             description: 'Alguma descrição')

            second_warehouse = Warehouse.new(name: 'Niteroi', code: 'Rio', adress: 'Avenida',
                                             cep: '35000-000', city: 'Niteroi', area: 2000,
                                             description: 'Outra descrição')

            # Act
            result = second_warehouse.valid?

            # Assert
            expect(result).to eq false
        end
        
        it 'false when adress is empty' do
            # Arrange
            warehouse = Warehouse.new(name: 'Rio', code: 'Rio', adress: '', cep: '25000-000', city: 'Rio', area: 1000,
                                        description: 'Alguma descrição')

            # Act
            result = warehouse.valid?

            # Assert
            expect(result).to eq false
        end
        
        it 'false when cep is empty' do
            # Arrange
            warehouse = Warehouse.new(name: 'Rio', code: 'Rio', adress: 'Endereço', cep: '', city: 'Rio', area: 1000,
                                        description: 'Alguma descrição')

            # Act
            result = warehouse.valid?

            # Assert
            expect(result).to eq false
        end
        
        it 'false when city is empty' do
            # Arrange
            warehouse = Warehouse.new(name: 'Rio', code: 'Rio', adress: 'Endereço', cep: '25000-000', city: '', area: 1000,
                                        description: 'Alguma descrição')

            # Act
            result = warehouse.valid?

            # Assert
            expect(result).to eq false
        end
         
        it 'false when area is empty' do
            # Arrange
            warehouse = Warehouse.new(name: 'Rio', code: 'Rio', adress: 'Endereço', cep: '25000-000', city: 'Rio', area: '',
                                        description: 'Alguma descrição')

            # Act
            result = warehouse.valid?

            # Assert
            expect(result).to eq false
        end
         
        it 'false when description is empty' do
            # Arrange
            warehouse = Warehouse.new(name: 'Rio', code: 'Rio', adress: 'Endereço', cep: '25000-000', city: 'Rio', area: 1000,
                                        description: '')

            # Act
            result = warehouse.valid?

            # Assert
            expect(result).to eq false
        end
    end
end
