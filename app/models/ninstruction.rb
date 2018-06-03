class Ninstruction < ApplicationRecord
  belongs_to :patient
enum actflag: {未実施:0, 実施:1, 中止:2}

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      # IDが見つかれば、レコードを呼び出し、見つかれなければ、新しく作成
      ninstruction = find_by(id: row["id"]) || new
      # CSVからデータを取得し、設定する
      ninstruction.attributes = row.to_hash.slice(*updatable_attributes)
      # 保存する
      ninstruction.save!
    end
  end 

  # 更新を許可するカラムを定義
  def self.updatable_attributes
    ["yoteitime", "acttime","actflag","sijiname","siji","patient_id"]
  end
 
end
