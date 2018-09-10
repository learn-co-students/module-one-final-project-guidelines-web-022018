class CreateBeers < ActiveRecord::Migration[4.2]
  def change
    create_table :beers do |t|
      t.integer :apiid
      t.string :beername
      t.string :tagline
      t.string :description
      t.integer :abv
      t.integer :ibu
      t.integer :target_fg
      t.integer :target_og
      t.integer :srm
      t.integer :ph
      t.integer :attenuation_level
      t.string :volume
      t.string :boil_volume
      t.string :method
      t.string :ingredients
      t.string :food_pairing
      t.string :brewers_tips
      t.string :contributed_by
    end
  end
end
