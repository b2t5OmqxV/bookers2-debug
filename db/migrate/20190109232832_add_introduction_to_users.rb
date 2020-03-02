class AddIntroductionToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :introduction, :text
    add_colume :users, :profile_image_id, :string 
    # add_colume string "profile_image_id"が消えてますよ！！#
  end
end
