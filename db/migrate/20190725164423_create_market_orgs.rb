class CreateMarketOrgs < ActiveRecord::Migration[5.2]
  def change
    create_table :market_orgs do |t|
      t.string :repdesk_token
      t.string :api_url
      t.string :rep_group
      t.string :theme
      t.string :domain

      t.timestamps
    end
  end
end
