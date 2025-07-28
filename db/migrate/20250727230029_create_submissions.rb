class CreateSubmissions < ActiveRecord::Migration[8.0]
  def change
    create_table :submissions do |t|
      t.references :enrollment
      t.references :lesson
      t.references :mentor
      t.string :pull_request_url
      t.string :review_result
      t.datetime :reviewed_at
      t.timestamps
    end
  end
end
