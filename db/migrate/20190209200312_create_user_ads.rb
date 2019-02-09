class CreateUserAds < ActiveRecord::Migration[5.0]
  def change
    create_table :user_ads do |t|

      t.belongs_to :user, index: true
      t.belongs_to :advertisement, index: true
      t.timestamps

    end
  end
end
