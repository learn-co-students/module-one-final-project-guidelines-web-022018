class CreateBeers < ActiveRecord::Migration[5.1]
  def change
    create_table :beers do |t|
      t.string :beername
      t.string :abv
      t.string :ibu
      t.string :srm
    end
  end
end
