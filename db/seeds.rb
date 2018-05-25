

50.times do |i|
     User.create(:name => "テスト #{i}",
                 :section => "所属#{i}",
                 :email => "renshu#{i}@email.co.jp",
                 :password => "password#{i}",
                 :password_confirmation => "password#{i}",
                 )
end