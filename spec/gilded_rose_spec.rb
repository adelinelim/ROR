require_relative '../lib/gilded_rose'

describe "#update_quality" do

  describe "with a single item" do
    let(:initial_sell_in) { 5 }
    let(:initial_quality) { 10 }
    let(:name) { 'item' }
    let(:item) { Item.new(name, initial_sell_in, initial_quality) }

    before { update_quality([item]) }

    describe "Normal item" do
      context "before sell date" do
        it "reduces quality and sell_in by one" do
          expect(item.quality).to eq (initial_quality - 1)
          expect(item.sell_in).to eq (initial_sell_in - 1)
        end
      end

      context "on sell date" do
        let(:initial_sell_in) { 0 }
        it "reduces quality by two" do
          expect(item.quality).to eq (initial_quality - 2)
          expect(item.sell_in).to eq (initial_sell_in - 1)
        end
      end
	
      context "after sell date" do
        let(:initial_sell_in) { -1 }  
        it "reduces quality by two" do
          expect(item.quality).to eq (initial_quality - 2)
          expect(item.sell_in).to eq (initial_sell_in - 1)
        end
      end
	  
      context "with zero quality" do
        let(:initial_quality) { 0 }
        it "quality cannot be reduced further" do
          expect(item.quality).to eq (0)
          expect(item.sell_in).to eq (initial_sell_in - 1)
        end
      end

    end

    describe "Legendary item" do
    let(:initial_quality) { 80 }
    let(:name) { 'Sulfuras, Hand of Ragnaros' }

      context "before sell date" do
        it "quality and sell_in remain unchanged" do
          expect(item.quality).to eq (initial_quality)
          expect(item.sell_in).to eq (initial_sell_in)
        end
      end

      context "on sell date" do
        let(:initial_sell_in) { 0 }
        it "quality and sell_in remain unchanged" do
          expect(item.quality).to eq (initial_quality)
          expect(item.sell_in).to eq (initial_sell_in)
        end
      end
	
      context "after sell date" do
        let(:initial_sell_in) { -1 }  
        it "quality and sell_in remain unchanged" do
          expect(item.quality).to eq (initial_quality)
          expect(item.sell_in).to eq (initial_sell_in)
        end
      end
	  
      context "with zero quality" do
        let(:initial_quality) { 0 }
        it "quality and sell_in remain unchanged" do
          expect(item.quality).to eq (initial_quality)
          expect(item.sell_in).to eq (initial_sell_in)
        end
      end

    end

    describe "Ageing Item" do
    let(:initial_quality) { 2 }
    let(:name) { 'Aged Brie' }

      context "before sell date" do
        it "increases quality by one" do
          expect(item.quality).to eq (initial_quality + 1)
          expect(item.sell_in).to eq (initial_sell_in - 1)
        end
      end

      context "on sell date" do
        let(:initial_sell_in) { 0 }
        it "increases quality by two" do
          expect(item.quality).to eq (initial_quality + 2)
          expect(item.sell_in).to eq (initial_sell_in - 1)
        end
      end
	
      context "after sell date" do
        let(:initial_sell_in) { -1 }  
        it "increases quality by two" do
          expect(item.quality).to eq (initial_quality + 2)
          expect(item.sell_in).to eq (initial_sell_in - 1)
        end
      end
	  
      context "with max quality" do
        let(:initial_quality) { 50 }
        it "quality cannot be increase further" do
          expect(item.quality).to eq (50)
          expect(item.sell_in).to eq (initial_sell_in - 1)
        end
      end

    end

    describe "Special Ageing Item" do
    let(:initial_quality) { 20 }
    let(:name) { 'Backstage passes to a TAFKAL80ETC concert' }

      context "on 11th sell date" do
        let(:initial_sell_in) { 11 }
        it "increases quality by one" do
          expect(item.quality).to eq (initial_quality + 1)
          expect(item.sell_in).to eq (initial_sell_in - 1)
        end
      end

      context "on 10th sell date" do
        let(:initial_sell_in) { 10 }
        it "increases quality by two" do
          expect(item.quality).to eq (initial_quality + 2)
          expect(item.sell_in).to eq (initial_sell_in - 1)
        end
      end
	
      context "on 6th sell date" do
        let(:initial_sell_in) { 6 }  
        it "increases quality by two" do
          expect(item.quality).to eq (initial_quality + 2)
          expect(item.sell_in).to eq (initial_sell_in - 1)
        end
      end

      context "on 5th sell date" do
        let(:initial_sell_in) { 5 }  
        it "increases quality by three" do
          expect(item.quality).to eq (initial_quality + 3)
          expect(item.sell_in).to eq (initial_sell_in - 1)
        end
      end

      context "on sell date" do
        let(:initial_sell_in) { 0 }
        it "quality dropped to zero" do
          expect(item.quality).to eq (0)
          expect(item.sell_in).to eq (initial_sell_in - 1)
        end
      end

      context "after the concert" do
        let(:initial_sell_in) { -1 }
        it "quality dropped to zero" do
          expect(item.quality).to eq (0)
          expect(item.sell_in).to eq (initial_sell_in - 1)
        end
      end
  
      context "with max quality" do
        let(:initial_quality) { 50 }
        it "quality cannot be increase further" do
          expect(item.quality).to eq (50)
          expect(item.sell_in).to eq (initial_sell_in - 1)
        end
      end

    end

    describe "Conjured Item" do
    let(:initial_quality) { 6 }
    let(:name) { 'Conjured Mana Cake' }

      context "before sell date" do
        it "reduces quality by two" do
          expect(item.quality).to eq (initial_quality - 2)
          expect(item.sell_in).to eq (initial_sell_in - 1)
        end
      end

      context "on sell date" do
        let(:initial_sell_in) { 0 }
        it "reduces quality by four" do
          expect(item.quality).to eq (initial_quality - 4)
          expect(item.sell_in).to eq (initial_sell_in - 1)
        end
      end
	
      context "after sell date" do
        let(:initial_sell_in) { -1 }  
        it "reduces quality by four" do
          expect(item.quality).to eq (initial_quality - 4)
          expect(item.sell_in).to eq (initial_sell_in - 1)
        end
      end
	  
      context "with zero quality" do
        let(:initial_quality) { 0 }
        it "quality cannot be reduce further" do
          expect(item.quality).to eq (0)
          expect(item.sell_in).to eq (initial_sell_in - 1)
        end
      end

    end

  end


  describe "with multiple items" do
    let(:items) {
      [
        Item.new("NORMAL ITEM", 5, 10),
        Item.new("Aged Brie", 3, 10),
      ]
    }

    before { update_quality(items) }
  
    it "quality should degrade or upgrade accordingly" do
          expect(items[0].quality).to eq (9)
          expect(items[0].sell_in).to eq (4)

          expect(items[1].quality).to eq (11)
          expect(items[1].sell_in).to eq (2)
    end
  end

end