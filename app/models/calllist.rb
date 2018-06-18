class Calllist < ApplicationRecord

  def self.import(file)
    CSV.foreach(file.path, headers:true) do |row|
      Calllist.create! row.to_hash
    end
  end

end
