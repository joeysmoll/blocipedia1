require 'rails_helper'

RSpec.describe Wiki, type: :model do
  let(:wiki) { create(:wiki, title: "New wiki Title", body: "New wiki Body") }
  
  describe "attributes" do
      it "had title and body attributes" do
          expect(wiki).to have_attributes(title: "New wiki title", body: "New wiki Body")
      end
  end
end
