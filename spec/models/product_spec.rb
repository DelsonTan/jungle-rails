require 'rails_helper'

RSpec.describe Product, type: :model do
    describe 'Validations' do
        
        testCategory = Category.find_or_create_by! name: 'Test'
        subject { Product.new({
            name:  'Test Product',
            description: 'Only OG hipsters will appreciate this',
            image: '../../db/seed_assets/electronics1.jpg',
            quantity: 20,
            price: 364.49,
            category: testCategory
            })
        }
        
        
        context "should not save the product to the database if" do
            it "the product has no name" do
                subject.name = nil
                expect(subject.valid?).to be(false)
            end
            it "the product has no price" do
                subject.price_cents = nil
                expect(subject.valid?).to be(false)
            end
            it "the product has no quantity" do
                subject.quantity = nil
                expect(subject.valid?).to be(false)
            end
            it "the product has no category" do
                subject.category = nil
                expect(subject.valid?).to be(false)
            end
        end

        it "should save a product with all properties defined" do
            expect(subject.valid?).to be(true)
        end
    end
end