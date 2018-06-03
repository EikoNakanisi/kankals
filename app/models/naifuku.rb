class Naifuku < ApplicationRecord
  belongs_to :patient
enum actflag: {未実施:0, 実施:1, 中止:2}
enum pattern: {定期処方:0, 臨時処方:1}

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      # IDが見つかれば、レコードを呼び出し、見つかれなければ、新しく作成
      naifuku = find_by(id: row["id"]) || new
      # CSVからデータを取得し、設定する
      naifuku.attributes = row.to_hash.slice(*updatable_attributes)
      # 保存する
      naifuku.save!
    end
  end 

  # 更新を許可するカラムを定義
  def self.updatable_attributes
    ["yoteitime", "acttime","actflag","sijiname","siji","pattern","patient_id"]
  end
 
end
