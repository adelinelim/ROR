MIN_QUALITY = 0
MAX_QUALITY = 50
SULFURAS = 'Sulfuras, Hand of Ragnaros'

def update_quality(items)
  items.each do |item|
    case item.name
    when 'Aged Brie'
      if is_expired?(item)
        add_quality(item, 2)
      else
        add_quality(item, 1)
      end

    when 'Backstage passes to a TAFKAL80ETC concert'
      if is_expired?(item)
        add_quality(item, -item.quality)
      elsif item.sell_in <= 5
        add_quality(item, 3)
      elsif item.sell_in <= 10
        add_quality(item, 2)
      else
        add_quality(item, 1)
      end

    when SULFURAS
      add_quality(item, 0)

    when 'Conjured Mana Cake'
      if is_expired?(item)
        add_quality(item, -4)
      else
        add_quality(item, -2)
      end

    else
      if is_expired?(item)
        add_quality(item, -2)
      else
        add_quality(item, -1)
      end
    end

    update_sell_in(item)
  end
end

def add_quality(item, value)
  item.quality += value
  adjust_min_max_quality(item)
end

def adjust_min_max_quality(item)
  if item.name != SULFURAS
    if item.quality > MAX_QUALITY
      item.quality = MAX_QUALITY
    elsif item.quality < MIN_QUALITY
      item.quality = MIN_QUALITY
    end
  end
end

def update_sell_in(item)
  if item.name != SULFURAS
    item.sell_in -= 1
  end
end

def is_expired?(item)
  item.sell_in <= 0
end

######### DO NOT CHANGE BELOW #########

Item = Struct.new(:name, :sell_in, :quality)